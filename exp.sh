#!/bin/bash


for i in $(seq 1 1 100000000)
do
	
	date +%F_%T >> routes_dc.txt 
	echo "San Pablo Linux... $i"
	traceroute www5.usp.br >> routes_sp.txt
	echo "San Pablo propio $i"
	sudo python traceroute.py www5.usp.br >> routes_sp.txt


	date +%F_%T >> routes_jp.txt
	echo "Tokio Linux... $i"
	traceroute www.u-tokyo.ac.jp >> routes_jp.txt
	echo "Tokio propio $i"
	sudo python traceroute.py www.u-tokyo.ac.jp >> routes_jp.txt

	#date +%F_%T >> routes_en.txt
	#echo "Oxford Linux... $i"
	#traceroute www.ox.ac.uk >> routes_en.txt
	#echo "Oxford propio $i"
	#sudo python traceroute.py www.ox.ac.uk >> routes_en.txt

	date +%F_%T >> routes_en.txt
	echo "India Linux... $i"
	traceroute www.iitkgp.ac.in >> routes_in.txt
	echo "India propio $i"
	sudo python traceroute.py www.iitkgp.ac.in >> routes_in.txt

	date +%F_%T >> routes_au.txt
	echo "Sydney Linux... $i"
	traceroute sydney.edu.au >> routes_au.txt
	echo "Sydney propio $i"
	sudo python traceroute.py sydney.edu.au >> routes_au.txt

	date +%F_%T >> routes_it.txt
	echo "Milan Linux... $i"
	traceroute www.unimi.it >> routes_it.txt
	echo "Milan propio $i"
	sudo python traceroute.py www.unimi.it >> routes_it.txt

done

