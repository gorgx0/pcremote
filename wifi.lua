wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, 
    function(T)
        print("STA - GOT IP")
        print("Station IP: "..T.IP)
        print("Subnet mask: "..T.netmask)
        print("Gateway IP: "..T.gateway)
        quickBlink()
        dofile("mqtt.lua")
    end
)



wifi.setmode(wifi.STATION)
station_cfg={}
station_cfg.ssid="*****"
station_cfg.pwd="**********"
station_cfg.save=false
wifi.sta.config(station_cfg)
wifi.sta.connect(
    function(SSID,BSSID,CHANNEL)
        print("\nConnected:")
    end
)


function quickBlink()
    pin = 0
--    gpio.mode(pin,gpio.OUTPUT)
    gpio.write(pin,0)
    tmr.delay(200000)
    gpio.write(pin,1)
    tmr.delay(200000)
    gpio.write(pin,0)
    tmr.delay(200000)
    gpio.write(pin,1)
    tmr.delay(200000)
    gpio.write(pin,0)
    tmr.delay(200000)
    gpio.write(pin,1)
    tmr.delay(200000)
    gpio.write(pin,0)
    tmr.delay(200000)
    gpio.write(pin,1)
end
