import sys
import datetime

now = datetime.datetime.now()
print("")
print ("Current date and time: ")
print("--------------------")
print (now.strftime("%Y-%m-%d %H:%M:%S"))

print("")
print("Python version")
print("--------------------")
print (sys.version)
print("")