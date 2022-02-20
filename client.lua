--
--	#     #
--	##    #  ######  #    #  ######   ####   #    #   ####
--	# #   #  #       ##  ##  #       #       #    #  #
--	#  #  #  #####   # ## #  #####    ####   #    #   ####
--	#   # #  #       #    #  #            #  #    #       #
--	#    ##  #       #    #  #       #    #  #    #  #    #
--	#     #  ######  #    #  ######   ####    ####    ####
--
-- Created by Nemesus for ESX Framework
-- Website: https://nemesus.de
-- Youtube: https://youtube.nemesus.de

-- Console / Delete if you want

print("^0======================================================================^7")
print("^0ESX_WSDC loaded:")
print("^0[^4Author^0] ^7:^0 ^0Nemesus | Version 1.0.0^7")
print("^0[^2Website^0] ^7:^0 ^5https://nemesus.de^7")
print("^0[^2Youtube^0] ^7:^0 ^5https://youtube.nemesus.de^7")
print("^0======================================================================^7")

-- ONLY EDIT IF YOU KNOW WHAT YOU ARE DOING!

-- Locales
ESX = nil
xSound = exports.xsound
local PlayerData = {}
local vehicleCreated = nil
local musicPlayed = false
local objectSpeaker1Created = nil
local objectSpeaker2Created = nil
local objectSpeaker3Created = nil
local objectEngineCreated = nil
local objectLightCreated = nil

-- ESX Stuff
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

-- Register Net Events
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent("wsdc:soundStatus")
AddEventHandler("wsdc:soundStatus", function(type, musicId, data)
    if type == "position" then
        if xSound:soundExists(musicId) then
            xSound:Position(musicId, data.position)
	        xSound:Distance(musicId, 18)
        end
    end

    if type == "play" then
        xSound:PlayUrlPos(musicId, data.link, 0.4, data.position)
        xSound:Distance(musicId, 18)
	    xSound:setSoundLoop(musicId,true)
    end

    if type == "stop" then
		if xSound:soundExists(musicId) then
	  		xSound:Destroy(musicId)
		end
    end
end)

RegisterNetEvent("wsdc:createCar")
AddEventHandler("wsdc:createCar", function(source, args)
    if not vehicleCreated then
        ESX.TriggerServerCallback("esx_wsdc:getGroup", function(playerRank)
            if playerRank ~= "user" then
                musicPlayed = false
                vehiclehash = GetHashKey('cheetah')
                RequestModel(vehiclehash)
                while not HasModelLoaded(vehiclehash) do
                    Citizen.Wait(100)
                end
                local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.5, 0.5))
                vehicleCreated = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId()+90, true, false))
		Citizen.Wait(175)
		SetEntityAsMissionEntity(vehicleCreated, true, true)
                SetVehicleOnGroundProperly(vehicleCreated)
                SetVehicleNeonLightEnabled(vehicleCreated, 0, true);
                SetVehicleNeonLightEnabled(vehicleCreated, 1, true);
                SetVehicleNeonLightEnabled(vehicleCreated, 2, true);
                SetVehicleNeonLightEnabled(vehicleCreated, 3, true);
                SetVehicleNeonLightEnabled(vehicleCreated, 4, true);
                SetVehicleNeonLightsColour(vehicleCreated, 0, 255, 255);
                SetVehicleTyresCanBurst(vehicleCreated, true);
                SetVehicleMaxSpeed(vehicleCreated, 500*3.6);
                SetVehicleNumberPlateText(vehicleCreated, "Gangster")
                SetVehicleEngineOn(vehicleCreated, true, true, true);
                SetVehicleWindowTint(vehicleCreated, 2);
                SetVehicleStrong(vehicleCreated, true);
                SetVehicleModKit(vehicleCreated, 0);
                SetVehicleMod(vehicleCreated, 0, 2, false);
                SetVehicleMod(vehicleCreated, 4, 2, false);
                SetVehicleMod(vehicleCreated, 11, 5, false);
                SetVehicleMod(vehicleCreated, 12, 4, false);
                SetVehicleMod(vehicleCreated, 13, 4, false);
                SetVehicleMod(vehicleCreated, 14, 5, false);
                SetVehicleMod(vehicleCreated, 30, 2, false);
                SetVehicleMod(vehicleCreated, 23, 37, false);
                SetVehicleMod(vehicleCreated, 1, 1, false);
                SetVehicleMod(vehicleCreated, 2, 1, false);
                SetVehicleMod(vehicleCreated, 38, 1, false);
                SetVehicleCustomPrimaryColour(vehicleCreated, 196, 202, 206);
                SetVehicleCustomPrimaryColour(vehicleCreated, 50, 51, 52);
                SetVehicleBoostActive(vehicleCreated, 1, 0)
                SetVehicleForwardSpeed(vehicleCreated, 25)
                objectSpeaker1Created = CreateObject(GetHashKey("prop_speaker_06"), x, y, z, true, true, true)
                objectSpeaker2Created = CreateObject(GetHashKey("prop_speaker_06"), x, y, z, true, true, true)
                objectSpeaker3Created = CreateObject(GetHashKey("prop_speaker_06"), x, y, z, true, true, true)
                objectEngineCreated = CreateObject(GetHashKey("prop_car_engine_01"), x, y, z, true, true, true)
                objectLightCreated = CreateObject(GetHashKey("prop_air_lights_02b"), x, y, z, true, true, true)
                AttachEntityToEntity(objectSpeaker1Created, vehicleCreated, 0, 0.80, -1.25, 0.69, 0.3, 90.0, 90.0, 0, 0, 1, 0, 0, 1)
                AttachEntityToEntity(objectSpeaker2Created, vehicleCreated, 0, -0.80, -1.25, 0.69, 0.3, 90.0, -90.0, 0, 0, 1, 0, 0, 1)
                AttachEntityToEntity(objectSpeaker3Created, vehicleCreated, 0, -0.03, 0.25, 0.93, 0.3, 90.0, 180.0, 0, 0, 1, 0, 0, 1)
                AttachEntityToEntity(objectEngineCreated, vehicleCreated, 0, -0.03, 2.1, 0.13, 0.0, 0.0, 180.0, 0, 0, 1, 0, 0, 1)
                AttachEntityToEntity(objectLightCreated, vehicleCreated, 0, -0.03, 0.25, 1.06, 0.3, 0.0, 180.0, 0, 0, 1, 0, 0, 1)
                FreezeEntityPosition(objectSpeaker1Created, true)
                FreezeEntityPosition(objectSpeaker2Created, true)
                SetVehRadioStation(vehicleCreated,"OFF")
                ESX.ShowNotification("~g~Gangster Fahrzeug wurde erfolgreich gespawnt!")
                TriggerServerEvent("wsdc:soundStatus", "stop", "sound_wsdc_"..PlayerPedId(), { position = pos, link = "https://www.youtube.com/watch?v=wKC-D3Dez9c" })
            else
                ESX.ShowNotification("~r~Du bist nicht berechtigt dieses Fahrzeug zu spawnen!")
            end
        end)
    else
        DeleteObject(objectSpeaker1Created)
        DeleteObject(objectSpeaker2Created)
        DeleteObject(objectSpeaker3Created)
        DeleteObject(objectEngineCreated)
        DeleteObject(objectLightCreated)
	DeleteVehicle(vehicleCreated)
	Citizen.Wait(5)
        vehicleCreated = nil
        objectSpeaker1Created = nil
        objectSpeaker2Created = nil
        objectSpeaker3Created = nil
        objectEngineCreated = nil
        objectLightCreated = nil
	musicPlayed = false
        ESX.ShowNotification("~r~Du hast das Gangster Fahrzeug erfolgreich gelöscht!")
	TriggerServerEvent("wsdc:soundStatus", "stop", "sound_wsdc_"..PlayerPedId(), { position = pos, link = "https://www.youtube.com/watch?v=wKC-D3Dez9c" })
    end
end)

-- Keys
Citizen.CreateThread(function()
	while true do
		if vehicleCreated and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			local getVehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
			if getVehicle == vehicleCreated then
				ESX.ShowHelpNotification("Benutze die Taste ~INPUT_DROP_WEAPON~ um die Gangster Musik an/auszuschalten!")
				if IsControlJustReleased(0, 56) then
					StartScreenEffect("ExplosionJosh3", 0, 0)
					if musicPlayed == true then
						musicPlayed = false
						ESX.ShowNotification("~r~Gangster Musik ausgeschaltet!")
						TriggerServerEvent("wsdc:soundStatus", "stop", "sound_wsdc_"..PlayerPedId(), { position = pos, link = "https://www.youtube.com/watch?v=wKC-D3Dez9c" })
					else
						musicPlayed = true
						ESX.ShowNotification("~g~Gangster Musik angeschaltet!")
						local pos = GetEntityCoords(vehicleCreated)
						TriggerServerEvent("wsdc:soundStatus", "play", "sound_wsdc_"..PlayerPedId(), { position = pos, link = "https://www.youtube.com/watch?v=wKC-D3Dez9c" })
					end
				end
			end
		end
		Citizen.Wait(1)
	end
end)

-- Sound update
Citizen.CreateThread(function()
	while true do
		if musicPlayed == true and vehicleCreated ~= nil then
			newpos = GetEntityCoords(vehicleCreated)
			TriggerServerEvent("wsdc:soundStatus", "position", "sound_wsdc_"..PlayerPedId(), { position = newpos, link = "https://www.youtube.com/watch?v=wKC-D3Dez9c" })
		end
		Citizen.Wait(1)
	end
end)
