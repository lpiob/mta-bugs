--[[

skrypt eliminujacy bug z desynchronizacja paneli i drzwi pojazdu
http://bugs.mtasa.com/view.php?id=9109
http://bugs.mtasa.com/view.php?id=8714

naprawione w 1.5.1r7751 - https://github.com/multitheftauto/mtasa-blue/commit/65a55788168c8cea5c07b5651430d0e38de01d8b

skrypt aplikuje obejście tylko jesli gracz posiada wersję niższą niż ww.

@license MIT

]]--

if (getVersion().sortable>="1.5.1-9.07758.0") then
  return
end

addEventHandler("onClientElementStreamIn", root, function()
  if getElementType(source)~="vehicle" then return end

  local state

  for i=0,6 do
    state=getVehiclePanelState(source, i) or 0
    if state~=0 then
      setVehiclePanelState(source, i, 0)
      setVehiclePanelState(source, i, state)
    end
  end

  for i=0,5 do
    state=getVehicleDoorState(source, i) or 0
    if state~=0 then
      setVehicleDoorState(source, i, 0)
      setVehicleDoorState(source, i, state)
    end
  end
end)