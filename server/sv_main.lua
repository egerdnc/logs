function AddLog(pType, pSource, pLog, pData)
    if not pType then pType = "None" else pType = tostring(pType) end
    local steamid = GetPlayerIdentifiers(pSource)[1]

    log = tostring(pLog) or "None"
    data = json.encode(pData) or "None"

    local v = {
        ["type"] = lType,
        ["date"] = os.date("%Y%m%d%H%M%S"),
        ["log"] = log,
        ["data"] = data,
        ["steamid"] = steamid
    }

    PerformHttpRequest('https://website/logs/api.php', function(err, text, headers) end, 'POST', json.encode(v), { ['Content-Type'] = 'application/json' })
end
