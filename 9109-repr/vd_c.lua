local level=getElementData(localPlayer, "level") or 0
--if level<3 then return end

local sw,sh=guiGetScreenSize()

local server_str=""
local SERVER_UPDATE_INTERVAL=1000
local server_lu=getTickCount()



addEventHandler("onClientRender", root, function()
  local veh=getPedOccupiedVehicle(localPlayer)
  if not veh then return end

  local client_str=getVehicleDesc(veh)
  str=string.format("CLIENT DATA: %s\nSERVER DATA: %s\n\n/damagevehicle, /restream", client_str, server_str)
  dxDrawText(str, 0,0, sw,sh*2/3, -1, 1, "default", "center", "center")

  if getTickCount()>server_lu then
    triggerServerEvent("getVehicleData", resourceRoot, veh)
    server_lu=getTickCount()+SERVER_UPDATE_INTERVAL
  end
end)

addEvent("fillVehicleData", true)
addEventHandler("fillVehicleData", resourceRoot, function(str)
  server_str=str
end)

addCommandHandler("damagevehicle", function()
  local veh=getPedOccupiedVehicle(localPlayer)
  for i=0,6 do setVehiclePanelState(veh, i, 3) end
  for i=0,5 do setVehicleDoorState(veh, i, math.random(4,4)) end
  for i=0,3 do setVehicleLightState(veh, i, 1) end
end)

