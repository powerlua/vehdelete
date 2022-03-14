--█▀▀█ █▀▀█ █░░░█ █▀▀ █▀▀█--
--█░░█ █░░█ █▄█▄█ █▀▀ █▄▄▀--
--█▀▀▀ ▀▀▀▀ ░▀░▀░ ▀▀▀ ▀░▀▀--

-- // written by power !

local blowTimers = {}

function power()
	if source and getElementType(source) == "vehicle" then
		local veh = source
		setTimer(function() elementdatapowerlua( veh ) end,3000,1)
	end
end

addEventHandler("onVehicleExplode", getRootElement(), power)

function powerlua ( ply,seat )
    if #getVehicleOccupants(source) == 0 then
		local veh = source
		blowTimers[source] = setTimer(function() elementdatapowerlua( veh ) end,1800000,1)
	end
end
addEventHandler ( "onVehicleExit", getRootElement(), powerlua )

function powerdevelopment ( ply,seat )
    if #getVehicleOccupants(source) == 0 then
		if blowTimers[source] then
			killTimer(blowTimers[source]) 
		end
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), powerdevelopment )