
addEvent("getVehicleData", true)

addEventHandler("getVehicleData", resourceRoot, function(veh)
  local str=getVehicleDesc(veh)
  triggerClientEvent(client, "fillVehicleData", resourceRoot, str)
end)

addCommandHandler("restream", function(plr, cmd)
  veh=getPedOccupiedVehicle(plr)

  outputChatBox("Moving you far away...", plr)

  removePedFromVehicle(plr)
  local x,y,z=getElementPosition(plr)
  setElementPosition(plr, 0,0, 5000)
  setTimer(function(plr,x,y,z)
    outputChatBox("Bringing you back...", plr)
    setElementPosition(plr, x,y,z)
  end, 1000, 1, plr, x,y,z)

  if veh then
    setTimer(function(plr, veh)
      warpPedIntoVehicle(plr, veh)
    end, 1200, 1, plr, veh)
  end
end)