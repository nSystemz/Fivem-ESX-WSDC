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

-- ONLY EDIT IF YOU KNOW WHAT YOU ARE DOING!

local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

ESX.RegisterServerCallback("esx_wsdc:getGroup", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

RegisterNetEvent("wsdc:soundStatus")
AddEventHandler("wsdc:soundStatus", function(type, musicId, data)
    TriggerClientEvent("wsdc:soundStatus", -1, type, musicId, data)
end)

RegisterCommand('gangsterveh', function(source, args, user)
	TriggerClientEvent('wsdc:createCar', source, args)
end)