###################################################################
# fablicator-rpc.py                                               #
#                                                                 #
# Example script demonstrating local connection to XMLRPC server. #
###################################################################

# Documentation @ https://docs.python.org/3/library/xmlrpc.client.html
import xmlrpc.client
import time

# Define the port of the RPC server
PORT = "7978"

# Set extruder temperature
# PARAMETERS
#   proxy: ProxyServer
#   extruder: integer
#   temperature: float
# RETURNS void
def set_extruder_temperature(proxy, extruder, temperature):
    proxy.send("M104 T%d S%.1f" % (extruder, temperature))

# Open the server on local host with the specified port.
with xmlrpc.client.ServerProxy("http://localhost:%s/" % PORT) as proxy:
    # Set extruder temperature
    set_extruder_temperature(proxy, 1, 100)
    # Wait for temperature to reach 100 C
    while True:
        printer_status = proxy.status()
        # Print the current temperature of the right extruder ( ex. "T1 @ 40 C" )
        print("T1 @ %s C" % printer_status["temps"]["T1"][0])
        right_ext_temp = float(printer_status["temps"]["T1"][0])
        # Break loop when the temperature is reached
        if right_ext_temp >= 100:
            print("Reached temperature!")
            break
        time.sleep(1)
