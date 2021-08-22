#!/usr/bin/python
print ("Starting Recon")
print ("Tools- findomain,subfinder,assetfinder,amass actve and passive,sublist3r")
from subprocess import Popen, PIPE
import sys



domain = sys.argv[1]
commands = [ 'findomain -t '+domain+' -o;subfinder -d '+domain+' -o '+domain+'_subfinder.txt ;assetfinder --subs-only '+domain+' >> '+domain+'_assetfinder.txt; amass enum -d '+domain+' -o '+domain+'_amass.txt ; python /home/kali/subbrute/subbrute.py '+domain+' -o '+domain+'_subbrute.txt ; amass enum --passive -d '+domain+' -o '+domain+'_amass_passive.txt;amass enum  -src -ip -brute -min-for-recursive 2 -d '+domain+' -o '+domain+'_amass_passive.txt; gau -subs '+domain+' | cut -d / -f 3 | sort -u - '+domain+'_gau.txt; sublist3r -d '+domain+' -o '+domain+'_sublist3r.txt ;cat *.txt | sort -u >> '+domain+'_final_domains.txt ;cat '+domain+'_final_domains.txt | sort -u >> valid_subs.txt;']
count = 0  
processes = []
for com in commands:
    print ("Recon Started...............")
    processes.append(Popen(com, shell=True))
    count += 1
    print ("[OK] command "+str(count)+" running successfully.")
else:
    print ("Recon Finished by S1N6H......")

for i, process in enumerate(processes):
    process.wait()
    print ("Command #{} finished".format(i))
