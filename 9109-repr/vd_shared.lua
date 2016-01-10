
function getVehicleDesc(veh)
  if not isElement(veh) then return false end

  local pstates={}
  for i=0,6 do
    pstates[i+1]=getVehiclePanelState(veh, i) or -1
  end

  local dstates={}
  for i=0,5 do
    dstates[i+1]=getVehicleDoorState(veh, i) or -1
  end

  local lstates={}
  for i=0,3 do
    lstates[i+1]=getVehicleLightState(veh, i) -- and "t" or "f"
  end

  local str=string.format("Vehicle model: %d, health: %d, panels: %s, doors: %s, lights: %s", 
                          getElementModel(veh), getElementHealth(veh), 
                          table.concat(pstates,","), table.concat(dstates, ","), table.concat(lstates, ","))

  return str
end

