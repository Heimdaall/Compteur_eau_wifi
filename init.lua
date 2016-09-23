gpio.mode(1,gpio.INPUT)
gpio.mode(2,gpio.INPUT)
gpio.mode(5,gpio.INPUT)
gpio.mode(6,gpio.INPUT)
gpio.write(1, gpio.LOW)
gpio.write(2, gpio.LOW)
gpio.write(5, gpio.LOW)
gpio.write(6, gpio.LOW)
tabInput={1,2,5,6}
INI = require 'inifile';
-- Begin WiFi configuration
inifile = INI.load('config.ini');
protect = INI.load('auth.ini');
inputs = INI.load('inputs.ini');
modeIni = INI.load('init.ini');
local wifiConfigStation = {}
wifiConfigStation.mode = wifi.STATION  -- both station and access point
wifiConfigStation.stationPointConfig = {}
wifiConfigStation.stationPointConfig.ssid = inifile.network.ssid
wifiConfigStation.stationPointConfig.pwd =  inifile.network.pass
local mode;
mode = inifile.network.mode
local cfgip ={};
cfgip.ip = inifile.network.ip
cfgip.netmask = inifile.network.mask
cfgip.gateway = inifile.network.gateway
wifi.sta.setip(cfgip)
wifi.sta.autoconnect(1)
wifi.sta.config(wifiConfigStation.stationPointConfig.ssid, wifiConfigStation.stationPointConfig.pwd)
local joinCounter = 0
local joinMaxAttempts = 5
tmr.alarm(0, 3000, 1, function()
   local ip = wifi.sta.getip()
   local status = wifi.sta.status()
   if status ~= 5 then
      print('Connecting to WiFi Access Point ...')
   else
		print("IP : "..ip)
      tmr.stop(0)
   end
end)
valin1 = 0
valin2 = 0
valin3 = 0
valin4 = 0
eventin1=0
eventin2=0
eventin3=0
eventin4=0
temperature = -99
dofile("inputs.lc")
dofile("httpserver.lc")(80)
tmr.alarm(3,30000,1,
		function ()
			wifi.sta.connect()
			dofile("temp.lua")
		end)
collectgarbage()
