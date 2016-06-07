import sys
import datetime
import math
from scapy.all import *
import requests
import json
import time

def geo(ip):
	send_url = 'http://freegeoip.net/json/' + ip
	r = requests.get(send_url)
	try:
		j = json.loads(r.text)
	except ValueError:
		return geo(ip)
	#lat = j['latitude']
	#lon = j['longitude']
	#city = j['city']
	#ctry = j['country_name']
	
#	print "Latitud: " + str(lat) + " Longitud: " + str(lon) + "Country: " + ctry 
	return j
	
def gnuploter(exp):
	f = open(exp + ".gnuplot","w")
	f.write(
	'''
	set terminal png size 1920,1080 background rgb "#aaaaff"
	set output "''' + exp + '''.png"
	set size 1,1
	 
	plot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa", \
		"" with l ls 2, \
		"''' + exp + '''.cor" with linespoint pt 7 lc rgb "black" lw 2
	''')

if __name__ == '__main__':
	if len(sys.argv) > 1:
		dest = sys.argv[1]		# destino de tracerout por parametro
	else:
		dest = 'www.dc.uba.ar'	# el dc.uba.ar es el destino por defecto

	#traceroute(dest)
	#sys.exit()
	limit = 30
	tries = 5
	to = 1

	# Mediciones
	ips = []
	hops = [] 	# incluye los hops nulos
	rtts = []
	# Asumimos que ninguna ruta tiene mas de limit+1 hops hasta el destino
	for ttlive in range(1,limit+1):		
		deltas = []
		ip = "Unknown"
		destino_alcanzado = False
		for i in range(0,tries):
			start = datetime.datetime.now()
			pkt = sr(IP(dst=dest, ttl=ttlive) / ICMP(), timeout=to, verbose=False)
			fin = datetime.datetime.now()
			# RTT hasta el hop actual
			delta = fin-start			
			deltas.append(delta.seconds*1000 + delta.microseconds/1000)
			if (len(pkt[0]) > 0):
				if (ip == "Unknown"):
					ip = pkt[0][0][1].src
				# Si cambio de ruta, termino la ejecucion
				elif (ip!=pkt[0][0][1].src):
					print("Cambio de Ruta!")
					sys.exit()
				if (pkt[0][0][1].type == 0):
					destino_alcanzado = True
		if (ip == "Unknown"):
			hops.append("")
		else:
			ips.append(ip)
			hops.append(ip)
			avg = sum(deltas)/len(deltas)
			rtts.append(avg)
			# Si ya llegue, dejo de iterar
			if (destino_alcanzado==True):
				break

	
	# Calculos
	relatives = [(0,ips[0])] # Podemos asumir que el tiempo al primer hop es nulo*
	for i in range(1,len(rtts)):
		relatives.append((rtts[i]-rtts[i-1],ips[i]))
	geos = []
	j = 0
	for i in range(len(hops)):
		if hops[i]== "":
			print str(i) + " * * *"
		else:
			if relatives[j][0] >=0:
				sign="+"
			else:
				sign = ""
			geoloc = geo(ips[j])
			geos.append(geoloc)
			print str(i) + " " + ips[j] + "\t" + str(rtts[j]) + " ms\t" + sign + str(relatives[j][0]) + "\t" + geoloc["city"].encode('ascii','replace')+ " (" + str(geoloc["country_name"].encode('ascii','replace')) + ")"
			j = j+1

	hora = time.strftime("%H_%M")		
	gnuploter(dest+hora)
	
	
	f = open(dest + hora + ".cor","a")
	for g in geos:
		if abs (g["latitude"]) > 0.0001 and abs(g["longitude"]) > 0.0001 :
			f.write(str(g["longitude"]) + "\t" + str(g["latitude"]) + "\n")
	f.close()
	relatives.sort(key=lambda x : x[0]) # Ordeno segun el tiempo relativo
	sample_mean = sum(map(lambda x: x[0], relatives))/len(relatives)
	print("Average: " + str(sample_mean))##
	sample_sd = 0
	for r in map(lambda x: x[0], relatives):
		sample_sd += (r - sample_mean)*(r - sample_mean)
	sample_sd = math.sqrt(sample_sd/(len(relatives)-1))
	print("Std Deviation: " + str(sample_sd))##
	taus = [0,0,1.1511,1.4250,1.5712,1.6563,1.7110,1.7491,1.7770,1.7984,1.8153,1.8290,1.8403,	
		1.8498,1.8579,1.8649,1.8710,1.8764,1.8811,1.8853,1.8891,1.8926,1.8957,1.8985,1.9011]
	tau = taus[len(relatives)-1]
	outliers = []
	for i in range(0,len(relatives)):
		if (abs(relatives[i][0]-sample_mean) > tau*sample_sd):
			print("Outlier (" + relatives[i][1] + "): " + str(relatives[i][0]))
			outliers.append(i)
	

	#*: Si no, estamos agregandole al primer hop el tiempo de procesamiento incluido en construir el paquete y enviarlo.

