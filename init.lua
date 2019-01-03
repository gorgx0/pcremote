GPIO2=1
GPIO0=2
gpio.mode(GPIO0,gpio.OUTPUT)
gpio.write(GPIO0,0)
gpio.mode(GPIO2,gpio.OUTPUT)
gpio.write(GPIO2,0)
dofile("wifi.lua")
