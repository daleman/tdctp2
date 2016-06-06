import sys
import datetime
import math
from scapy.all import *

if __name__ == '__main__':
	if len(sys.argv) > 1:
		dest = sys.argv[1]
	else:
		dest = 'www.dc.uba.ar'

	#traceroute(dest)
	#sys.exit()
	limit = 25
	tries = 5
	to = 10

	# Medidas
	ips = []
	averages = []
	for ttlive in range(1,limit+1):
		times = []
		ip = "Unknown"
		destino_alcanzado = False
		for i in range(0,tries):
			start = datetime.datetime.now()
			pkt = sr(IP(dst=dest, ttl=ttlive) / ICMP(), timeout=to)
			fin = datetime.datetime.now()
			delta = fin-start
			times.append(delta.seconds*1000 + delta.microseconds/1000)
			if (len(pkt[0]) > 0):
				if (ip == "Unknown"):
					ip = pkt[0][0][1].src
				elif (ip!=pkt[0][0][1].src):	#si cambio de ruta, termino la ejecucion
					print("Cambio de Ruta!")
					sys.exit()
				if (pkt[0][0][1].type == 0):
					destino_alcanzado = True
		if (ip == "Unknown"):
			print("Error: Lost all packages to hop " + str(ttlive))
			print("Ignoring hop")
			#print("Current route: " + str(ips))
			#sys.exit()
		else:
			ips.append(ip)
			#print("Times " + str(ttlive) + ": " + str(times))##
			avg = sum(times)/len(times)
			#print(" -> Avg: " + str(avg))##
			averages.append(avg)
			if (destino_alcanzado==True):
				break

	print("IPs: " + str(ips))##
	print("Times: " + str(averages))##

	# Calculos
	relatives = [(0,ips[0])] # Podemos asumir que el tiempo al primer hop es nulo*
	for i in range(1,len(averages)):
		relatives.append((averages[i]-averages[i-1],ips[i]))
	relatives.sort(key=lambda x : x[0]) # Ordeno segun el tiempo relativo
	sample_mean = sum(map(lambda x: x[0], relatives))/len(relatives)
	print("Average: " + str(sample_mean))##
	sample_sd = 0
	for r in map(lambda x: x[0], relatives):
		sample_sd += (r - sample_mean)*(r - sample_mean)
	sample_sd = math.sqrt(sample_sd/(len(relatives)-1))
	print("std Deviation: " + str(sample_sd))##
	taus = [0,0,1.1511,1.4250,1.5712,1.6563,1.7110,1.7491,1.7770,1.7984,1.8153,1.8290,1.8403,	
		1.8498,1.8579,1.8649,1.8710,1.8764,1.8811,1.8853,1.8891,1.8926,1.8957,1.8985,1.9011]
	tau = taus[len(relatives)]
	outliers = []
	for i in range(0,len(relatives)):
		if (abs(relatives[i][0]-sample_mean) > tau*sample_sd):
			print("Outlier (" + relatives[i][1] + "): " + str(relatives[i][0]))
			outliers.append(i)
	print("Outliers: " + str(outliers))

#*: Si no, estamos agregandole al primer hop el tiempo de procesamiento incluido en construir el paquete y enviarlo.
