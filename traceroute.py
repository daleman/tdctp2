import sys
import datetime
from scapy.all import *

if __name__ == '__main__':
	if len(sys.argv) > 1:
		dest = sys.argv[1]
	else:
		dest = 'www.dc.uba.ar'

#	traceroute(dest)
	limit = 25
	tries = 5

	# Medidas
	ips = []
	averages = []
	for ttlive in range(1,limit+1)
		times = []
		for i in range(0,tries):
			a = datetime.datetime.now()
			pkt = sr(IP(dst=dest, ttl=ttlive) / ICMP())
			b = datetime.datetime.now()
			delta = b-a
			times.append(delta.seconds*1000 + delta.microseconds/1000)
			ips.append(pkt[0][IP].src)
			pkt[0][ICMP].display()
		averages.append(sum(times)/len(times))
		pkt[0][ICMP].type
		if (pkt[0][ICMP].type == "echo-reply"):
			break

	# Cálculos
	relatives = [(averages[0],ips[0])]
	for i in range(1,len(averages)):
		relatives.append((averages[i]-averages[i-1],ips[i]))
	relatives
	relatives.sort(key=lambda x : x[0]) # Ordeno según el tiempo relativo
	relatives
	sample_mean = sum(relatives)/len(relatives)
	sample_sd = 0
	for r in relatives:
		sample_sd += (r - sample_mean)*(r - sample_mean)
	sample_sd = sqrt(sample_sd/(len(relatives)-1))
	taus = [0,0,1.1511,1.4250,1.5712,1.6563,1.7110,1.7491,1.7770,1.7984,1.8153,1.8290,1.8403,	
		1.8498,1.8579,1.8649,1.8710,1.8764,1.8811,1.8853,1.8891,1.8926,1.8957,1.8985,1.9011]
	tau = taus[len(relatives)]
	outliers = []
	for i in range(0,len(relatives)):
		if (abs(relatives[i]-sample_mean) > tau*sample_sd):
			print("Outlier (" + i + "): " + relatives[i])
			outliers.append(i)
