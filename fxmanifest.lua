fx_version 'cerulean'
games {'gta5'}

author 'Nemesus.de'
description 'Wir sind die coolsten GTA5 Edition'
contact 'info@nemesus.de'
version '1.1'

dependencies {
	"es_extended",
	"xsound"
}

shared_script '@es_extended/imports.lua'

client_script 'client.lua'

server_script 'server.lua'
