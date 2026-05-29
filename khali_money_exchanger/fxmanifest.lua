--[[
    ╔═══════════════════════════════════════════════════════════════════╗
    ║                                                                   ║
    ║               T O D O   S Y S T E M                               ║
    ║             ─────────────────────────                             ║
    ║            VORP TODO & CHECKBOX SCRIPT                            ║
    ║                 Redemption Script                                 ║
    ║                                                                   ║
    ║                                                                   ║
    ║                                                                   ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   Server:    oXTechnoKhaliXo Scripts                              ║
    ║   Creator:   oXTechnoKhaliXo                                      ║
    ║   Discord:   https://discord.gg/8NjehNeEuZ                        ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   © 2026 oXTechnoKhaliXo | All Rights Reserved                    ║
    ╚═══════════════════════════════════════════════════════════════════╝
]]
fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'khali_money_exchanger'
author 'oXTechnoKhaliXo'
description 'Animated Old Western Money Exchanger for VORP Core'

shared_script 'config.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}
