MQTT_HOST="m21.cloudmqtt.com"
MQTT_USER="****************"
MQTT_PASSWORD="***************"
MQTT_PORT=16980
LEDPIN=0
GPIO2=1
GPIO0=2

m = mqtt.Client("node_6885127",60,MQTT_USER,MQTT_PASSWORD)
m:lwt("/lwt","offline",0,0)
m:on("connect", function(client) print ("connected###") end)
m:on("offline", function(client) print ("offline") end)
m:on("message", function(client, topic, data) 
    print(topic .. ":" ) 
    if data ~= nil then
      print(data)
    end
    if topic == "/led" and data=="on" then 
        print "LED ON" 
        ledOn()
    end
    if topic == "/led" and data=="off" then
        print "LED OFF" 
        ledOff()
    end
    if topic == "/led" and data=="disco" then
        print "MQTT OFF"
        client:close()
    end
    if topic == "/gpio2" and data=="on" then
        gpio2On()
    end
    if topic == "/gpio2" and data=="off" then
        gpio2Off()
    end
    if topic == "/gpio0" and data=="on" then
        gpio0On()
    end
    if topic == "/gpio0" and data=="off" then
        gpio0Off()
    end
end)

m:connect(MQTT_HOST, MQTT_PORT, 0, 0, function(client)
      print("connected")
      client:subscribe("/led", 0, function(client) print("subscribe /led success") end)
      client:subscribe("/gpio2", 0, function(client) print("subscribe /gpio2 success") end)
      client:subscribe("/gpio0", 0, function(client) print("subscribe /gpio0 success") end)
      client:subscribe("/topic", 0, function(client) print("subscribe /topic success") end)
      client:publish("/topic", "hello", 0, 0, function(client) print("sent") end)
    end,
    function(client, reason)
      print("failed reason: " .. reason)
    end
)

function ledOn()
    gpio.mode(LEDPIN,gpio.OUTPUT)
    gpio.write(LEDPIN,0)
end

function ledOff()
    gpio.write(LEDPIN,1)
    gpio.mode(LEDPIN,gpio.OUTPUT)
end

function gpio2On()
    gpio.mode(GPIO2,gpio.OUTPUT)
    gpio.write(GPIO2,1)
end

function gpio2Off()
    gpio.mode(GPIO2,gpio.OUTPUT)
    gpio.write(GPIO2,0)
end

function gpio0On()
    gpio.mode(GPIO0,gpio.OUTPUT)
    gpio.write(GPIO0,1)
end

function gpio0Off()
    gpio.mode(GPIO0,gpio.OUTPUT)
    gpio.write(GPIO0,0)
end

gpio2Off()
gpio0Off()
