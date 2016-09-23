collectgarbage()
tLastcount1=0
tLastcount2=0
tLastcount3=0
tLastcount4=0
function in1Count(level)
     if  (tmr.now()<tLastcount1) or  (tmr.now()-tLastcount1 > 20000) then -- only 1x per 0.2 sec, or overflow of tmr.now
        tLastcount1=tmr.now()
		if level == 0 then 
			valin1 = valin1 +1
			
		end
    end
end
function in2Count(level)
     if  (tmr.now()<tLastcount2) or (tmr.now()-tLastcount2 > 20000) then -- only 1x per 0.2 sec, or overflow of tmr.now
        tLastcount2=tmr.now()
		if level == 0 then 
			valin2 = valin2 +1
		end
     end

end
function in3Count(level)
     if  (tmr.now()<tLastcount3) or  (tmr.now()-tLastcount3 > 20000) then -- only 1x per 0.2 sec, or overflow of tmr.now
        tLastcount3=tmr.now()
		if level == 0 then 
			valin3 = valin3 +1
			
		end
     end
end
function in4Count(level)
     if  (tmr.now()<tLastcount4) or  (tmr.now()-tLastcount4 > 20000) then -- only 1x per 0.2 sec, or overflow of tmr.now
        tLastcount4=tmr.now()
		if level == 0 then 
			valin4 = valin4 +1
		end
   end
end
if (tonumber(inputs.INPUTS.in1)==1) then 
	gpio.mode(tonumber(tabInput[1]),gpio.INT)
	gpio.trig(tonumber(tabInput[1]), "down",in1Count) 
else
	gpio.mode(tonumber(tabInput[1]),gpio.INPUT)
end
if (tonumber(inputs.INPUTS.in2)==1) then 
	gpio.mode(tonumber(tabInput[2]),gpio.INT)
	gpio.trig(tonumber(tabInput[2]), "down",in2Count) 
else
	gpio.mode(tonumber(tabInput[2]),gpio.INPUT)
end
if (tonumber(inputs.INPUTS.in3)==1) then 
	gpio.mode(tonumber(tabInput[3]),gpio.INT)
	gpio.trig(tonumber(tabInput[3]), "down",in3Count) 
else
	gpio.mode(tonumber(tabInput[3]),gpio.INPUT)
end

if (tonumber(inputs.INPUTS.in4)==1) then 
	gpio.mode(tonumber(tabInput[4]),gpio.INT)
	gpio.trig(tonumber(tabInput[4]), "down",in4Count) 
else
	gpio.mode(tonumber(tabInput[4]),gpio.INPUT)
end