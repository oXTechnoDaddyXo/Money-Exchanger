local VORPcore =
    exports.vorp_core:GetCore()

math.randomseed(os.time())

local DailyRate =
    math.random(
        Config.Exchange.minGoldToCash,
        Config.Exchange.maxGoldToCash
    )

local CashToGold =
    1 / DailyRate

RegisterServerEvent(
    "goldexchange:getPlayerData"
)

AddEventHandler(
    "goldexchange:getPlayerData",
    function()

        local src = source

        local User =
            VORPcore.getUser(src)

        if not User then
            return
        end

        local Char =
            User.getUsedCharacter

        TriggerClientEvent(
            "goldexchange:sendData",
            src,
            {

                cash = Char.money,

                gold = Char.gold,

                goldToCash =
                    DailyRate,

                cashToGold =
                    string.format(
                        "%.2f",
                        CashToGold
                    )
            }
        )
    end
)

-- CASH TO GOLD

RegisterServerEvent(
    "goldexchange:cashToGold"
)

AddEventHandler(
    "goldexchange:cashToGold",
    function(amount)

        local src = source

        local User =
            VORPcore.getUser(src)

        if not User then
            return
        end

        local Char =
            User.getUsedCharacter

        amount =
            tonumber(amount)

        if not amount or amount <= 0 then
            return
        end

        if Char.money < amount then

            TriggerClientEvent(
                "goldexchange:notify",
                src,
                "error",

                Config.Language
                [Config.Locale]
                .noCash
            )

            return
        end

        local gold =
            tonumber(
                string.format(
                    "%.2f",
                    amount * CashToGold
                )
            )

        Char.removeCurrency(
            0,
            amount
        )

        Char.addCurrency(
            1,
            gold
        )

        TriggerClientEvent(
            "goldexchange:notify",
            src,
            "success",

            string.format(
                Config.Language
                [Config.Locale]
                .successCashToGold,

                amount,
                gold
            )
        )

        TriggerClientEvent(
            "goldexchange:sendData",
            src,
            {

                cash = Char.money,

                gold = Char.gold,

                goldToCash =
                    DailyRate,

                cashToGold =
                    string.format(
                        "%.2f",
                        CashToGold
                    )
            }
        )

        SetTimeout(2200, function()

            TriggerClientEvent(
                "goldexchange:close",
                src
            )

        end)
    end
)

-- GOLD TO CASH

RegisterServerEvent(
    "goldexchange:goldToCash"
)

AddEventHandler(
    "goldexchange:goldToCash",
    function(amount)

        local src = source

        local User =
            VORPcore.getUser(src)

        if not User then
            return
        end

        local Char =
            User.getUsedCharacter

        amount =
            tonumber(amount)

        if not amount or amount <= 0 then
            return
        end

        if Char.gold < amount then

            TriggerClientEvent(
                "goldexchange:notify",
                src,
                "error",

                Config.Language
                [Config.Locale]
                .noGold
            )

            return
        end

        local cash =
            tonumber(
                string.format(
                    "%.2f",
                    amount * DailyRate
                )
            )

        Char.removeCurrency(
            1,
            amount
        )

        Char.addCurrency(
            0,
            cash
        )

        TriggerClientEvent(
            "goldexchange:notify",
            src,
            "success",

            string.format(
                Config.Language
                [Config.Locale]
                .successGoldToCash,

                amount,
                cash
            )
        )

        TriggerClientEvent(
            "goldexchange:sendData",
            src,
            {

                cash = Char.money,

                gold = Char.gold,

                goldToCash =
                    DailyRate,

                cashToGold =
                    string.format(
                        "%.2f",
                        CashToGold
                    )
            }
        )

        SetTimeout(2200, function()

            TriggerClientEvent(
                "goldexchange:close",
                src
            )

        end)
    end
)