# Enabling the XMLRPC server in Fablicator Interface

> To do this currently, you must be using the experimental version of the Fablicator Interface. (https://github.com/Fablicator/Fablicator-Software-Dist/tree/fablicator-interface-testing)

1. Go to Settings > Options
2. In the **Printer settings** tab, check the **Expose XMLRPC server**
3. Restart the interface

To get the port for the RPC server, go to **Help > About** and the port is there

# Sending commands with Python

Python 3.8 comes with the `xmlrpc` library which is used to create a client to send commands to an XMLRPC server.

## Creating a client

A client is created by instantiating a new `ServerProxy`:
```python
import xmlrpc.client

with xmlrpc.client.ServerProxy("http://localhost:7978/") as proxy:
    # Client code
```

The proxy contains a method for each command registered on the server.

> The functions are registered in the file https://github.com/Fablicator/Printrun/blob/master/printrun/rpc.py

# List of commands
> Run these commands in the `# Client code` section

## `proxy.status()`

Query the status of the printer

### Returns
- Dictionary : Structure containing the status of the printer

## `proxy.settemp(target_temp: float)`
Set the temperature of the currently active extruder
(equivalent to `proxy.send("M104 S<target_temp>")`)
### Parameters
- target_temp: Target temperature of the current extruder

## `proxy.setbedtemp(target_temp: float)`
Set the temperature of the bed
(equivalent to `proxy.send("M140 S<target_temp>")`)
### Parameters
- target_temp: Target temperature of the bed

## `proxy.load_file(filename: string)`
Load a file on the machine
### Parameters
- filename: Path to the file on the machine
  
## `proxy.startprint()`
Start a print on the machine

## `proxy.pauseprint()`
Pause a running print on the machine

## `proxy.resumeprint()`
Resume a paused print on the machine

## `proxy.sendhome()`
Home the printer
(equivalent to `proxy.send("G28")`)
## `proxy.connect()`
Connect to the serial port set on the printer's interface

## `proxy.disconnect()`
Disconnect from serial port

## `proxy.send(command: string)`
Send a GCode command to the printer
### Parameters
- command: Command to send to the printer

# Running the example python script

1. Open a powershell in this directory
2. Type `python fablicator-rpc.py`