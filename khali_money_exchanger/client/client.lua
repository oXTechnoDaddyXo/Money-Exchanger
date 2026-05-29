local opened = false

local promptGroup =
    GetRandomIntInRange(0, 0xffffff)

local shopPrompt

CreateThread(function()

    local str = CreateVarString(
        10,
        "LITERAL_STRING",
        Config.Language[Config.Locale].prompt
    )

    shopPrompt = PromptRegisterBegin()

    PromptSetControlAction(
        shopPrompt,
        Config.OpenKey
    )

    PromptSetText(
        shopPrompt,
        str
    )

    PromptSetEnabled(
        shopPrompt,
        true
    )

    PromptSetVisible(
        shopPrompt,
        true
    )

    PromptSetStandardMode(
        shopPrompt,
        true
    )

    PromptSetGroup(
        shopPrompt,
        promptGroup
    )

    PromptRegisterEnd(shopPrompt)

    -- BLIPS

    for _, v in pairs(Config.Locations) do

        local blip =
            Citizen.InvokeNative(
                0x554D9D53F696D002,
                1664425300,
                v.x,
                v.y,
                v.z
            )

        SetBlipSprite(
            blip,
            Config.Blip.sprite,
            true
        )

        SetBlipScale(
            blip,
            0.2
        )

        Citizen.InvokeNative(
            0x9CB1A1623062F402,
            blip,
            CreateVarString(
                10,
                "LITERAL_STRING",
                Config.Blip.name
            )
        )
    end

    while true do

        Wait(0)

        local ped =
            PlayerPedId()

        local coords =
            GetEntityCoords(ped)

        for _, v in pairs(Config.Locations) do

            local dist =
                #(coords - v)

            if dist < 2.0 then

                PromptSetActiveGroupThisFrame(
                    promptGroup,
                    CreateVarString(
                        10,
                        "LITERAL_STRING",
                        Config.Language[Config.Locale].title
                    )
                )

                if PromptHasStandardModeCompleted(shopPrompt) then

                    if not opened then

                        OpenUI()

                        Wait(1000)
                    end
                end
            end
        end
    end
end)

function OpenUI()

    opened = true

    SetNuiFocus(
        true,
        true
    )

    SendNUIMessage({

        action = "open",

        language =
            Config.Language
            [Config.Locale]
    })

    Wait(100)

    TriggerServerEvent(
        "goldexchange:getPlayerData"
    )
end

function CloseUI()

    opened = false

    SetNuiFocus(
        false,
        false
    )

    SendNUIMessage({

        action = "close"
    })
end

RegisterNUICallback(
    "close",
    function(_, cb)

        CloseUI()

        cb("ok")
    end
)

RegisterNUICallback(
    "exchangeCashToGold",
    function(data, cb)

        TriggerServerEvent(
            "goldexchange:cashToGold",
            tonumber(data.amount)
        )

        cb("ok")
    end
)

RegisterNUICallback(
    "exchangeGoldToCash",
    function(data, cb)

        TriggerServerEvent(
            "goldexchange:goldToCash",
            tonumber(data.amount)
        )

        cb("ok")
    end
)

RegisterNetEvent(
    "goldexchange:sendData"
)

AddEventHandler(
    "goldexchange:sendData",
    function(data)

        SendNUIMessage({

            action = "updateData",

            cash = data.cash,

            gold = data.gold,

            goldToCash =
                data.goldToCash,

            cashToGold =
                data.cashToGold
        })
    end
)

RegisterNetEvent(
    "goldexchange:notify"
)

AddEventHandler(
    "goldexchange:notify",
    function(type, msg)

        SendNUIMessage({

            action = "notify",

            notifyType = type,

            message = msg
        })
    end
)

RegisterNetEvent(
    "goldexchange:close"
)

AddEventHandler(
    "goldexchange:close",
    function()

        CloseUI()
    end
)