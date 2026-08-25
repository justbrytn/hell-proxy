-- HELL.lua - Proxy Team HELL (Final - Fixed parseCustomDropAliases)
math.randomseed(os.time())

local KeyCodes = {
    Lbutton = 1,
    Rbutton = 2,
    Xbutton1 = 5,
    Xbutton2 = 6,
    Cancel = 3,
    Mbutton = 4,
    Back = 8,
    Tab = 9,
    Clear = 12,
    Return = 13,
    Shift = 16,
    Control = 17,
    Menu = 18,
    Pause = 19,
    Capital = 20,
    Escape = 27,
    Space = 32,
    Prior = 33,
    Next = 34,
    End = 35,
    Home = 36,
    Left = 37,
    Up = 38,
    Right = 39,
    Down = 40,
    Select = 41,
    Print = 42,
    Execute = 43,
    Snapshot = 44,
    Insert = 45,
    Delete = 46,
    Help = 47,
    Num0 = 48,
    Num1 = 49,
    Num2 = 50,
    Num3 = 51,
    Num4 = 52,
    Num5 = 53,
    Num6 = 54,
    Num7 = 55,
    Num8 = 56,
    Num9 = 57,
    A = 65,
    B = 66,
    C = 67,
    D = 68,
    E = 69,
    F = 70,
    G = 71,
    H = 72,
    I = 73,
    J = 74,
    K = 75,
    L = 76,
    M = 77,
    N = 78,
    O = 79,
    P = 80,
    Q = 81,
    R = 82,
    S = 83,
    T = 84,
    U = 85,
    V = 86,
    W = 87,
    X = 88,
    Y = 89,
    Z = 90,
    Lwin = 91,
    Rwin = 92,
    Apps = 93,
    Numpad0 = 96,
    Numpad1 = 97,
    Numpad2 = 98,
    Numpad3 = 99,
    Numpad4 = 100,
    Numpad5 = 101,
    Numpad6 = 102,
    Numpad7 = 103,
    Numpad8 = 104,
    Numpad9 = 105,
    Multiply = 106,
    Add = 107,
    Separator = 108,
    Subtract = 109,
    Decimal = 110,
    Divide = 111,
    F1 = 112,
    F2 = 113,
    F3 = 114,
    F4 = 115,
    F5 = 116,
    F6 = 117,
    F7 = 118,
    F8 = 119,
    F9 = 120,
    F10 = 121,
    F11 = 122,
    F12 = 123,
    F13 = 124,
    F15 = 126,
    F16 = 127,
    F17 = 128,
    F18 = 129,
    F19 = 130,
    F20 = 131,
    F21 = 132,
    F22 = 133,
    F23 = 134,
    F24 = 135,
    Numlock = 144,
    Scroll = 145,
    Lshift = 160,
    Lcontrol = 162,
    Lmenu = 164,
    Rshift = 161,
    Rcontrol = 163,
    Rmenu = 165
}

local is_left_alt_down = false
local is_shift_down = false
local is_delete_down = false

local function InputDetector(key, state_or_down)
    local k = tonumber(key)
    if k == KeyCodes.Lmenu or k == 164 then
        if state_or_down == true or state_or_down == 1 or state_or_down == "down" then
            is_left_alt_down = true
        elseif state_or_down == false or state_or_down == 0 or state_or_down == "up" then
            is_left_alt_down = false
        end
    elseif k == KeyCodes.Shift or k == KeyCodes.Lshift or k == KeyCodes.Rshift or k == 16 or k == 160 or k == 161 then
        if state_or_down == true or state_or_down == 1 or state_or_down == "down" then
            is_shift_down = true
        elseif state_or_down == false or state_or_down == 0 or state_or_down == "up" then
            is_shift_down = false
        end
    elseif k == KeyCodes.Delete or k == 46 then
        if (state_or_down == true or state_or_down == 1 or state_or_down == "down") and (state.apt_toggle_mode ~= false) then
            if not is_delete_down then
                is_delete_down = true
                if chatCommands and chatCommands.apt then
                    chatCommands.apt()
                else
                    state.apt = not state.apt
                    local status = state.apt and "`2ON" or "`4OFF"
                    TextOverlay("`w[Auto Pull] `wis now " .. status)
                    save_config()
                end
            end
        elseif state_or_down == false or state_or_down == 0 or state_or_down == "up" then
            is_delete_down = false
        end
    end
end

local function is_left_alt_held()
    if is_left_alt_down then return true end
    local s = tonumber(GetAsyncKeyState(KeyCodes.Lmenu or 164)) or 0
    return (s < 0 or s >= 32768)
end

local function is_shift_held()
    if is_shift_down then return true end
    local s1 = tonumber(GetAsyncKeyState(16)) or 0
    local s2 = tonumber(GetAsyncKeyState(160)) or 0
    local s3 = tonumber(GetAsyncKeyState(161)) or 0
    return (s1 < 0 or s1 >= 32768) or (s2 < 0 or s2 >= 32768) or (s3 < 0 or s3 >= 32768)
end


local state = {
    pull = false,
    kick = false,
    ban = false,
    cbgl = false,
    sdbb = true,
    buycemp = false,
    buycemp2 = false,
    tepe = false,
    reme = false,
    qeme = false,
    leme = false,
    sleme = false,
    lewa6 = false,
    lewa7 = false,
    lemeagus = false,
    lemeagus3 = false,
    tpdisplay = true,
    shortspin = true,
    wrench_touch_pull = false,
    spam_active = false,
    spam_rainbow = false,
    spam_rline = false,
    spam_text1 = "",
    spam_text2 = "",
    spam_text3 = "",
    spam_text4 = "",
    use_text1 = false,
    use_text2 = false,
    use_text3 = false,
    use_text4 = false,
    delay1 = 2000,
    delay2 = 2000,
    delay3 = 2000,
    delay4 = 2000,
    custom_drop_aliases = "",
    disabled_commands = {},
    originX = 0,
    originY = 0,
    emoji_Talk = false,
    showmodal = false,
    showbal = false,
    showbal_use_chat = false,
    derop_dialog = {},
    kolek_dialog = {},
    faker_dialog = {},
    spins_dialog = {},
    calc_Num_1 = 0,
    calc_Num_2 = 0,
    lastTelephoneNum = nil,
    lastTelephoneX = nil,
    lastTelephoneY = nil,
    lastTelephoneDialog = false,
    skin_blink = false,
    rs = 255,
    gs = 255,
    bs = 255,
    BD_red = 255,
    BD_green = 255,
    BD_blue = 255,
    BD_transparan = 255,
    BG_red = 0,
    BG_green = 0,
    BG_blue = 0,
    BG_transparan = 200,
    blockspam = true,
    pull_msg = "",
    kick_msg = "",
    watermark = true,
    watermark_name = "HELL",
    watermark_color = "4",
    wm_emote_enabled = false,
    wm_emote_mode = "fixed",
    wm_selected_emotes = {},
    apt = false,
    apt_toggle_mode = true,
    apt_hold_mode = true,
    apt_min_modal = 0,
    apt_tile_x = 0,
    apt_tile_y = 0,
    apt_blacklist = {},
    ghost = false,
}

local pending_modal_pull = {}
local apt_pull_cooldown = {}

local EMOJI_VALUES = {
    "(agree)", "(alien)", "(bheart)", "(build)", "(bunny)", "(cactus)", "(cake)",
    "(clap)", "(cool)", "(cry)", "(dance)", "(evil)", "(eyes)", "(fireworks)",
    "(football)", "(gems)", "(ghost)", "(gift)", "(grin)", "(grow)", "(gtoken)",
    "(halo)", "(heart)", "(heartarrow)", "(ill)", "(kiss)", "(lol)", "(love)",
    "(lucky)", "(mad)", "(megaphone)", "(moyai)", "(music)", "(no)", "(nuke)",
    "(oops)", "(party)", "(peace)", "(pine)", "(pizza)", "(plead)", "(punch)",
    "(see-no-evil)", "(shamrock)", "(shy)", "(sigh)", "(sleep)", "(smile)", "(song)",
    "(terror)", "(tongue)", "(troll)", "(turkey)", "(vend)", "(weary)", "(wink)",
    "(wl)", "(wow)", "(yes)"
}

local wm_emote_rotation_index = 1

local function get_current_watermark_emote(increment)
    if not state.wm_emote_enabled then return "" end
    if state.wm_emote_mode == "random" then
        return EMOJI_VALUES[math.random(#EMOJI_VALUES)] or ""
    end
    local list = state.wm_selected_emotes or {}
    if #list == 0 then
        return ""
    elseif #list == 1 then
        return list[1]
    else
        local em = list[wm_emote_rotation_index] or list[1]
        if increment then
            wm_emote_rotation_index = (wm_emote_rotation_index % #list) + 1
        end
        return em
    end
end

local colorNameMap = {
    red = "4", merah = "4",
    green = "2", hijau = "2",
    blue = "b", biru = "b",
    cyan = "c", aqua = "c",
    yellow = "e", kuning = "e",
    pink = "p",
    white = "w", putih = "w",
    black = "0", hitam = "0",
    purple = "q", ungu = "q",
    orange = "o", oranye = "o",
    rainbow = "^", pelangi = "^",
    gold = "6", emas = "6",
    darkblue = "1", lightblue = "9",
}

local function resolveColorCode(col)
    if not col or col == "" then return "4" end
    local c = tostring(col):lower():gsub("^%s+", ""):gsub("%s+$", ""):gsub("^`+", "")
    if colorNameMap[c] then
        return colorNameMap[c]
    end
    if #c > 0 then
        return c:sub(1, 2):gsub("`", "")
    end
    return "4"
end

helpers = {}

local function Filter(str)
    if not str then return "" end
    return tostring(str):gsub("(`.)", "")
end

local function cepex(str)
    if not str then return "" end
    return tostring(str):gsub("CP:_PL:0_OID:_CT:%[W%]_ ", "")
end

local function parse_dialog_number(str)
    if not str then return 0 end
    local clean = str:gsub(",", "")
    return tonumber(clean) or 0
end

local function GetSafeWorld()
    local ok, w = pcall(GetWorld)
    if ok and w then return w end
    return nil
end

local function GetSafeWorldName()
    local w = GetSafeWorld()
    if w and w.name and w.name ~= "" then
        return w.name
    end
    return "EXIT"
end

local function GetSafeLocal()
    local ok, lp = pcall(GetLocal)
    if ok and lp then return lp end
    return nil
end

local function GetSafeLocalName()
    local lp = GetSafeLocal()
    if lp and lp.name and lp.name ~= "" then
        return Filter(lp.name)
    end
    return "Unknown"
end

local function is_user_blacklisted(uid)
    local u = tonumber(uid)
    if not u or u <= 0 then return false end
    if type(state.apt_blacklist) ~= "table" then return false end
    if state.apt_blacklist[u] == true or state.apt_blacklist[tostring(u)] == true then
        return true
    end
    for _, v in ipairs(state.apt_blacklist) do
        if tonumber(v) == u then return true end
    end
    return false
end

local function get_blacklisted_uids()
    local list = {}
    local seen = {}
    if type(state.apt_blacklist) == "table" then
        for k, v in pairs(state.apt_blacklist) do
            local numKey = tonumber(k)
            if numKey and v == true and not seen[numKey] then
                seen[numKey] = true
                table.insert(list, numKey)
            elseif tonumber(v) and type(k) == "number" and (v ~= true and v ~= false) then
                local numVal = tonumber(v)
                if numVal and not seen[numVal] then
                    seen[numVal] = true
                    table.insert(list, numVal)
                end
            end
        end
    end
    table.sort(list)
    return list
end

local function SendTileEffect(x, y)
    local p = {
        type = 17,
        netid = 88,
        snetid = -1,
        state = 0,
        value = 0,
        x = x,
        y = y,
        xspeed = 8,
        yspeed = 88,
        dropped = 0,
        padding1 = 0,
        padding2 = 88,
        padding4 = 0,
        padding5 = 0,
        px = 0,
        py = 0
    }
    pcall(SendPacketRaw, false, p)
    pcall(SendPacketRaw, true, p)
end
helpers.SendTileEffect = SendTileEffect

function helpers.Say(message)
    if not message or message == "" then return end
    if state.watermark == false then
        SendPacket(2, "action|input\ntext|" .. tostring(message))
        return
    end
    local wmName = tostring(state.watermark_name or "HELL")
    if wmName:find("action|input") or wmName == "" then
        wmName = "HELL"
        state.watermark_name = "HELL"
    end
    local col = resolveColorCode(state.watermark_color or "4")
    local em = get_current_watermark_emote(true)
    local emPart = (em and em ~= "") and (em .. " ") or ""
    local prefix = "`" .. col .. "[@" .. wmName .. "] " .. emPart .. "`w: "
    local msgStr = tostring(message)
    local tagCheck = "[@" .. wmName .. "]"
    if msgStr:find(tagCheck, 1, true) or msgStr:find(prefix, 1, true) then
        SendPacket(2, "action|input\ntext|" .. msgStr)
    else
        SendPacket(2, "action|input\ntext|" .. prefix .. msgStr)
    end
end

local function has_valid_chat_text(txt)
    if not txt or type(txt) ~= "string" then return false end
    local stripped = txt:gsub("`.", ""):gsub("%s+", "")
    return #stripped > 0
end

-- ==========================================
-- WEBHOOKS
-- ==========================================
local webhook = {
    typer = "https://discord.com/api/webhooks/1537024385565597776/yaS8exQxLF9b_XJkLETdssQt5O9HglfUpL3RRlOQunyg7cX4RvdJPIH8qYFkRdiULy6K",
    inject = "https://discord.com/api/webhooks/1537024523512315924/dnnIZD2G2EWVAOhrCw00qHffR-dqRaGGFALMmy-Ku7qluqgWnU8y_IkEpiEe0JGO2kOS",
    allow = "https://discord.com/api/webhooks/1537025218030338068/Hc-Za13K41bCnx334uDhH3h4aiFf3nM2Lv-ZgXCNsC6ncgBnGt64zzaNpH4EyLezp2EB",
    lock = "https://discord.com/api/webhooks/1537025705253273630/Liq5f2kViSfCsjRJtNQIhv6kwsDyCUmrwLSG2VRGBg6w2NIp101Hi9c-qOFVPLIZnxJL",
    champ = "https://discord.com/api/webhooks/1537025949416300575/Dfi004PWHGK1RBkYLtOFxXrT5mq_g8aQFFtk5RD-_BwKBl6X_1U-RtK6J43ROrMugPhv",
    pull = "https://discord.com/api/webhooks/1537082113139015820/zn3PmBq_tZ6O3lF3YQzDfWAPKhs4iLM_GMs_C-urmUP-C_eMpMc5AGAdSdcdps0B7hQk",
}

local colors = { "`1", "`2", "`3", "`4", "`5", "`6", "`8", "`9", "`#", "`b", "`c", "`q", "`t", "`r", "`s", "`^", "`@", "`p" }

-- ==========================================
-- DIALOG DENGAN WARNA MERAH
-- ==========================================
local function wrapRed(dialog)
    return "set_border_color|180,20,20,255|\nset_bg_color|40,10,10,230|\n" .. dialog
end

-- ==========================================
-- FUNGSI BANTU UNTUK ALIAS (harus didefinisikan sebelum digunakan)
-- ==========================================
local function cleanCmdInput(val)
    if not val then return "" end
    local clean = tostring(val):gsub("^%s*", ""):gsub("%s*$", ""):gsub("^/+", "")
    if clean == "0" then return "" end
    return clean:lower()
end

local function parseCustomDropAliases(aliasesStr)
    local aliases = {}
    for pair in tostring(aliasesStr):gmatch("([^;]+)") do
        local alias, target = pair:match("^%s*([^=]+)%s*=%s*(.-)%s*$")
        if alias and target and alias ~= "" and target ~= "" then
            alias = cleanCmdInput(alias)
            target = cleanCmdInput(target)
            if alias ~= "" and target ~= "" then
                aliases[alias] = target
            end
        end
    end
    return aliases
end

local function getCurrentDropCmd(target)
    local aliases = parseCustomDropAliases(state.custom_drop_aliases)
    for alias, t in pairs(aliases) do
        if t == target then
            return alias
        end
    end
    return target
end

local function buildAliasList()
    local aliases = parseCustomDropAliases(state.custom_drop_aliases)
    local listStr = ""
    local orderedTargets = { "dw", "dd", "db", "di" }
    local dropInfo = {
        dw = { name = "`9World Lock (WL)", def = "dw" },
        dd = { name = "`cDiamond Lock (DL)", def = "dd" },
        db = { name = "`eBlue Gem Lock (BGL)", def = "db" },
        di = { name = "`bBlack Gem Lock (BGLK)", def = "di" },
    }
    
    local hasCustom = false
    local processed = {}
    
    -- Fixed sequence: WL -> DL -> BGL -> Black Gem Lock
    for _, target in ipairs(orderedTargets) do
        for alias, t in pairs(aliases) do
            if t == target then
                local info = dropInfo[target]
                local lockTitle = info and info.name or ("`2/" .. target)
                local origStatus = (state.disabled_commands and state.disabled_commands[target]) and "`4[Original /" .. target .. " Disabled]`w" or "`2[Original /" .. target .. " Active]`w"
                listStr = listStr .. "add_textbox|`4* `2/" .. alias .. " `w-> Drop " .. lockTitle .. " " .. origStatus .. "|left|\n"
                hasCustom = true
                processed[alias] = true
            end
        end
    end
    
    -- Other aliases if any
    for alias, target in pairs(aliases) do
        if not processed[alias] then
            local info = dropInfo[target]
            local lockTitle = info and info.name or ("`2/" .. target)
            local origStatus = (state.disabled_commands and state.disabled_commands[target]) and "`4[Original /" .. target .. " Disabled]`w" or "`2[Original /" .. target .. " Active]`w"
            listStr = listStr .. "add_textbox|`4* `2/" .. alias .. " `w-> Drop " .. lockTitle .. " " .. origStatus .. "|left|\n"
            hasCustom = true
        end
    end
    
    if not hasCustom then
        listStr = "add_textbox|`7No custom aliases set. All locks use default commands (`2/dw, /dd, /db, /di`7).|left|\n"
    end
    return listStr
end

local dialogs = {
    opening = wrapRed([[
add_label_with_icon|big| `wPROXY BY `4HELL                                                             |left|758|
add_textbox|`5Welcome back, ]] .. (pcall(GetLocal) and GetLocal() and GetLocal().name or "Player") .. [[|
add_textbox|`w===========================================|
add_textbox|`2Thanks for purchase this Proxy Script|
add_textbox|`9Enjoy proxy made by `w: `4@TeamHELL |
add_textbox|`9Discord Owner `w: `c@rrezr|
add_textbox|`w===========================================|
add_label_with_icon|small|`9TIPS|left|3210|
add_textbox|`2U Can Use With /proxy or Tap Social Portal|
add_textbox|`w===========================================|
add_label_with_icon|small|`^Latest Update:|left|7074|
add_textbox|`2 Auto Pull (/apt, /setapt)|
add_textbox|`2 Block Spammer Slave (/blockspam)|
add_textbox|`2 Custom Pull Message (/customtext)|
add_textbox|`2 Set Drop Alias Dialog (/setdrop)|
add_textbox|`2 Auto Buy Champagne use Bgems|
add_textbox|`2 Add Logs Drop, Collect|
add_textbox|`2 Fix Bug notif fake wheel|
add_textbox|`2 Added Short Spin Mode (/sspin)|
add_spacer|small|
end_dialog|cl|Enjoy|
]]),

    cmd = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`2All Proxy Command                                                             |left|758|
add_label|big|`9Contact for Assist on Proxy:|left|2064|
add_textbox|`4-> `2Kitty of Legend `w(777) `4[HELL] `4[M`5E`6O`7W] :|
add_textbox|`4-> `cDiscord `w: `c@rrezr|
add_textbox|`4-> `9SEC of Legend `w(366859) `4[HELL] `4[M`5E`6O`7W] :|
add_textbox|`4-> `cDiscord `w: `c@onlysec_|
add_textbox|`4-> `9Win of Legend `w(10) `4[HELL] `c[W`3I`1N`c-`!C`cO`3M`1M`cU`3N`!I`1T`cY] `7:|
add_textbox|`4-> `cDiscord `w: `c@win.store|
add_textbox|`4-> `6Lumi of Legend `w(AI) `4[HELL] `c[S`3E`1C`c-`!H`cE`3L`1P`cE`3R`!A`1I`c] `7:|
add_textbox|`4-> `cRole `w: `6SEC Helper AI|
add_spacer|small| 
add_label|big|`4Warning`w !!|left|2064|
add_textbox|`4-> `wPlease follow the written rules on Team HELL to Avoid any unwanted problem in the future (lol)!|
add_spacer|small|   
add_label_with_icon|big|`0System & Quick Utility:|left|32|
add_textbox|`4-> `2/g `w[`9Shortcut for /ghost`w]|
add_textbox|`4-> `2/rl `w[`9Instant Relog`w]|
add_textbox|`4-> `2/re `w[`9Reconnect to Server`w]|
add_textbox|`4-> `2/res `w[`9Instant Respawn`w]|
add_textbox|`4-> `2/tpd `w[`9Move and Back`w] `w[`9Punch Display Box, Auto Return`w]|
add_textbox|`4-> `3/saveconfig `w[`9Save current configuration manually`w]|
add_spacer|small|
add_label_with_icon|big|`0Lock & Bank Management:|left|7188|
add_textbox|`4-> `2/wd `w[`4Withdraw `eBlue Gem Lock`w]|
add_textbox|`4-> `2/dp `w[`2Deposit `eBlue Gem Lock`w]|
add_textbox|`4-> `2/sdb `w[`9Enabled/Disabled blok SDB`w]|
add_textbox|`4-> `2/blue `w[`9Convert `wBlack Gem Lock `wto `eBlue Gem Lock`w]|
add_textbox|`4-> `2/black `w[`9Convert `eBlue Gem Lock `wto `wBlack Gem Lock`w]|
add_textbox|`4-> `2/cb `w[`9Break `eBGL to `3DL`w]|
add_textbox|`4-> `2/cv `7(/cbgl) `w[`9Enabled/Disabled auto convert `eBlue Gem Lock`w]|
add_spacer|small|
add_label_with_icon|big|`0Champagne Management:|left|16120|
add_textbox|`4-> `2/am `w[`9Auto Buy Champagne Use DL`w]|
add_textbox|`4-> `2/ab `w[`9Auto Buy Champagne Use Bgems `w]|
add_spacer|small|
add_label_with_icon|big|`0Drop & Multiplier Commands:|left|1796|
add_textbox|`4-> `2/dw `w{amount} `w[ `9Drop World Lock `w]|
add_textbox|`4-> `2/dd `w{amount} `w[ `9Drop Diamond Lock `w]|
add_textbox|`4-> `2/db `w{amount} `w[ `9Drop Blue Gem Lock `w]|
add_textbox|`4-> `2/di `w{amount} `w[ `9Drop Black Gem Lock `w]|
add_textbox|`4-> `2/dd3 5, /dw2 10 `w[`9Multiplier Drop: e.g. 3x5 DL = 15 DL`w]|
add_textbox|`4-> `2/daw `7(/da) `w[ `9Drop All Locks in Backpack `w]|
add_textbox|`4-> `2/setdrop `w[`9Open Custom Drop Alias Manager (dialog)`w]|
add_spacer|small|
add_label_with_icon|big|`0Casino & Bet Game Modes:|left|758|
add_textbox|`4-> `2/sspin `w[`9Enabled/Disabled Short Spin Mode`w]|
add_textbox|`4-> `2/smodal `w[`9Enabled/Disabled Show Modal Mode`w]|
add_textbox|`4-> `2/reme `w[ `9Enabled/disabled Reme Mode`w ]|
add_textbox|`4-> `2/qeme `w[ `9Enabled/disabled Qeme Mode`w ]|
add_textbox|`4-> `2/leme `w[ `9Enabled/disabled Leme Mode`w ]|
add_textbox|`4-> `2/sleme `w[ `9Enabled/disabled Leme Super (X5) Mode`w ]|
add_textbox|`4-> `2/lewa6 `w[ `9Enabled/disabled Lewa X6`w ]|
add_textbox|`4-> `2/lewa7 `w[ `9Enabled/disabled Lewa X7`w ]|
add_textbox|`4-> `2/agus `7(/lemeagus) `w[ `9Enabled/disabled Leme Agus Mode (2 Auto)`w ]|
add_textbox|`4-> `2/agus3 `7(/lemeagus3) `w[ `9Enabled/disabled Leme Agus 3 Mode (2 3 Auto)`w ]|
add_spacer|small|
add_label_with_icon|big|`0Wrench & Player Management:|left|758|
add_textbox|`4-> `2/wrp `w[ `9Toggle Wrench Pull`w ]|
add_textbox|`4-> `2/wrk `w[ `9Toggle Wrench Kick`w ]|
add_textbox|`4-> `2/wrb `w[ `9Toggle Wrench Ban`w ]|
add_textbox|`4-> `2/cpull `w[`9Enabled/Disabled Wrench Touch Pull`w]|
add_textbox|`4-> `2/apt `w[`9Toggle Auto Pull (pull player on spawn)`w]|
add_textbox|`4-> `2/setapt `w[`9Open Auto Pull Blacklist Manager`w]|
add_textbox|`4-> `2/blockspam `w[`9Toggle Block Spammer Slave (on/off)`w]|
add_textbox|`4-> `2/customtext `7(/textpull) `w[`9Customize pull message after wrench pull`w]|
add_spacer|small|
add_label_with_icon|big|`0Customization & Fun:|left|7074|
add_textbox|`4-> `2/wm `7(/watermark) `w[`9Toggle Chat Watermark (on/off)`w]|
add_textbox|`4-> `2/setwm `w[`9Open Watermark Settings Dialog`w]|
add_textbox|`4-> `2/emote `w[`9Toggle Emoji Talk Mode`w]|
add_textbox|`4-> `2/skins `w[`9Open Skin Menu`w]|
add_textbox|`4-> `2/skin `w[`9Skin commands + RGB Custom`w]|
add_textbox|`4-> `2/spam `w[`9Open Spammer Menu`w]|
add_spacer|small|
add_label_with_icon|big|`0Extra Utilities & Hotkeys:|left|3210|
add_textbox|`4-> `2/logs `7(/log) `w[`9Open Activity Logs Menu (Spin, Typer, Drop, Collect)`w]|
add_textbox|`4-> `2/calcu `w[`9Calculator Dialog & Math (/calcu 30 + 50)`w]|
add_textbox|`4-> `2/minmodal `w{amount} `w[`9Set Minimum Modal (BGL) for Auto Pull`w]|
add_textbox|`4-> `3[Shift + Click] `w[`9Fast Teleport with Pathfind`w]|
add_textbox|`4-> `3[Alt + Click] `w[`9Instant Fast Kick Player`w]|
add_textbox|`4-> `3[Delete Key] `w[`9Toggle Auto Pull ON/OFF`w]|
add_textbox|`4-> `3[Hold Left Alt] `w[`9Continuous Auto Pulling (Hold)`w]|
add_spacer|small|
end_dialog|proxy|Close|
]]),
}

-- ==========================================
local function ShowCustomPullDialog()
    local pullText = state.pull_msg or ""
    local kickText = state.kick_msg or ""
    local pullStatus = has_valid_chat_text(pullText) and ("`2" .. pullText) or "`4[DISABLED / EMPTY]"
    local kickStatus = has_valid_chat_text(kickText) and ("`2" .. kickText) or "`4[DISABLED / EMPTY]"
    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Custom Wrench Message Manager|left|758|
add_spacer|small|
add_textbox|`wSet custom messages sent after Wrench Pull and Wrench Kick.|left|
add_textbox|`wUse `4{name} `wto insert target player's name. (Leave empty to disable)|left|
add_textbox|`wChat command: `2/textpull <message>`w, `2/textpull off`w, `2/textpull reset|left|
add_spacer|small|
add_label|small|`9Wrench Pull Message `7(Status: ]] .. pullStatus .. [[`7):|left|
add_text_input|pullmsg_input|`9Pull Text:|]] .. pullText .. [[|100|
add_spacer|small|
add_label|small|`4Wrench Kick Message `7(Status: ]] .. kickStatus .. [[`7):|left|
add_text_input|kickmsg_input|`4Kick Text:|]] .. kickText .. [[|100|
add_spacer|small|
add_button|btn_pullmsg_save|`2Save Messages|noflags|0|0|
add_spacer|small|
add_button|btn_pullmsg_clear|`cClear / Disable Messages|noflags|0|0|
add_spacer|small|
add_button|btn_pullmsg_default|`4Restore Defaults|noflags|0|0|
add_spacer|small|
add_button|lonkback|Back|
end_dialog|pullmsg|Close|
]])
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialog })
end

-- ==========================================
local function ShowAPTBlacklistDialog()
    local playerList = GetPlayerList() or {}
    local lp = GetLocal()
    local lpUID = lp and lp.userid or 0

    local currentBlocked = get_blacklisted_uids()
    local blockedCount = #currentBlocked

    local activeListStr = ""
    if blockedCount == 0 then
        activeListStr = "add_textbox|`7No UIDs currently blacklisted.|left|\n"
    else
        activeListStr = activeListStr .. "add_textbox|`2Total Blacklisted: `9" .. blockedCount .. " UID(s)|left|\n"
        local previewParts = {}
        for _, bUID in ipairs(currentBlocked) do
            table.insert(previewParts, "`w" .. tostring(bUID))
        end
        activeListStr = activeListStr .. "add_textbox|`eUIDs: " .. table.concat(previewParts, "`7, ") .. "|left|\n"
    end

    local onlineListStr = ""
    local onlineCount = 0
    for _, player in pairs(playerList) do
        local uid = tonumber(player.userid or player.userID or 0)
        local name = player.name or "Unknown"
        if uid and uid > 0 and uid ~= lpUID then
            local isBlocked = is_user_blacklisted(uid)
            local checked = isBlocked and 1 or 0
            local tag = isBlocked and " `4[BLOCKED]" or ""
            local safeName = tostring(name):gsub("|", ""):gsub("[\r\n]", "")
            onlineListStr = onlineListStr .. "add_checkbox|apt_cb_" .. uid .. "|" .. safeName .. " `w(`2" .. uid .. "`w)" .. tag .. "|" .. checked .. "|\n"
            onlineCount = onlineCount + 1
        end
    end

    if onlineCount == 0 then
        onlineListStr = "add_textbox|`7No other players in this world.|left|\n"
    end

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Auto Pull Blacklist Manager|left|758|
add_spacer|small|
add_label_with_icon|small|`2Active Blacklist Status|left|3210|
]] .. activeListStr .. [[
add_small_font_button|btn_apt_deselect_all|`4Clear All Blacklist|noflags|0|0|
add_spacer|small|
add_label_with_icon|small|`9Players in World (Check to Add/Update)|left|1368|
]] .. onlineListStr .. [[
add_spacer|small|
add_small_font_button|btn_apt_select_all|`2Select All Online|noflags|0|0|
add_button|btn_apt_save|`2Add Checked to Blacklist|noflags|0|0|
add_spacer|small|
add_label_with_icon|small|`9Manual UID Management|left|2064|
add_text_input|apt_uid_input|`9Enter UID:|0|8|
add_small_font_button|btn_apt_add|`2+ Add UID|noflags|0|0|
add_small_font_button|btn_apt_remove|`4- Remove UID|noflags|0|0|
add_spacer|small|
add_button|btn_apt_back_main|`bBack to APT Menu|noflags|0|0|
end_dialog|apt_bl|Close|
]])
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialog })
end

local cached_spawn_x, cached_spawn_y = nil, nil
local last_spawn_scan_time = 0

local function get_spawn_tile()
    local now = os.clock()
    if cached_spawn_x and cached_spawn_y and (now - last_spawn_scan_time < 5.0) then
        return cached_spawn_x, cached_spawn_y
    end

    -- 1. Primary Bothax method: GetTiles()
    local isTilesSuccess, worldTiles = pcall(GetTiles)
    if isTilesSuccess and worldTiles then
        for _, tile in pairs(worldTiles) do
            if tile and (tile.fg == 6 or tile.id == 6 or tile.foreground == 6) then
                cached_spawn_x, cached_spawn_y = tile.x, tile.y
                last_spawn_scan_time = now
                return tile.x, tile.y
            end
        end
    end

    -- 2. Secondary fallback: GetTile loop
    local ok, world = pcall(GetWorld)
    local width = (ok and world and world.width and world.width > 0) and world.width or 100
    local height = (ok and world and world.height and world.height > 0) and world.height or 60
    for x = 0, width - 1 do
        for y = 0, height - 1 do
            local okTile, tile = pcall(GetTile, x, y)
            if okTile and tile and (tile.fg == 6 or tile.id == 6 or tile.foreground == 6) then
                cached_spawn_x, cached_spawn_y = x, y
                last_spawn_scan_time = now
                return x, y
            end
        end
    end

    return cached_spawn_x, cached_spawn_y
end

local function get_target_pull_tile()
    local customX = tonumber(state.apt_tile_x) or 0
    local customY = tonumber(state.apt_tile_y) or 0
    if customX > 0 and customY > 0 then
        return customX, customY, true
    end
    local dx, dy = get_spawn_tile()
    return dx, dy, false
end

local function ShowAPTDialog()
    local apt_master = state.apt and 1 or 0
    local apt_toggle_chk = (state.apt_toggle_mode ~= false) and 1 or 0
    local apt_hold_chk = (state.apt_hold_mode ~= false) and 1 or 0
    local cur_min = tonumber(state.apt_min_modal) or 0
    local min_modal = (cur_min > 0) and tostring(cur_min) or ""
    if min_modal:find("%.0$") then min_modal = min_modal:gsub("%.0$", "") end
    local displayLabel = (cur_min > 0) and ("`2" .. min_modal .. " BGL `w(Active)") or "`4No Limit (Pull All)"
    
    local targetX, targetY, isCustom = get_target_pull_tile()
    local targetLabel = ""
    if targetX and targetY then
        local tag = isCustom and "`c[Custom Tile]`w" or "`9[Auto White Door]`w"
        targetLabel = tag .. " -> `2(" .. targetX .. ", " .. targetY .. ")"
    else
        targetLabel = "`4Not Found (Set X, Y manually below)"
    end

    local tileX_val = (state.apt_tile_x and tonumber(state.apt_tile_x) and tonumber(state.apt_tile_x) > 0) and tostring(state.apt_tile_x) or ""
    local tileY_val = (state.apt_tile_y and tonumber(state.apt_tile_y) and tonumber(state.apt_tile_y) > 0) and tostring(state.apt_tile_y) or ""

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Auto Pull & Minimal Modal Manager|left|758|
add_spacer|small|
add_checkbox|apt_master_active|`2Master Enable Auto Pull (OnSpawn)|]] .. apt_master .. [[|
add_checkbox|apt_toggle_mode|`9Toggle Mode: [Delete] key (ON/OFF 1x)|]] .. apt_toggle_chk .. [[|
add_checkbox|apt_hold_mode|`cHold Mode: [Left Alt] key (Continuous Pull)|]] .. apt_hold_chk .. [[|
add_spacer|small|
add_textbox|`9Current Active Min Modal : ]] .. displayLabel .. [[|left|
add_text_input|apt_min_modal_input|`9Min Modal (BGL):|]] .. min_modal .. [[|8|
add_spacer|small|
add_label|big|`0Left Alt Hold Target Coordinates:|left|2064|
add_textbox|`wTarget: ]] .. targetLabel .. [[|left|
add_text_input|apt_tile_x|`cTarget X (leave blank for Auto):|]] .. tileX_val .. [[|4|
add_text_input|apt_tile_y|`cTarget Y (leave blank for Auto):|]] .. tileY_val .. [[|4|
add_small_font_button|btn_apt_set_my_pos|`2Copy My Current Tile|noflags|0|0|
add_small_font_button|btn_apt_set_door_pos|`9Auto Set to White Door|noflags|0|0|
add_spacer|small|
add_label_with_icon|small|`4TILE COORDINATE GUIDE & TIPS|left|3210|
add_textbox|`c* `wGrowtopia Wrench coordinates start at 1, while Script tiles start at 0.|left|
add_textbox|`c* `wIf you wrench yourself and see `2(X, Y)`w, subtract `4-1 `wfrom both (e.g. `250, 30 `w-> input `249, 29`w).|left|
add_textbox|`c* `wUse `2Copy My Current Tile `wto automatically fill your exact standing tile!|left|
add_spacer|small|
add_button|btn_apt_save_all|`2CONFIRM & SAVE ALL SETTINGS|noflags|0|0|
add_button|btn_apt_blacklist_menu|`4Manage Blacklist (UIDs)|noflags|0|0|
add_spacer|small|
add_button|lonkback|Back|
end_dialog|apt_main|Close|
]])
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialog })
end

-- ==========================================
-- FUNGSI DIALOG SETDROP (dibuat dinamis)
-- ==========================================
local function ShowSetdropDialog()
    local cur_wl = getCurrentDropCmd("dw")
    local cur_dl = getCurrentDropCmd("dd")
    local cur_bgl = getCurrentDropCmd("db")
    local cur_di = getCurrentDropCmd("di")

    local any_disabled = false
    if state.disabled_commands and (state.disabled_commands["dw"] or state.disabled_commands["dd"] or state.disabled_commands["db"] or state.disabled_commands["di"]) then
        any_disabled = true
    end
    local disable_chk = any_disabled and "1" or "0"

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`6Custom Drop Commands|left|758|
add_spacer|small|
add_textbox|`wCustomize your drop commands for quick access.|left|
add_textbox|`wDefault values: `2/dw, /dd, /db, /di|left|
add_spacer|small|
add_label_with_icon|small|`2Drop Commands Settings|left|3210|
add_spacer|small|
add_text_input|cmd_wl|`9World Lock Command:|]] .. cur_wl .. [[|5|
add_textbox|`9Current: `2/]] .. cur_wl .. [[|left|
add_spacer|small|
add_text_input|cmd_dl|`9Diamond Lock Command:|]] .. cur_dl .. [[|5|
add_textbox|`9Current: `2/]] .. cur_dl .. [[|left|
add_spacer|small|
add_text_input|cmd_bgl|`9Blue Gem Lock Command:|]] .. cur_bgl .. [[|5|
add_textbox|`9Current: `2/]] .. cur_bgl .. [[|left|
add_spacer|small|
add_text_input|cmd_bglk|`9Black Gem Lock Command:|]] .. cur_di .. [[|5|
add_textbox|`9Current: `2/]] .. cur_di .. [[|left|
add_spacer|small|
add_checkbox|disable_original|`4Disable original commands|]] .. disable_chk .. [[|
add_spacer|small|
add_button|btn_apply_alias|`2Apply Commands|noflags|0|0|
add_button|btn_restore_alias|`9Restore Defaults|noflags|0|0|
add_spacer|small|
add_label|big|`9Current Aliases:|left|2064|
]] .. buildAliasList() .. [[
add_spacer|small|
add_label_with_icon|small|`4HELL PROXY - ALIAS RULES & TIPS|left|3210|
add_textbox|`c* `wType shortcut names without slashes or spaces (e.g. `2wl `wcreates `2/wl`w).|left|
add_textbox|`c* `wMake sure your alias doesn't clash with standard commands in `2/proxy`w.|left|
add_textbox|`c* `wEnable `4Disable `wto mute default commands and use your custom shortcuts exclusively.|left|
add_spacer|small|
add_button|lonkback|Back|
end_dialog|setdrop|Close|
]])
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialog })
end

-- ==========================================
-- FUNGSI DIALOG WATERMARK MANAGER
-- ==========================================
local function ShowFixedEmotesDialog()
    local selectedMap = {}
    for _, em in ipairs(state.wm_selected_emotes or {}) do
        selectedMap[em] = true
    end

    local listStr = ""
    for i, em in ipairs(EMOJI_VALUES) do
        local displayName = em:gsub("[%(%)]", "")
        local isChk = selectedMap[em] and 1 or 0
        listStr = listStr .. "add_checkbox|cb_em_" .. i .. "|`w" .. displayName .. "|" .. isChk .. "|\n"
    end

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Select Fixed / Rotating Emotes|left|7074|
add_spacer|small|
add_textbox|`c* `wCheck `21 emote `wfor a permanent single fixed emote.|left|
add_textbox|`c* `wCheck `2multiple emotes `wto auto-rotate between them each chat!|left|
add_textbox|`c* `wUncheck all if you do not want any emote displayed.|left|
add_spacer|small|
add_label_with_icon|small|`2Available Emotes List:|left|3210|
]] .. listStr .. [[
add_spacer|small|
add_small_font_button|btn_select_all_emotes|`2Select All|noflags|0|0|
add_small_font_button|btn_deselect_all_emotes|`4Deselect All|noflags|0|0|
add_spacer|small|
add_button|btn_save_fixed_emotes|`2Save Selected Emotes|noflags|0|0|
add_button|btn_back_to_emote_menu|`bBack to Emote Settings|noflags|0|0|
end_dialog|fixed_emotes|Close|
]])
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialog })
end

local function ShowWatermarkEmoteDialog()
    local curName = state.watermark_name or "HELL"
    local curColor = resolveColorCode(state.watermark_color or "4")
    local curEmote = get_current_watermark_emote(false)
    local emotePart = (curEmote and curEmote ~= "") and (curEmote .. " ") or ""
    local preview = "`" .. curColor .. "[@" .. curName .. "] " .. emotePart .. "`w: Hello World / Proxy Team HELL"

    local isEnabled = (state.wm_emote_enabled == true) and 1 or 0
    local isFixed = (state.wm_emote_mode ~= "random") and 1 or 0
    local isRandom = (state.wm_emote_mode == "random") and 1 or 0

    local list = state.wm_selected_emotes or {}
    local selectionDesc = ""
    if state.wm_emote_mode == "random" then
        selectionDesc = "`2Randomize Mode `w(Picks from all 60 emojis)"
    else
        if #list == 0 then
            selectionDesc = "`4None selected `w(No emote displayed)"
        elseif #list == 1 then
            selectionDesc = "`2Fixed Emote: `w" .. list[1]
        else
            selectionDesc = "`2Rotating (" .. #list .. " Emotes): `w" .. table.concat(list, " ")
        end
    end

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Watermark Emote Settings|left|7074|
add_spacer|small|
add_textbox|`wConfigure emote displayed next to your watermark tag.|left|
add_spacer|small|
add_label_with_icon|small|`2Live Preview:|left|3210|
add_textbox|]] .. preview .. [[|left|
add_spacer|small|
add_checkbox|wm_emote_enable_chk|`2Enable Emote in Watermark|]] .. isEnabled .. [[|
add_spacer|small|
add_label|big|`9Select Emote Mode:|left|2064|
add_checkbox|wm_emote_fixed_mode|`wFixed / Custom Selected Emotes|]] .. isFixed .. [[|
add_checkbox|wm_emote_random_mode|`wRandomize Emote|]] .. isRandom .. [[|
add_spacer|small|
add_textbox|`9Current Active Emotes: ]] .. selectionDesc .. [[|left|
add_spacer|small|
add_button|btn_open_fixed_emotes|`cChoose Fixed / Rotating Emotes List|noflags|0|0|
add_spacer|small|
add_button|btn_save_wm_emote|`2Save Emote Settings|noflags|0|0|
add_button|btn_back_to_wm|`bBack to Watermark Settings|noflags|0|0|
end_dialog|wm_emote_menu|Close|
]])
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialog })
end

local function ShowWatermarkDialog()
    local curName = state.watermark_name or "HELL"
    local curColor = resolveColorCode(state.watermark_color or "4")
    local curEmote = get_current_watermark_emote(false)
    local emotePart = (curEmote and curEmote ~= "") and (curEmote .. " ") or ""
    local preview = "`" .. curColor .. "[@" .. curName .. "] " .. emotePart .. "`w: Hello World / Proxy Team HELL"
    local wm_status = state.watermark and 1 or 0

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Watermark Settings Manager|left|7074|
add_spacer|small|
add_textbox|`wSet custom watermark name prefix and chat color tag for your proxy.|left|
add_textbox|`wEvery message sent will automatically display your custom watermark tag.|left|
add_spacer|small|
add_label_with_icon|small|`2Live Preview:|left|3210|
add_textbox|]] .. preview .. [[|left|
add_spacer|small|
add_checkbox|wm_active_chk|`2Enable Watermark in Chat|]] .. wm_status .. [[|
add_spacer|small|
add_label|big|`9Watermark Text & Color Settings:|left|2064|
add_text_input|wm_name_input|`9Watermark Name:|]] .. curName .. [[|15|
add_text_input|wm_color_input|`9Color (Letter/Number):|]] .. curColor .. [[|5|
add_spacer|small|
add_button|btn_wm_save|`2Save Watermark|noflags|0|0|
add_button|btn_wm_default|`4Restore Default|noflags|0|0|
add_spacer|small|
add_button|btn_open_wm_emote|`cWatermark Emotes Settings|noflags|0|0|
add_spacer|small|
add_label_with_icon|small|`4COLOR CODES GUIDE (No Backtick Needed)|left|3210|
add_textbox|`44 `w= For Red Colour|left|
add_textbox|`cc `w= For Cyan Colour|left|
add_textbox|`## `w= For Purple Colour|left|
add_spacer|small|
add_label_with_icon|small|`4HELL PROXY - WATERMARK TIPS|left|3210|
add_textbox|`c* `wType letter/number directly without backtick into the Color field.|left|
add_textbox|`c* `wType `2/wm `wto quickly toggle watermark ON/OFF anytime in chat.|left|
add_spacer|small|
add_button|lonkback|Back|
end_dialog|wm_manager|Close|
]])
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialog })
end

-- ==========================================
-- SERIALISASI & SAVE CONFIG
-- ==========================================
local function serialize_value(v, indent)
    indent = indent or ""
    local t = type(v)
    if t == "nil" then
        return "nil"
    elseif t == "string" then
        return string.format("%q", v)
    elseif t == "number" or t == "boolean" then
        return tostring(v)
    elseif t == "table" then
        local items = {}
        for k, val in pairs(v) do
            local key = type(k) == "string" and string.format("[%q]", k) or "[" .. tostring(k) .. "]"
            local val_str = serialize_value(val, indent .. "  ")
            table.insert(items, indent .. "  " .. key .. " = " .. val_str)
        end
        if #items == 0 then
            return "{}"
        else
            return "{\n" .. table.concat(items, ",\n") .. "\n" .. indent .. "}"
        end
    else
        return "nil"
    end
end

local function get_config_paths()
    local paths = {}
    
    -- 1. Windows PC: %LOCALAPPDATA%\Growtopia\scripts\HELLCONFIG.txt (Dinamis untuk semua user PC)
    local okEnv, localAppData = pcall(os.getenv, "LOCALAPPDATA")
    if okEnv and localAppData and localAppData ~= "" then
        table.insert(paths, localAppData .. "\\Growtopia\\scripts\\HELLCONFIG.txt")
        table.insert(paths, localAppData .. "\\Growtopia\\HELLCONFIG.txt")
    end
    
    local okUser, userProfile = pcall(os.getenv, "USERPROFILE")
    if okUser and userProfile and userProfile ~= "" then
        table.insert(paths, userProfile .. "\\AppData\\Local\\Growtopia\\scripts\\HELLCONFIG.txt")
    end
    
    -- Static Fallback PC
    table.insert(paths, "C:\\Users\\ACER\\AppData\\Local\\Growtopia\\scripts\\HELLCONFIG.txt")
    
    -- 2. Android: /storage/emulated/0/Android/media/com.rtsoft.growtopia/scripts/
    table.insert(paths, "/storage/emulated/0/Android/media/com.rtsoft.growtopia/scripts/HELLCONFIG.txt")
    table.insert(paths, "/storage/emulated/0/Android/data/com.rtsoft.growtopia/files/scripts/HELLCONFIG.txt")
    table.insert(paths, "/storage/emulated/0/Growtopia/scripts/HELLCONFIG.txt")
    table.insert(paths, "/storage/emulated/0/HELLCONFIG.txt")
    table.insert(paths, "/sdcard/HELLCONFIG.txt")
    
    -- 3. Relative fallbacks
    table.insert(paths, "scripts/HELLCONFIG.txt")
    table.insert(paths, "HELLCONFIG.txt")
    table.insert(paths, "HELLCONFIG")
    
    return paths
end

local function get_clean_config_state()
    local clean = {}
    local ignoreKeys = {
        spins_dialog = true,
        derop_dialog = true,
        kolek_dialog = true,
        faker_dialog = true,
        spam_active = true,
    }
    for k, v in pairs(state) do
        if not ignoreKeys[k] then
            clean[k] = v
        end
    end
    return clean
end

function save_config()
    local clean_state = get_clean_config_state()
    local content = "return " .. serialize_value(clean_state, "") .. "\n"
    local paths = get_config_paths()
    for _, path in ipairs(paths) do
        local ok, f = pcall(io.open, path, "w")
        if ok and f then
            f:write(content)
            f:close()
            return true
        end
    end
    return false
end

function load_config()
    local loadChunk = function(str)
        local loadFunc = loadstring or load
        if type(loadFunc) == "function" then
            local ok, res = pcall(loadFunc, str)
            if ok and res then return res end
        end
        return nil
    end

    local paths = get_config_paths()
    for _, path in ipairs(paths) do
        local okOpen, f = pcall(io.open, path, "r")
        if okOpen and f then
            local content = f:read("*all")
            f:close()
            if content and content ~= "" then
                local chunk = loadChunk(content)
                if not chunk and type(loadfile) == "function" then
                    local okLf, resLf = pcall(loadfile, path)
                    if okLf and resLf then chunk = resLf end
                end
                if chunk then
                    local okExec, loaded_state = pcall(chunk)
                    if okExec and type(loaded_state) == "table" then
                        for k, v in pairs(loaded_state) do
                            state[k] = v
                        end
                        if type(state.apt_blacklist) == "table" then
                            local normalized = {}
                            for k, v in pairs(state.apt_blacklist) do
                                local numKey = tonumber(k)
                                local numVal = tonumber(v)
                                if numKey and v == true then
                                    normalized[numKey] = true
                                elseif numVal and type(k) == "number" then
                                    normalized[numVal] = true
                                end
                            end
                            state.apt_blacklist = normalized
                        else
                            state.apt_blacklist = {}
                        end
                        return true
                    end
                end
            end
        end
    end
    return false
end

chatCommands = {}
buttonHandlers = {}
local original_commands = {}

local function serializeCustomDropAliases(aliases)
    local parts = {}
    for alias, target in pairs(aliases) do
        table.insert(parts, alias .. "=" .. target)
    end
    return table.concat(parts, ";")
end

local function registerCommandAlias(alias, target)
    if type(alias) ~= "string" or type(target) ~= "string" then return false end
    alias = cleanCmdInput(alias)
    target = cleanCmdInput(target)
    if alias == "" or target == "" then return false end
    local handler = original_commands[target] or chatCommands[target]
    if not handler then return false end
    chatCommands[alias] = handler
    return true
end

local function applyCustomDropAliases()
    local aliases = parseCustomDropAliases(state.custom_drop_aliases)
    for alias, target in pairs(aliases) do
        registerCommandAlias(alias, target)
    end
end

local function applyDisabledCommands()
    if not state.disabled_commands then state.disabled_commands = {} end
    for cmd, _ in pairs(state.disabled_commands) do
        chatCommands[cmd] = nil
    end
end

local function removeAliasPointingTo(target)
    target = cleanCmdInput(target)
    local aliases = parseCustomDropAliases(state.custom_drop_aliases)
    local new_aliases = {}
    local removed = {}
    for alias, t in pairs(aliases) do
        if t == target or alias == target then
            chatCommands[alias] = nil
            table.insert(removed, alias)
        else
            new_aliases[alias] = t
        end
    end
    state.custom_drop_aliases = serializeCustomDropAliases(new_aliases)
    return removed
end

-- ==========================================
-- FUNGSI BANTU
-- ==========================================
local function get_champagne_item_id()
    return -630
end

local function format_locks_short(black, bgl, dl, wl)
    local parts = {}
    if black and black > 0 then
        table.insert(parts, "`w" .. black .. " `bBLACK")
    end
    if bgl and bgl > 0 then
        table.insert(parts, "`w" .. bgl .. " `eBGL")
    end
    if dl and dl > 0 then
        table.insert(parts, "`w" .. dl .. " `cDL")
    end
    if wl and wl > 0 then
        table.insert(parts, "`w" .. wl .. " `9WL")
    end
    if #parts == 0 then return "`w0 WL" end
    return table.concat(parts, " ")
end

local function format_inventory_balance_message(summary)
    local total_black = summary.blackgl_count + math.floor(summary.bgl_count / 100)
    local sisa_bgl = summary.bgl_count % 100
    local black_str = string.format("%d.%02d", total_black, sisa_bgl)
    return string.format("`^%s`w's Balance: `w%s Black, Champ: `2%d",
        summary.playername,
        black_str,
        summary.champ_count
    )
end

local function parse_inventory_summary_from_dialog(dialog)
    local raw = tostring(dialog or "")
    if raw == "" then return nil end
    if not raw:find("'s Inventory", 1, true) then return nil end

    -- Clean color codes first so number matching is 100% accurate
    local text = raw:gsub("`.", "")

    local playername = text:match("|big|.-([^|]+)'s Inventory")
    if not playername then
        playername = text:match("([^|\r\n]+)'s Inventory")
    end
    if not playername or playername == "" or playername == "Unknown" then return nil end

    local userid = nil
    local pName, pUID = playername:match("^(.-)%s*%(#(%d+)%)")
    if pName and pUID then
        playername = pName:gsub("[%+%s%@]+", " "):gsub("^%s+", ""):gsub("%s+$", "")
        userid = tonumber(pUID)
    else
        playername = playername:gsub("'s Inventory", ""):gsub("[%+%s%@]+", " "):gsub("^%s+", ""):gsub("%s+$", "")
    end
    if not userid then
        local uidInText = text:match("%(#(%d+)%)") or text:match("UserID:%s*(%d+)")
        if uidInText then userid = tonumber(uidInText) end
    end

    -- Parse bank numbers accurately from color-stripped text
    local bglbank = parse_dialog_number(text:match("Blue Gem Locks in the Bank:%s*([%d,]+)"))
    local blackbank = parse_dialog_number(text:match("Black Gem Locks in the Bank:%s*([%d,]+)"))
    local blackgl_count = 0
    local bgl_count = 0
    local dl_count = 0
    local wl_count = 0
    local champ_count = 0

    for line in raw:gmatch("[^\r\n]+") do
        -- Support all Growtopia add_button_with_icon slot variants:
        -- add_button_with_icon|<name>|<text>|<flags>|<itemID>|<count>|
        local id1, cnt1 = line:match("add_button_with_icon|[^|]*|[^|]*|[^|]*|(%-?%d+)|?(%d*)|")
        if not id1 then
            id1, cnt1 = line:match("add_button_with_icon|[^|]*|[^|]*|[^|]*|(%-?%d+)|?(%d*)")
        end
        if id1 then
            local itemID = tonumber(id1)
            local count = tonumber(cnt1)
            if not count or count == 0 then count = 1 end

            if itemID == 11550 then
                blackgl_count = blackgl_count + count
            elseif itemID == 7188 then
                bgl_count = bgl_count + count
            elseif itemID == 1796 then
                dl_count = dl_count + count
            elseif itemID == 242 then
                wl_count = wl_count + count
            end
        end

        if line:find("Champagne", 1, true) then
            local guessed = parse_dialog_number(line:match("|%-?%d+|([%d,]+)"))
            if guessed > champ_count then champ_count = guessed end
        end
    end

    return {
        playername = Filter(playername),
        userid = userid,
        blackgl_count = blackgl_count + blackbank,
        bgl_count = bgl_count + bglbank,
        dl_count = dl_count,
        wl_count = wl_count,
        champ_count = champ_count,
    }
end

local function TextOverlay(text)
    SendVariantList({ [0] = "OnTextOverlay", [1] = text })
end

local function say(x)
    SendPacket(2, "action|input\n|text|" .. x)
end

local function ov(x)
    TextOverlay(x)
end

local function applySkin(r, g, b, name)
    if state.skin_blink then
        state.skin_blink = false
    end
    TextOverlay("`2Skin set to : `w" .. name)
    SendPacket(2, "action|dialog_return\ndialog_name|skinpicker\nred|" .. r .. "\ngreen|" .. g .. "\nblue|" .. b .. "\ntransparency|0")
    return true
end

RunThread(function()
    while true do
        if state.skin_blink then
            local colors = {
                3370516479, 3033464831, 2864971775, 2527912447,
                2190853119, 2022356223, 1685231359, 1348231359,
                1348231359, 1685231359, 2022356223, 2190853119,
                2527912447, 2864971775, 3033464831, 3370516479
            }
            for _, color in ipairs(colors) do
                if not state.skin_blink then break end
                SendPacket(2, "action|setSkin\ncolor|" .. color)
                Sleep(150)
            end
        else
            Sleep(200)
        end
    end
end)

function smenu()
    local sm = [[
set_border_color|]] .. state.BD_red .. [[,]] .. state.BD_green .. [[,]] .. state.BD_blue .. [[,]] .. state.BD_transparan .. [[|
set_bg_color|]] .. state.BG_red .. [[,]] .. state.BG_green .. [[,]] .. state.BG_blue .. [[,]] .. state.BG_transparan .. [[|
add_label_with_icon|big|`wSkin Menu|left|12170|
add_spacer|small|
add_textbox|`wInput The Color `4Red`w,`2Green`w,`eBlue`w ( 1-255 )|
add_textbox|`wExample : 255,255,255|
add_text_input|bgcolor|`4R`w,`2G`w,`eB : |]] .. state.rs .. [[,]] .. state.gs .. [[,]] .. state.bs .. [[|12|
add_spacer|small|
add_button|applys|Apply Skin|
add_spacer|small|
add_label_with_icon|small|`wSelect Skin ( optional ) :|left|1420|
add_spacer|small|
add_button|wskin|`wWhite Skin|
add_button|bskin|`wBlack Skin|
add_button|rskin|`wRed Skin|
add_button|gskin|`wGreen Skin|
add_button|blueskin|`wBlue Skin|
add_button|yskin|`wYellow Skin|
add_button|pskin|`wPink Skin|
add_button|uskin|`wPurple Skin|
add_button|blinkskin|`wBlink Skin|
add_spacer|small|
add_button|backmenu|Back|
end_dialog|cmd|   CLOSE    |
add_quick_exit||
]]
    SendVariantList({[0] = "OnDialogRequest", [1] = sm})
end

function dialogcustom()
    local dialogpicker = [[
set_border_color|]] .. state.BD_red .. [[,]] .. state.BD_green .. [[,]] .. state.BD_blue .. [[,]] .. state.BD_transparan .. [[|
set_bg_color|]] .. state.BG_red .. [[,]] .. state.BG_green .. [[,]] .. state.BG_blue .. [[,]] .. state.BG_transparan .. [[|
set_default_color|`0|
add_label_with_icon|big|`wDialog Color Menu    |left|11550|||||||||
add_spacer|small|
add_textbox|`w- Background :|
add_text_input|colorbg| `4R`w,`2G`w,`eB : |]] .. state.BD_red .. [[,]] .. state.BD_green .. [[,]] .. state.BD_blue .. [[|12|
add_text_input|Tparancy| Transparency : |]] .. state.BD_transparan .. [[|6|
add_spacer|small|
add_textbox|`w- Border :|
add_text_input|Colorborder| `4R`w,`2G`w,`eB : |]] .. state.BG_red .. [[,]] .. state.BG_green .. [[,]] .. state.BG_blue .. [[|12|
add_text_input|Bgtrans| Transparency : |]] .. state.BG_transparan .. [[|6|
add_spacer|small|
add_textbox|`w- Dialogue Available :|
add_button|dialog_hitam|`wBlack Dialog|
add_button|dialog_putih|`wWhite Dialog|
add_button|dialog_default|`wDefault Dialog|
add_button|dialog_pink|`wPink Dialog|
add_button|dialog_transparan|`wClear Dialog|
add_spacer|small|
add_button|backmenu|Back|
add_quick_exit||
end_dialog|menus|Cancel|OK|]]
    SendVariantList({[0] = "OnDialogRequest", [1] = dialogpicker})
end

local function setDialog(bg_r, bg_g, bg_b, bg_t, bd_r, bd_g, bd_b, bd_t, name)
    state.BG_red, state.BG_green, state.BG_blue, state.BG_transparan = bg_r, bg_g, bg_b, bg_t
    state.BD_red, state.BD_green, state.BD_blue, state.BD_transparan = bd_r, bd_g, bd_b, bd_t
    ov("`wUI Change and Set to : " .. name)
    dialogcustom()
end

local function FindTP(x, y)
    FindPath(math.floor(x), math.floor(y))
end

local function GetRandomEmoji()
    local EmojiString = '(wl)(yes)(no)(love)(oops)(shy)(wink)(tongue)(agree)(sleep)(punch)(music)(build)(megaphone)(sigh)(mad)(wow)(dance)(bheart)(heart)(grow)(gems)(kiss)(gtoken)(lol)(smile)(cool)(cry)(vend)(bunny)(cactus)(pine)(peace)(terror)(troll)(evil)(fireworks)(football)(alien)(party)(pizza)(clap)(song)(ghost)(nuke)(halo)(turkey)(gift)(cake)(heartarrow)(lucky)(shamrock)(grin)(ill)(eyes)(weary)(moyai)(plead)'
    local Emojis = {}
    for Emoji in EmojiString:gmatch('(%w+)') do
        table.insert(Emojis, Emoji)
    end
    return '(' .. Emojis[math.random(#Emojis)] .. ')'
end

-- ==========================================
-- FUNGSI KONVERSI LOCK UNTUK WEBHOOK
-- ==========================================
local function formatLockAmount(amount, itemID)
    if amount == 0 then return "0" end
    local result = {}
    if itemID == 7188 then -- BGL
        local black = math.floor(amount / 100)
        local bgl = amount % 100
        if black > 0 then table.insert(result, string.format("%d Black", black)) end
        if bgl > 0 then table.insert(result, string.format("%d BGL", bgl)) end
        if #result == 0 then return "0 BGL" end
        return table.concat(result, ", ")
    elseif itemID == 11550 then -- Black GL (tidak ada konversi lebih tinggi)
        return string.format("%d Black", amount)
    elseif itemID == 1796 then -- DL -> BGL + DL
        local bgl = math.floor(amount / 100)
        local dl = amount % 100
        if bgl > 0 then table.insert(result, string.format("%d BGL", bgl)) end
        if dl > 0 then table.insert(result, string.format("%d DL", dl)) end
        if #result == 0 then return "0 DL" end
        return table.concat(result, ", ")
    elseif itemID == 242 then -- WL -> DL + WL
        local dl = math.floor(amount / 100)
        local wl = amount % 100
        if dl > 0 then table.insert(result, string.format("%d DL", dl)) end
        if wl > 0 then table.insert(result, string.format("%d WL", wl)) end
        if #result == 0 then return "0 WL" end
        return table.concat(result, ", ")
    else
        return string.format("%d item", amount)
    end
end

-- ==========================================
-- WEBHOOK (clean, content kosong)
-- ==========================================
local function Webhuk(url, username, content, message)
    if url == "" then return end
    
    local cleanMessage = Filter(message)
    cleanMessage = cleanMessage:gsub("\"", "\\\"")
    cleanMessage = cleanMessage:gsub("\n", " ")
    
    local json = string.format([[
{
    "username": "%s",
    "content": "",
    "embeds": [{
        "color": %d,
        "description": "**%s**",
        "footer": {"text": "Date: %s"}
    }]
}
]], username, math.random(0, 16777215), cleanMessage, os.date("%A %b %d, %Y | Time: %I:%M %p"))
    
    RunThread(function()
        pcall(function()
            MakeRequest(url, "POST", { ["Content-Type"] = "application/json" }, json)
        end)
    end)
end

-- ==========================================
-- FUNGSI LAINNYA & SAFE HELPERS
-- ==========================================
local function GetSafeWorld()
    local ok, w = pcall(GetWorld)
    if ok and w then return w end
    return nil
end

local function GetSafeWorldName()
    local w = GetSafeWorld()
    if w and w.name and w.name ~= "" then
        return w.name
    end
    return "EXIT"
end

local function GetSafeLocal()
    local ok, lp = pcall(GetLocal)
    if ok and lp then return lp end
    return nil
end

local function GetSafeLocalName()
    local lp = GetSafeLocal()
    if lp and lp.name and lp.name ~= "" then
        return Filter(lp.name)
    end
    return "Unknown"
end

local function getItemCount(id)
    local inv = GetInventory() or {}
    for _, item in pairs(inv) do
        if item.id == id then
            return item.amount
        end
    end
    return 0
end

local function wear(id)
    SendPacketRaw(false, { type = 10, value = id })
end

local function relog()
    local worldName = GetSafeWorldName()
    if worldName ~= "EXIT" and worldName ~= "Unknown" then
        SendPacket(3, "action|join_request\nname|" .. worldName .. "\ninvitedWorld|0")
    end
end

local function find_netid_by_name_or_uid(name, uid)
    local ok, pList = pcall(GetPlayerList)
    if not ok or not pList then return nil end
    local cleanTargetName = name and Filter(name):lower():gsub("[%+%s%@]+", "")
    local targetUid = tonumber(uid or 0)

    for _, p in pairs(pList) do
        local pNet = tonumber(p.netid or p.netID)
        local pUid = tonumber(p.userid or p.userID or 0)
        local pName = p.name and Filter(p.name):lower():gsub("[%+%s%@]+", "")

        if targetUid ~= 0 and pUid ~= 0 and pUid == targetUid then
            return pNet
        end
        if cleanTargetName and pName and cleanTargetName ~= "" and (cleanTargetName == pName or pName:find(cleanTargetName, 1, true) or cleanTargetName:find(pName, 1, true)) then
            return pNet
        end
    end
    return nil
end

local function find_closest_player(pos)
    local isLocalSuccess, localPlayer = pcall(GetLocal)
    local localNetID = isLocalSuccess and localPlayer and tonumber(localPlayer.netID or localPlayer.netid) or nil
    local isListSuccess, playerList = pcall(GetPlayerList)
    if not isListSuccess or not playerList then return nil end
    local targetX = tonumber(pos.x)
    local targetY = tonumber(pos.y)
    local closestPlayer = nil
    local minDistanceSq = nil
    local maxSearchRadiusSq = 1600
    for _, player in pairs(playerList) do
        local playerNetID = tonumber(player.netID or player.netid)
        local playerPos = player and player.pos
        if playerNetID and playerPos and playerPos.x and playerPos.y and playerNetID ~= localNetID then
            local dx = tonumber(playerPos.x) - targetX
            local dy = tonumber(playerPos.y) - targetY
            local distSq = (dx * dx) + (dy * dy)
            if distSq <= maxSearchRadiusSq and (not minDistanceSq or distSq < minDistanceSq) then
                closestPlayer = player
                minDistanceSq = distSq
            end
        end
    end
    return closestPlayer
end

local function perform_wrench_action(netid, playerName, options)
    local targetNetID = tonumber(netid)
    if not targetNetID then return false end
    local isLocalSuccess, localPlayer = pcall(GetLocal)
    local localNetID = isLocalSuccess and localPlayer and tonumber(localPlayer.netID or localPlayer.netid) or nil
    if localNetID and targetNetID == localNetID then return false end
    local opts = type(options) == "table" and options or {}
    local forcePull = opts.force_pull or false
    local allowShowBal = opts.allow_showbal
    if allowShowBal == nil then allowShowBal = true end
    if not state.showmodal then allowShowBal = false end
    local name = playerName or "Unknown"
    local executed = false
    if forcePull or state.pull then
        SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. targetNetID .. "|\nbuttonClicked|pull")
        if has_valid_chat_text(state.pull_msg) then
            local msg = state.pull_msg:gsub("{name}", name)
            if has_valid_chat_text(msg) then
                SendPacket(2, "action|input\ntext|" .. msg)
            end
        end
        if allowShowBal and state.showmodal then
            RunDelayed(100, function(id)
                SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. id .. "|\nbuttonClicked|viewinv")
            end, targetNetID)
        end
        executed = true
    elseif state.kick then
        SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. targetNetID .. "|\nbuttonClicked|kick")
        if has_valid_chat_text(state.kick_msg) then
            local msg = state.kick_msg:gsub("{name}", name)
            if has_valid_chat_text(msg) then
                SendPacket(2, "action|input\ntext|" .. msg)
            end
        end
        executed = true
    elseif state.ban then
        SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. targetNetID .. "|\nbuttonClicked|world_ban")
        executed = true
    end
    return executed
end

local function should_skip_player(p)
    if not p then return true end
    local targetNet = tonumber(p.netid or p.netID)
    local targetUid = tonumber(p.userid or p.userID)
    local targetName = p.name and Filter(p.name):lower():gsub("[%+%s%@]+", "")

    -- Check blacklist
    if targetUid and is_user_blacklisted(targetUid) then
        return true -- Blocked by blacklist
    end

    -- Skip local player (by NetID, UserID, or Name)
    local lp = GetSafeLocal()
    if lp then
        local lpNet = tonumber(lp.netid or lp.netID)
        if lpNet and targetNet and lpNet == targetNet then
            return true
        end
        local lpUid = tonumber(lp.userid or lp.userID or 0)
        if lpUid and targetUid and lpUid ~= 0 and lpUid == targetUid then
            return true
        end
        local lpName = lp.name and Filter(lp.name):lower():gsub("[%+%s%@]+", "")
        if lpName and targetName and lpName ~= "" and (lpName == targetName or targetName:find(lpName, 1, true)) then
            return true
        end
    end

    return false
end

local function check_and_execute_pull(player, reason)
    if not player then return end
    if should_skip_player(player) then return end

    local netID = tonumber(player.netID or player.netid)
    local userID = tonumber(player.userid or player.userID)
    local playerName = player.name or "Unknown"
    if not netID then return end

    -- Check cooldown (0.02s ultra-fast for Hold Mode, 1.0s for regular OnSpawn)
    local now = os.clock()
    local cooldownDuration = (reason and reason:find("Hold")) and 0.02 or 1.0
    if apt_pull_cooldown[netID] and (now - apt_pull_cooldown[netID] < cooldownDuration) then
        return
    end

    local min_modal = tonumber(state.apt_min_modal) or 0
    if min_modal <= 0 then
        -- Direct pull without min modal requirement
        apt_pull_cooldown[netID] = now
        SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. netID .. "|\nbuttonClicked|pull")
        local cleanName = Filter(playerName)
        if has_valid_chat_text(state.pull_msg) then
            local msg = state.pull_msg:gsub("{name}", cleanName)
            if has_valid_chat_text(msg) then
                SendPacket(2, "action|input\ntext|" .. msg)
            end
        end
        TextOverlay("`w[`2APT`w] Auto Pulled `2" .. cleanName .. " `w(" .. (reason or "Scan") .. ")")
        if webhook.pull and webhook.pull ~= "" then
            local lpName = GetSafeLocalName()
            local worldName = GetSafeWorldName()
            Webhuk(webhook.pull, "Proxy TeamHELL", "", "**Player:** `2" .. lpName .. "`w\n**Action:** Auto Pulled `4" .. cleanName .. "`w (UID: `9" .. (userID or "?") .. "`w)\n**Reason:** " .. (reason or "Scan") .. "\n**World:** `9" .. worldName .. "`w\n**Time:** " .. os.date("%I:%M %p"))
        end
    else
        -- Min modal required: request viewinv silently
        apt_pull_cooldown[netID] = now
        pending_modal_pull[netID] = {
            netid = netID,
            userid = userID,
            name = Filter(playerName),
            reason = reason or "Scan",
            timestamp = now,
        }
        SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. netID .. "|\nbuttonClicked|viewinv")
    end
end

local function make_rainbow_text(text)
    local clean_text = Filter(text)
    local result = ""
    for char in clean_text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        if char == " " then
            result = result .. " "
        else
            local random_color = colors[math.random(#colors)]
            result = result .. random_color .. char
        end
    end
    return result
end

local function start_spammer_thread()
    state.spam_active = true
    RunThread(function()
        while state.spam_active do
            local sentAny = false
            if state.use_text1 and state.spam_text1 and state.spam_text1 ~= "" then
                local text = state.spam_text1
                if state.spam_rainbow then
                    text = make_rainbow_text(text)
                elseif state.spam_rline then
                    text = colors[math.random(#colors)] .. Filter(text)
                end
                SendPacket(2, "action|input\n|text|" .. text)
                sentAny = true
                Sleep(math.max(100, tonumber(state.delay1) or 2000))
            end
            if not state.spam_active then break end
            if state.use_text2 and state.spam_text2 and state.spam_text2 ~= "" then
                local text = state.spam_text2
                if state.spam_rainbow then
                    text = make_rainbow_text(text)
                elseif state.spam_rline then
                    text = colors[math.random(#colors)] .. Filter(text)
                end
                SendPacket(2, "action|input\n|text|" .. text)
                sentAny = true
                Sleep(math.max(100, tonumber(state.delay2) or 2000))
            end
            if not state.spam_active then break end
            if state.use_text3 and state.spam_text3 and state.spam_text3 ~= "" then
                local text = state.spam_text3
                if state.spam_rainbow then
                    text = make_rainbow_text(text)
                elseif state.spam_rline then
                    text = colors[math.random(#colors)] .. Filter(text)
                end
                SendPacket(2, "action|input\n|text|" .. text)
                sentAny = true
                Sleep(math.max(100, tonumber(state.delay3) or 2000))
            end
            if not state.spam_active then break end
            if state.use_text4 and state.spam_text4 and state.spam_text4 ~= "" then
                local text = state.spam_text4
                if state.spam_rainbow then
                    text = make_rainbow_text(text)
                elseif state.spam_rline then
                    text = colors[math.random(#colors)] .. Filter(text)
                end
                SendPacket(2, "action|input\n|text|" .. text)
                sentAny = true
                Sleep(math.max(100, tonumber(state.delay4) or 2000))
            end
            if not sentAny then
                Sleep(500)
            end
        end
    end)
end

local function ShowSpammerMenu()
    local start_stop_btn = ""
    if state.spam_active then
        start_stop_btn = "add_small_font_button|spam_toggle|`4Stop Spam|noflags|0|0|\n"
    else
        start_stop_btn = "add_small_font_button|spam_toggle|`2Start Spam|noflags|0|0|\n"
    end
    local checkbox1 = state.use_text1 and 1 or 0
    local checkbox2 = state.use_text2 and 1 or 0
    local checkbox3 = state.use_text3 and 1 or 0
    local checkbox4 = state.use_text4 and 1 or 0
    local rainbow_checkbox = state.spam_rainbow and 1 or 0
    local rline_checkbox = state.spam_rline and 1 or 0
    local dialog = "set_default_color|`w\n" ..
        "add_label_with_icon|big|`cSpammer Menu|left|32|\n" ..
        "add_spacer|small|\n" ..
        "add_checkbox|spam_rb|`cRainbow Character Spam|" .. rainbow_checkbox .. "|\n" ..
        "add_checkbox|spam_rline|`cRainbow Line Spam|" .. rline_checkbox .. "|\n" ..
        "add_spacer|small|\n" ..
        "add_checkbox|use_t1|`7Use Text 1|" .. checkbox1 .. "|\n" ..
        "add_text_input|t1|Text 1:|" .. state.spam_text1 .. "|100|\n" ..
        "add_text_input|d1|Delay 1 (ms):|" .. state.delay1 .. "|9|\n" ..
        "add_spacer|small|\n" ..
        "add_checkbox|use_t2|`7Use Text 2|" .. checkbox2 .. "|\n" ..
        "add_text_input|t2|Text 2:|" .. state.spam_text2 .. "|100|\n" ..
        "add_text_input|d2|Delay 2 (ms):|" .. state.delay2 .. "|9|\n" ..
        "add_spacer|small|\n" ..
        "add_checkbox|use_t3|`7Use Text 3|" .. checkbox3 .. "|\n" ..
        "add_text_input|t3|Text 3:|" .. state.spam_text3 .. "|100|\n" ..
        "add_text_input|d3|Delay 3 (ms):|" .. state.delay3 .. "|9|\n" ..
        "add_spacer|small|\n" ..
        "add_checkbox|use_t4|`7Use Text 4|" .. checkbox4 .. "|\n" ..
        "add_text_input|t4|Text 4:|" .. state.spam_text4 .. "|100|\n" ..
        "add_text_input|d4|Delay 4 (ms):|" .. state.delay4 .. "|9|\n" ..
        "add_spacer|small|\n" ..
        start_stop_btn ..
        "add_quick_exit|\n" ..
        "end_dialog|spam_menu|Close|Save Setting|\n"
    SendVariantList({ [0] = 'OnDialogRequest', [1] = dialog })
end

-- === Prediksi spin ===
local function remefunc(number)
    if number == 19 or number == 28 or number == 0 then return 0 end
    local num1 = math.floor(number / 10)
    local num2 = number % 10
    return tonumber((string.sub(tostring(num1 + num2), -1)))
end

local function qemefunc(number)
    if number >= 10 then return tonumber((string.sub(number, -1)))
    elseif number == 0 then return 1 end
    return number
end

local function lewax6func(number)
    local num = tonumber(number) or 0
    local mod10 = num % 10
    local mod100 = num % 100
    if num == 0 then return 1, "AUTO" end
    if mod100 == 10 or mod100 == 20 or mod100 == 30 then return 0, "X6" end
    if mod100 == 9 or mod100 == 19 or mod100 == 29 then return 9, "X3" end
    if mod100 == 1 or mod100 == 11 or mod100 == 21 or mod100 == 31 then return 1, "AUTO" end
    if mod100 == 2 or mod100 == 12 or mod100 == 22 or mod100 == 32 then return 2, "AUTO" end
    return mod10, nil
end

local function lewax7func(number)
    local num = tonumber(number) or 0
    local mod10 = num % 10
    local mod100 = num % 100
    if num == 0 then return 1, "AUTO" end
    if mod100 == 10 or mod100 == 20 or mod100 == 30 then return 0, "X7" end
    if mod100 == 9 or mod100 == 19 or mod100 == 29 then return 9, "X3" end
    if mod100 == 1 or mod100 == 11 or mod100 == 21 or mod100 == 31 then return 1, "AUTO" end
    if mod100 == 2 or mod100 == 12 or mod100 == 22 or mod100 == 32 then return 2, "AUTO" end
    if mod100 == 3 or mod100 == 13 or mod100 == 23 or mod100 == 33 then return 3, "AUTO" end
    return mod10, nil
end

local function lemefunc(number)
    if number == 1 or number == 10 or number == 29 then return 1
    elseif number == 0 or number == 19 or number == 28 then return 0 end
    local num1 = math.floor(number / 10)
    local num2 = number % 10
    return tonumber((string.sub(tostring(num1 + num2), -1)))
end

local function lemeagusfunc(number)
    local num = tonumber(number) or 0
    local num1 = math.floor(num / 10)
    local num2 = num % 10
    return (num1 + num2) % 10
end

local function slemefunc(number)
    if number == 19 or number == 28 then return 0, "x5"
    elseif number == 1 or number == 10 or number == 29 then return 1, "x3"
    elseif number == 0 then return 0, "lose" end
    local num1 = math.floor(number / 10)
    local num2 = number % 10
    local hasil = (num1 + num2) % 10
    if hasil == 2 or hasil == 3 or hasil == 9 then return hasil, "lose" end
    return hasil, "normal"
end

local function getGame(num)
    local mode = ""
    local result = 0
    local color = "`w"
    local autoWinText = ""
    if state.reme then
        mode = "REME"
        result = remefunc(tonumber(num))
        if result >= 1 and result <= 4 then color = "`4"
        elseif result == 5 or result == 6 then color = "`9"
        elseif result == 7 or result == 8 or result == 9 or result == 0 then color = "`2" end
        if result == 0 then autoWinText = "`2X3" elseif result == 1 then autoWinText = "`4LOSE" end
    elseif state.qeme then
        mode = "QEME"
        result = qemefunc(tonumber(num))
        if result >= 1 and result <= 4 then color = "`4"
        elseif result == 5 or result == 6 then color = "`9"
        elseif result >= 7 and result <= 9 or result == 0 then color = "`2" end
        if result == 0 then autoWinText = "`2X3" elseif result == 1 then autoWinText = "`4LOSE" end
    elseif state.leme then
        mode = "LEME"
        result = lemefunc(tonumber(num))
        if result == 2 or result == 9 then color = "`4"
        elseif result >= 3 and result <= 5 then color = "`9"
        elseif result == 6 or result == 7 or result == 8 or result == 1 or result == 0 then color = "`2" end
        if result == 1 then autoWinText = "`2X3"
        elseif result == 0 then autoWinText = "`2X4"
        elseif result == 2 or result == 9 then autoWinText = "`4LOSE" end
    elseif state.sleme then
        local val, status = slemefunc(tonumber(num))
        result = val
        mode = "SLEME"
        if status == "x5" then color = "`2" autoWinText = "`2X5"
        elseif status == "x3" then color = "`2" autoWinText = "`2X3"
        elseif status == "lose" then color = "`4" autoWinText = "`4LOSE"
        elseif result == 7 or result == 8 then color = "`2"
        else color = "`9" end
    elseif state.lewa6 then
        mode = "LX6"
        local value, label = lewax6func(tonumber(num))
        result = value
        if label == "X6" or label == "X3" or label == "AUTO" then
            color = "`2"
            if label == "AUTO" then autoWinText = "`2AUTO" else autoWinText = "`2" .. label end
        else
            if result >= 7 and result <= 9 then color = "`2"
            elseif result >= 4 and result <= 6 then color = "`9"
            else color = "`4" end
        end
    elseif state.lewa7 then
        mode = "LX7"
        local value, label = lewax7func(tonumber(num))
        result = value
        if label == "X7" or label == "X3" or label == "AUTO" then
            color = "`2"
            if label == "AUTO" then autoWinText = "`2AUTO" else autoWinText = "`2" .. label end
        else
            if result >= 7 and result <= 9 then color = "`2"
            elseif result >= 4 and result <= 6 then color = "`9"
            else color = "`4" end
        end
    elseif state.lemeagus then
        mode = "LEME AGUS"
        result = lemeagusfunc(tonumber(num))
        if result == 0 or result == 1 or result == 7 or result == 8 or result == 9 then
            color = "`2"
        elseif result == 5 or result == 6 then
            color = "`9"
        elseif result == 2 or result == 3 or result == 4 then
            color = "`4"
        end

        if result == 0 or result == 1 then
            autoWinText = "`2X4"
        elseif result == 2 then
            autoWinText = "`2AUTO"
        elseif result == 3 then
            autoWinText = "`4LOSE"
        end
    elseif state.lemeagus3 then
        mode = "LEME AGUS"
        result = lemeagusfunc(tonumber(num))
        if result == 0 or result == 1 or result == 7 or result == 8 or result == 9 then
            color = "`2"
        elseif result == 5 or result == 6 then
            color = "`9"
        elseif result == 2 or result == 3 or result == 4 then
            color = "`4"
        end

        if result == 0 or result == 1 then
            autoWinText = "`2X4"
        elseif result == 2 or result == 3 then
            autoWinText = "`2AUTO"
        elseif result == 4 then
            autoWinText = "`4LOSE"
        end
    end
    local gameText = "`b[`9" .. mode .. "`w: " .. color .. tostring(result) .. "`b]"
    if autoWinText ~= "" then gameText = gameText .. "[" .. autoWinText .. "`b]" end
    return gameText
end

local function ShowLogsMenu()
    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Proxy Activity Logs Menu|left|1436|
add_spacer|small|
add_textbox|`wSelect which activity logs you would like to view or manage:|left|
add_spacer|small|
add_button|checkSpinLogs|`2Roulette Spin Logs|noflags|0|0|
add_button|fakerplayer|`9Typer Spin Logs|noflags|0|0|
add_button|playertake|`cCollected Lock Logs|noflags|0|0|
add_button|playerdrop|`eDropped Lock Logs|noflags|0|0|
add_spacer|small|
end_dialog|logsmenu|Close|
]])
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialog })
end

local function ShowPlayerFaker()
    local listStr = ""
    if #state.faker_dialog > 0 then
        for _, faker in ipairs(state.faker_dialog) do
            listStr = listStr .. "add_label_with_icon|small|" .. faker .. "|left|758|\n"
        end
    else
        listStr = "add_textbox|`7No typer / fake spins recorded right now.|left|\n"
    end

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Typer / Fake Spin Logs|left|758|
add_spacer|small|
]] .. listStr .. [[
add_spacer|small|
add_button|resetFakerLogs|`4Reset Typer Logs|noflags|0|0|
add_button|backToLogsMenu|`bBack to Logs Menu|noflags|0|0|
end_dialog|fakerLogs|Close|
]])
    SendVariantList({ [0] = 'OnDialogRequest', [1] = dialog })
end

local function ShowCollect()
    local listStr = ""
    if #state.kolek_dialog > 0 then
        for _, kolek in ipairs(state.kolek_dialog) do
            listStr = listStr .. "add_label_with_icon|small|" .. kolek .. "|left|1436|\n"
        end
    else
        listStr = "add_textbox|`7No collected lock logs recorded yet.|left|\n"
    end

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Collected Lock Logs|left|1436|
add_spacer|small|
]] .. listStr .. [[
add_spacer|small|
add_button|resetCLogs|`4Reset Collected Logs|noflags|0|0|
add_button|backToLogsMenu|`bBack to Logs Menu|noflags|0|0|
end_dialog|collectLogs|Close|
]])
    SendVariantList({ [0] = 'OnDialogRequest', [1] = dialog })
end

local function ShowDropping()
    local listStr = ""
    if #state.derop_dialog > 0 then
        for _, derop in ipairs(state.derop_dialog) do
            listStr = listStr .. "add_label_with_icon|small|" .. derop .. "|left|1436|\n"
        end
    else
        listStr = "add_textbox|`7No dropped lock logs recorded yet.|left|\n"
    end

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Dropped Lock Logs|left|1436|
add_spacer|small|
]] .. listStr .. [[
add_spacer|small|
add_button|resetDLogs|`4Reset Dropped Logs|noflags|0|0|
add_button|backToLogsMenu|`bBack to Logs Menu|noflags|0|0|
end_dialog|dropLogs|Close|
]])
    SendVariantList({ [0] = 'OnDialogRequest', [1] = dialog })
end

local function ShowPlayerSpins()
    local listStr = ""
    if #state.spins_dialog > 0 then
        for _, spin in ipairs(state.spins_dialog) do
            listStr = listStr .. "add_label_with_icon|small|" .. spin .. "|left|758|\n"
        end
    else
        listStr = "add_textbox|`7No roulette spins recorded yet.|left|\n"
    end

    local dialog = wrapRed([[
add_quick_exit|
add_label_with_icon|big|`4Roulette Spin Logs|left|758|
add_spacer|small|
]] .. listStr .. [[
add_spacer|small|
add_button|resetSpinLogs|`4Reset Spin Logs|noflags|0|0|
add_button|backToLogsMenu|`bBack to Logs Menu|noflags|0|0|
end_dialog|spinLogs|Close|
]])
    SendVariantList({ [0] = 'OnDialogRequest', [1] = dialog })
end

local function ShowCalculator()
    local payload = [[set_default_color|`w
add_label_with_icon|big|Calculator|left|10568|
add_spacer|small|
add_text_input|num_1|1st Number: |]] .. state.calc_Num_1 .. [[|9|
add_text_input|num_2|2nd Number: |]] .. state.calc_Num_2 .. [[|9|
add_spacer|small|
add_button|calc_add|`^Add (`b+``)|noflags|0|0|
add_button|calc_substract|`^Substract (`b-``)|noflags|0|0|
add_button|calc_multiply|`^Multiply (`b*``)|noflags|0|0|
add_button|calc_divide|`^Divide (`b/``)|noflags|0|0|
add_quick_exit|
end_dialog|calculator|`4Exit``|`2Calculate``|
]]
    SendVariantList({ [0] = 'OnDialogRequest', [1] = payload })
end

-- ==========================================
-- CHAT COMMANDS
-- ==========================================
chatCommands.g = function()
    state.ghost = not state.ghost
    local status = state.ghost and "Enabled" or "Disabled"
    TextOverlay("`w[`0" .. status .. " `2Ghost Mode`w]")
    SendPacket(2, "action|input\n|text|/ghost")
    save_config()
    return true
end
chatCommands.ghost = chatCommands.g
chatCommands.rl = function() relog() return true end
chatCommands.re = function()
    local var = {}
    var[0] = "OnReconnect"
    SendVariantList(var)
    TextOverlay("`9Reconnecting to server...`0")
    return true
end
chatCommands.res = function() SendPacket(2, "action|respawn") return true end
chatCommands.emote = function()
    state.emoji_Talk = not state.emoji_Talk
    local status = state.emoji_Talk and "Enable" or "Disable"
    TextOverlay("`w[`0" .. status .. " `2Emoji Talk Mode`w]")
    save_config()
    return true
end
chatCommands.wrp = function()
    state.pull = not state.pull
    if state.pull then state.kick = false state.ban = false TextOverlay("`w[`0Enable Wrench `2Pull `0Mode`w]")
    else TextOverlay("`w[`4Disable Wrench `2Pull `0Mode`w]") end
    save_config()
    return true
end
chatCommands.wrk = function()
    state.kick = not state.kick
    if state.kick then state.pull = false state.ban = false TextOverlay("`w[`0Enable Wrench `4Kick `0Mode`w]")
    else TextOverlay("`w[`4Disable Wrench `4Kick `0Mode`w]") end
    save_config()
    return true
end
chatCommands.wrb = function()
    state.ban = not state.ban
    if state.ban then state.pull = false state.kick = false TextOverlay("`w[`0Enable Wrench `4Ban `0Mode`w]")
    else TextOverlay("`w[`4Disable Wrench `4Ban `0Mode`w]") end
    save_config()
    return true
end
chatCommands.am = function()
    state.buycemp = not state.buycemp
    local status = state.buycemp and "Enable" or "Disable"
    TextOverlay("`2" .. status .. " `9Buy `cChamp")
    save_config()
    return true
end
chatCommands.ab = function()
    state.buycemp2 = not state.buycemp2
    local status = state.buycemp2 and "Enable" or "Disable"
    TextOverlay("`2" .. status .. " `9Buy `cChamp Bgems")
    save_config()
    return true
end
chatCommands.cv = function()
    state.cbgl = not state.cbgl
    local status = state.cbgl and "Enabled" or "Disabled"
    TextOverlay("`2" .. status .. " `0Fast Change BGL")
    save_config()
    return true
end
chatCommands.cbgl = chatCommands.cv
chatCommands.sspin = function()
    state.shortspin = not state.shortspin
    local status = state.shortspin and "Enabled" or "Disabled"
    TextOverlay("`w[`0" .. status .. " `2Short Spin Mode`w]")
    save_config()
    return true
end
chatCommands.smodal = function()
    state.showmodal = not state.showmodal
    local status = state.showmodal and "Enabled" or "Disabled"
    TextOverlay("`w[`0" .. status .. " `2Show Modal Mode`w]")
    save_config()
    return true
end
chatCommands.cpull = function()
    state.wrench_touch_pull = not state.wrench_touch_pull
    local status = state.wrench_touch_pull and "Enabled" or "Disabled"
    TextOverlay("`w[`0" .. status .. " `2Wrench Touch Pull`w]")
    save_config()
    return true
end

chatCommands.setwm = function(str, args)
    if not args or args:match("^%s*$") then
        ShowWatermarkDialog()
        return true
    end

    local argList = {}
    for w in args:gmatch("%S+") do
        table.insert(argList, w)
    end

    if argList[1] == "reset" or argList[1] == "default" then
        state.watermark_name = "HELL"
        state.watermark_color = "4"
        state.watermark = true
        save_config()
        TextOverlay("`9Watermark restored to default (`b[`4@HELL`b]`)")
        return true
    end

    local wmName = argList[1]
    local wmColor = argList[2]
    if wmName and wmName ~= "" then
        state.watermark_name = wmName
    end
    if wmColor and wmColor ~= "" then
        state.watermark_color = resolveColorCode(wmColor)
    end
    save_config()
    local color = resolveColorCode(state.watermark_color or "4")
    TextOverlay("`9Watermark set to: `b[`" .. color .. "@" .. (state.watermark_name or "HELL") .. "`b]")
    return true
end

chatCommands.wm = function()
    state.watermark = not state.watermark
    local status = state.watermark and "`2ON" or "`4OFF"
    TextOverlay("`w[Chat Watermark] `wis now " .. status)
    save_config()
    return true
end
chatCommands.watermark = chatCommands.wm

chatCommands.logs = function()
    ShowLogsMenu()
    return true
end
chatCommands.log = chatCommands.logs
chatCommands.ceklogs = chatCommands.logs

-- ==========================================
-- SETDROP VIA DIALOG & COMMAND
-- ==========================================
chatCommands.setdrop = function(str, args)
    if not args or args:match("^%s*$") then
        ShowSetdropDialog()
        return true
    end

    local argList = {}
    for w in args:gmatch("%S+") do
        table.insert(argList, w)
    end

    if argList[1] == "reset" or argList[1] == "restore" then
        local target = cleanCmdInput(argList[2])
        if target == "" then
            local aliases = parseCustomDropAliases(state.custom_drop_aliases)
            for a, t in pairs(aliases) do
                chatCommands[a] = nil
                if original_commands[t] then
                    chatCommands[t] = original_commands[t]
                end
                if state.disabled_commands then
                    state.disabled_commands[t] = nil
                end
            end
            state.custom_drop_aliases = ""
            state.disabled_commands = {}
            save_config()
            TextOverlay("`2All drop aliases reset to default.")
            return true
        else
            local removed = removeAliasPointingTo(target)
            if state.disabled_commands then state.disabled_commands[target] = nil end
            if original_commands[target] then chatCommands[target] = original_commands[target] end
            save_config()
            TextOverlay("`2Restored /" .. target)
            return true
        end
    end

    local alias = cleanCmdInput(argList[1])
    local target = cleanCmdInput(argList[2])
    local disable = (argList[3] == "1" or argList[3] == "true" or argList[3] == "disable")

    if alias == "" or target == "" then
        TextOverlay("`4Usage: /setdrop <alias> <target> [1/0] or /setdrop")
        return true
    end

    if alias == target then
        TextOverlay("`4Alias cannot be the same as target.")
        return true
    end

    if not (original_commands[target] or chatCommands[target]) then
        TextOverlay("`4Target /" .. target .. " does not exist.")
        return true
    end

    removeAliasPointingTo(target)
    if chatCommands[alias] then
        chatCommands[alias] = nil
    end

    local aliases = parseCustomDropAliases(state.custom_drop_aliases)
    aliases[alias] = target
    state.custom_drop_aliases = serializeCustomDropAliases(aliases)

    registerCommandAlias(alias, target)

    if not state.disabled_commands then state.disabled_commands = {} end
    if disable then
        chatCommands[target] = nil
        state.disabled_commands[target] = true
        TextOverlay("`wAlias `2/" .. alias .. "`w -> `2/" .. target .. "`w (original disabled)")
    else
        chatCommands[target] = original_commands[target]
        state.disabled_commands[target] = nil
        TextOverlay("`wAlias `2/" .. alias .. "`w -> `2/" .. target .. "`w (original kept)")
    end

    save_config()
    return true
end

chatCommands.saveconfig = function()
    save_config()
    TextOverlay("`w[`2Configuration saved successfully`w]")
    return true
end

chatCommands.spam = function()
    ShowSpammerMenu()
    return true
end

chatCommands.proxy = function()
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialogs.cmd })
    return true
end

chatCommands.skins = function()
    smenu()
    return true
end

chatCommands.skin = function(str, args)
    local arg = args:lower()
    if arg == "white" then return applySkin(255,255,255,"White")
    elseif arg == "black" then return applySkin(0,0,0,"Black")
    elseif arg == "red" then return applySkin(255,0,0,"Red")
    elseif arg == "green" then return applySkin(0,255,0,"Green")
    elseif arg == "blue" then return applySkin(0,0,255,"Blue")
    elseif arg == "yellow" then return applySkin(255,255,0,"Yellow")
    elseif arg == "pink" then return applySkin(255,193,203,"Pink")
    elseif arg == "purple" then return applySkin(128,0,128,"Purple")
    elseif arg == "blink" then
        state.skin_blink = not state.skin_blink
        local status = state.skin_blink and "Enabled" or "Disabled"
        TextOverlay("`2" .. status .. " `0Skin Blink")
        return true
    end
    local r,g,b = args:match("(%d+),(%d+),(%d+)")
    if r and g and b then return applySkin(tonumber(r),tonumber(g),tonumber(b),"Custom") end
    TextOverlay("`4Usage: /skin white|black|red|green|blue|yellow|pink|purple|blink|R,G,B")
    return true
end

chatCommands.reme = function()
    state.reme = not state.reme
    state.qeme = false; state.leme = false; state.sleme = false; state.lewa6 = false; state.lewa7 = false; state.lemeagus = false; state.lemeagus3 = false
    local status = state.reme and "Enabled" or "Disabled"
    helpers.Say("`2" .. status .. " `0Reme Mode")
    save_config()
    return true
end

chatCommands.qeme = function()
    state.qeme = not state.qeme
    state.reme = false; state.leme = false; state.sleme = false; state.lewa6 = false; state.lewa7 = false; state.lemeagus = false; state.lemeagus3 = false
    local status = state.qeme and "Enabled" or "Disabled"
    helpers.Say("`2" .. status .. " `0Qeme Mode")
    save_config()
    return true
end

chatCommands.leme = function()
    state.leme = not state.leme
    state.reme = false; state.qeme = false; state.sleme = false; state.lewa6 = false; state.lewa7 = false; state.lemeagus = false; state.lemeagus3 = false
    local status = state.leme and "Enabled" or "Disabled"
    helpers.Say("`2" .. status .. " `0Leme Mode")
    save_config()
    return true
end

chatCommands.sleme = function()
    state.sleme = not state.sleme
    state.reme = false; state.qeme = false; state.leme = false; state.lewa6 = false; state.lewa7 = false; state.lemeagus = false; state.lemeagus3 = false
    local status = state.sleme and "Enabled" or "Disabled"
    helpers.Say("`2" .. status .. " `0Leme Super (X5) Mode")
    save_config()
    return true
end

chatCommands.lewa6 = function()
    state.lewa6 = not state.lewa6
    state.reme = false; state.qeme = false; state.leme = false; state.sleme = false; state.lewa7 = false; state.lemeagus = false; state.lemeagus3 = false
    local status = state.lewa6 and "Enabled" or "Disabled"
    helpers.Say("`2" .. status .. " `0LX6 Mode")
    save_config()
    return true
end

chatCommands.lewa7 = function()
    state.lewa7 = not state.lewa7
    state.reme = false; state.qeme = false; state.leme = false; state.sleme = false; state.lewa6 = false; state.lemeagus = false; state.lemeagus3 = false
    local status = state.lewa7 and "Enabled" or "Disabled"
    helpers.Say("`2" .. status .. " `0LX7 Mode")
    save_config()
    return true
end

chatCommands.agus = function()
    state.lemeagus = not state.lemeagus
    state.reme = false; state.qeme = false; state.leme = false; state.sleme = false; state.lewa6 = false; state.lewa7 = false; state.lemeagus3 = false
    local status = state.lemeagus and "Enabled" or "Disabled"
    helpers.Say("`2" .. status .. " `0Leme Agus Mode (2 Auto)")
    save_config()
    return true
end
chatCommands.lemeagus = chatCommands.agus

chatCommands.agus3 = function()
    state.lemeagus3 = not state.lemeagus3
    state.reme = false; state.qeme = false; state.leme = false; state.sleme = false; state.lewa6 = false; state.lewa7 = false; state.lemeagus = false
    local status = state.lemeagus3 and "Enabled" or "Disabled"
    helpers.Say("`2" .. status .. " `0Leme Agus 3 Mode (2 3 Auto)")
    save_config()
    return true
end
chatCommands.lemeagus3 = chatCommands.agus3

chatCommands.tpd = function()
    state.tpdisplay = not state.tpdisplay
    local status = state.tpdisplay and "Enabled" or "Disabled"
    TextOverlay("`w[`0" .. status .. " `2Teleport Display Mode`w]")
    save_config()
    return true
end

chatCommands.sdb = function()
    state.sdbb = not state.sdbb
    local status = state.sdbb and "Enabled" or "Disabled"
    TextOverlay("`w[`0" .. status .. " `2Block SDB Mode`w]")
    save_config()
    return true
end

chatCommands.blue = function()
    SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
    TextOverlay("`wSuccessfully Convert `2Black `wTo `2Blue")
    return true
end

chatCommands.black = function()
    SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
    return true
end

-- ==========================================
-- AUTO PULL
-- ==========================================
chatCommands.apt = function()
    state.apt = not state.apt
    local status = state.apt and "`2ON" or "`4OFF"
    TextOverlay("`w[Auto Pull] `wis now " .. status)
    save_config()
    return true
end

chatCommands.setapt = function()
    ShowAPTDialog()
    return true
end

-- ==========================================
-- BLOCK SPAMMER SLAVE
-- ==========================================
chatCommands.blockspam = function()
    state.blockspam = not state.blockspam
    local status = state.blockspam and "`2ON" or "`4OFF"
    TextOverlay("`w[Block Spammer Slave] `wis now " .. status)
    save_config()
    return true
end

-- ==========================================
-- CUSTOM PULL MESSAGE
-- ==========================================
chatCommands.customtext = function(str, args)
    if not args or args:match("^%s*$") then
        ShowCustomPullDialog()
        return true
    end

    local cleanArgs = args:gsub("^%s+", ""):gsub("%s+$", "")
    local lower = cleanArgs:lower()

    if lower == "off" or lower == "clear" or lower == "none" or lower == "disable" or lower == "0" or lower == '""' or lower == "''" then
        state.pull_msg = ""
        save_config()
        TextOverlay("`w[`2TextPull`w] `4Disabled `w/ Custom pull message cleared.")
        return true
    elseif lower == "reset" or lower == "default" then
        state.pull_msg = "`9GASS!! "
        save_config()
        TextOverlay("`w[`2TextPull`w] `9Restored to default: `2" .. state.pull_msg)
        return true
    else
        state.pull_msg = cleanArgs
        save_config()
        TextOverlay("`w[`2TextPull`w] `9Pull message set to: `2" .. cleanArgs)
        return true
    end
end
chatCommands.setpullmsg = chatCommands.customtext
chatCommands.textpull = chatCommands.customtext
chatCommands.pulltext = chatCommands.customtext
chatCommands.pullmsg = chatCommands.customtext

chatCommands.kicktext = function(str, args)
    if not args or args:match("^%s*$") then
        ShowCustomPullDialog()
        return true
    end

    local cleanArgs = args:gsub("^%s+", ""):gsub("%s+$", "")
    local lower = cleanArgs:lower()

    if lower == "off" or lower == "clear" or lower == "none" or lower == "disable" or lower == "0" or lower == '""' or lower == "''" then
        state.kick_msg = ""
        save_config()
        TextOverlay("`w[`4TextKick`w] `4Disabled `w/ Custom kick message cleared.")
        return true
    elseif lower == "reset" or lower == "default" then
        state.kick_msg = "`4KICKED!! "
        save_config()
        TextOverlay("`w[`4TextKick`w] `9Restored to default: `2" .. state.kick_msg)
        return true
    else
        state.kick_msg = cleanArgs
        save_config()
        TextOverlay("`w[`4TextKick`w] `9Kick message set to: `2" .. cleanArgs)
        return true
    end
end
chatCommands.textkick = chatCommands.kicktext
chatCommands.setkickmsg = chatCommands.kicktext
chatCommands.kickmsg = chatCommands.kicktext

-- ==========================================
-- Helper untuk auto combine locks
-- ==========================================
local function ensureBlueGemLock(required)
    if getItemCount(7188) >= required then return true end
    local attempts = 0
    while getItemCount(7188) < required and getItemCount(11550) > 0 and attempts < 20 do
        SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
        Sleep(60)
        attempts = attempts + 1
    end
    return getItemCount(7188) >= required
end

local function ensureBlackGemLock()
    if getItemCount(7188) < 100 then return false end
    local oldBlack = getItemCount(11550)
    local attempts = 0
    while getItemCount(7188) >= 100 and getItemCount(11550) == oldBlack and attempts < 20 do
        SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
        Sleep(60)
        attempts = attempts + 1
    end
    return getItemCount(11550) > oldBlack
end

local function find_nearest_telephone()
    local isLocalSuccess, localPlayer = pcall(GetLocal)
    if not isLocalSuccess or not localPlayer or not localPlayer.pos then return nil end
    local px = math.floor(localPlayer.pos.x / 32)
    local py = math.floor(localPlayer.pos.y / 32)
    local isTilesSuccess, worldTiles = pcall(GetTiles)
    if not isTilesSuccess or not worldTiles then return nil end
    local closestTile = nil
    local minDistance = 9999
    for _, tile in pairs(worldTiles) do
        if tile and (tile.fg == 3898) then
            local dist = math.abs(tile.x - px) + math.abs(tile.y - py)
            if dist < minDistance then
                minDistance = dist
                closestTile = tile
            end
        end
    end
    if closestTile and minDistance <= 5 then return closestTile end
    return nil
end

local function auto_combine_locks()
    RunThread(function()
        Sleep(300)
        while getItemCount(242) >= 100 do
            wear(242)
            Sleep(200)
        end
        while getItemCount(1796) >= 100 do
            local tel = find_nearest_telephone()
            if tel then
                SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|" .. tel.x .. "|\ny|" .. tel.y .. "|\nbuttonClicked|bglconvert")
                TextOverlay("`2Auto Convert 100 DL to BGL")
                Sleep(200)
            else
                break
            end
        end
        while getItemCount(7188) >= 100 do
            ensureBlackGemLock()
            Sleep(200)
        end
    end)
end

local function handleDrop(itemID, name, countStr)
    local c = tonumber(countStr)
    if not c or c <= 0 then return true end

    if getItemCount(itemID) < c then
        local waitTime = 0
        while getItemCount(itemID) < c and waitTime < 500 do
            Sleep(25)
            waitTime = waitTime + 25
        end
    end

    if getItemCount(itemID) >= c then
        SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. itemID .. "|\nitem_count|" .. countStr)
        local worldName = GetSafeWorldName()
        local logMsg = "[World: `2" .. worldName .. "`w] `4Dropped `#" .. countStr .. " " .. name
        table.insert(state.derop_dialog, logMsg)
        if webhook.lock and webhook.lock ~= "" then
            local playerName = GetSafeLocalName()
            local formatted = formatLockAmount(c, itemID)
            local actionName = ""
            if itemID == 7188 then actionName = "Dropped " .. formatted
            elseif itemID == 11550 then actionName = "Dropped " .. formatted
            elseif itemID == 1796 then actionName = "Dropped " .. formatted
            elseif itemID == 242 then actionName = "Dropped " .. formatted
            else actionName = "Dropped " .. c .. " " .. name end
            Webhuk(webhook.lock, "Proxy Team HELL", "", "**Player:** `2" .. playerName .. "`w\n**Action:** " .. actionName .. "`w\n**World:** `9" .. worldName .. "`w\n**Time:** " .. os.date("%I:%M %p"))
        end
        return true
    else
        TextOverlay("`4[DROP] Gagal: " .. name .. " tidak cukup!")
        return false
    end
end

local function execute_drop_world_lock(count)
    RunThread(function()
        local dl = math.floor(count / 100)
        local wl = count % 100
        local bgl = math.floor(dl / 100)
        dl = dl % 100
        if bgl > 0 and getItemCount(7188) < bgl then
            TextOverlay("`6Not enough BGL, crafting...`0")
            SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
            Sleep(60)
        end
        if bgl > 0 then
            if getItemCount(7188) >= bgl then
                handleDrop(7188, "`eBlue Gem Lock", tostring(bgl))
                Sleep(80)
            else
                TextOverlay("`4Not enough BGL to drop!`0")
                return
            end
        end
        if dl > 0 and getItemCount(1796) < dl then wear(7188) Sleep(60) end
        if dl > 0 then
            if getItemCount(1796) >= dl then
                handleDrop(1796, "`cDiamond Lock", tostring(dl))
                Sleep(80)
            else
                TextOverlay("`4Not enough DL to drop!`0")
                return
            end
        end
        if wl > 0 and getItemCount(242) < wl then
            wear(1796)
            local wait_time = 0
            while getItemCount(242) < wl and wait_time < 1000 do Sleep(25) wait_time = wait_time + 25 end
        end
        if wl > 0 then
            if getItemCount(242) >= wl then
                handleDrop(242, "`9World Lock", tostring(wl))
            else
                TextOverlay("`4Not enough WL to drop!`0")
                return
            end
        end
        local msg = "`2DROP `w: " .. format_locks_short(0, bgl, dl, wl)
        TextOverlay(msg)
    end)
end

-- SMART DROP: /dw (World Lock Drop)
chatCommands.dw = function(str, args)
    local count = tonumber(args:match("(%d+)"))
    if not count or count <= 0 then return true end
    local to1796 = math.floor(count / 100)
    local rem242 = count % 100
    RunThread(function()
        local current_wl = getItemCount(242)
        local dl_to_break = math.ceil(math.max(0, rem242 - current_wl) / 100)
        local current_dl = getItemCount(1796)
        local needed_dl = to1796 + dl_to_break

        if current_dl < needed_dl then
            local missing_dl = needed_dl - current_dl
            local bgl_to_break = math.ceil(missing_dl / 100)
            if getItemCount(7188) < bgl_to_break then
                local missing_bgl = bgl_to_break - getItemCount(7188)
                local black_needed = math.ceil(missing_bgl / 100)
                if getItemCount(11550) >= black_needed then
                    ensureBlueGemLock(bgl_to_break)
                end
            end
            for _ = 1, bgl_to_break do wear(7188) Sleep(40) end
            local wait_dl = 0
            while getItemCount(1796) < needed_dl and wait_dl < 1000 do
                Sleep(25)
                wait_dl = wait_dl + 25
            end
        end

        if getItemCount(1796) < needed_dl then
            TextOverlay("`4Not enough locks to drop!`0")
            return
        end

        if dl_to_break > 0 and getItemCount(242) < rem242 then
            for _ = 1, dl_to_break do wear(1796) Sleep(40) end
            local wait_wl = 0
            while getItemCount(242) < rem242 and wait_wl < 1000 do
                Sleep(25)
                wait_wl = wait_wl + 25
            end
        end

        if getItemCount(242) < rem242 then
            TextOverlay("`4Could not convert enough World Locks!`0")
            return
        end

        local droppedAny = false
        if to1796 > 0 then
            if handleDrop(1796, "`cDiamond Lock", tostring(to1796)) then droppedAny = true end
            Sleep(80)
        end
        if rem242 > 0 then
            if handleDrop(242, "`9World Lock", tostring(rem242)) then droppedAny = true end
            Sleep(80)
        end
        if droppedAny then
            local formatted = format_locks_short(0, 0, to1796, rem242)
            helpers.Say("`2DROP `w: " .. formatted)
        end
    end)
    return true
end

-- SMART DROP: /dd (Diamond Lock Drop)
chatCommands.dd = function(str, args)
    local count = tonumber(args:match("(%d+)"))
    if not count or count <= 0 then return true end
    local to7188 = math.floor(count / 100)
    local rem1796 = count % 100
    RunThread(function()
        local current_dl = getItemCount(1796)
        local bgl_to_break = math.ceil(math.max(0, rem1796 - current_dl) / 100)
        local needed_bgl = to7188 + bgl_to_break
        
        if getItemCount(7188) < needed_bgl then
            local missing_bgl = needed_bgl - getItemCount(7188)
            local black_needed = math.ceil(missing_bgl / 100)
            if getItemCount(11550) >= black_needed then
                ensureBlueGemLock(needed_bgl)
            end
        end

        if getItemCount(7188) < needed_bgl then
            TextOverlay("`4Not enough locks to drop!`0")
            return
        end

        if bgl_to_break > 0 and getItemCount(1796) < rem1796 then
            for _ = 1, bgl_to_break do
                wear(7188)
                Sleep(40)
            end
            local wait_time = 0
            while getItemCount(1796) < rem1796 and wait_time < 1000 do
                Sleep(25)
                wait_time = wait_time + 25
            end
        end

        if getItemCount(1796) < rem1796 then
            TextOverlay("`4Could not convert enough Diamond Locks!`0")
            return
        end

        local droppedAny = false
        if to7188 > 0 then
            if handleDrop(7188, "`eBlue Gem Lock", tostring(to7188)) then droppedAny = true end
            Sleep(80)
        end
        if rem1796 > 0 then
            if handleDrop(1796, "`cDiamond Lock", tostring(rem1796)) then droppedAny = true end
            Sleep(80)
        end
        if droppedAny then
            local formatted = format_locks_short(0, to7188, rem1796, 0)
            helpers.Say("`2DROP `w: " .. formatted)
        end
    end)
    return true
end

-- SMART DROP: /db (Blue Gem Lock Drop)
chatCommands.db = function(str, args)
    local count = tonumber(args:match("(%d+)"))
    if not count or count <= 0 then return true end
    local to11550 = math.floor(count / 100)
    local rem7188 = count % 100
    RunThread(function()
        local current_bgl = getItemCount(7188)
        if rem7188 > current_bgl then
            local missing = rem7188 - current_bgl
            local black_needed = math.ceil(missing / 100)
            if getItemCount(11550) >= black_needed then
                ensureBlueGemLock(rem7188)
            end
        end

        local droppedAny = false
        if to11550 > 0 then
            if handleDrop(11550, "`bBlack Gem Lock", tostring(to11550)) then droppedAny = true end
            Sleep(80)
        end
        if rem7188 > 0 then
            if getItemCount(7188) >= rem7188 then
                if handleDrop(7188, "`eBlue Gem Lock", tostring(rem7188)) then droppedAny = true end
            else
                TextOverlay("`4Not enough Blue Gem Locks to drop!")
            end
        end
        if droppedAny then
            local formatted = format_locks_short(to11550, rem7188, 0, 0)
            helpers.Say("`2DROP `w: " .. formatted)
        end
    end)
    return true
end

-- SMART DROP: /di (Black Gem Lock Drop)
chatCommands.di = function(str, args)
    local count = tonumber(args:match("(%d+)"))
    if not count or count <= 0 then return true end
    RunThread(function()
        if handleDrop(11550, "`bBlack Gem Lock", tostring(count)) then
            helpers.Say("`2DROP `w: " .. count .. " `bBLACK")
        end
    end)
    return true
end

chatCommands.daw = function()
    RunThread(function()
        local black = getItemCount(11550)
        local bgl = getItemCount(7188)
        local dl = getItemCount(1796)
        local wl = getItemCount(242)

        if black == 0 and bgl == 0 and dl == 0 and wl == 0 then
            TextOverlay("`4[DROP ALL] Tidak ada Lock di Backpack!")
            return
        end

        local droppedAny = false

        if black > 0 then
            if handleDrop(11550, "`bBlack Gem Lock", tostring(black)) then droppedAny = true end
            Sleep(80)
        end
        if bgl > 0 then
            if handleDrop(7188, "`eBlue Gem Lock", tostring(bgl)) then droppedAny = true end
            Sleep(80)
        end
        if dl > 0 then
            if handleDrop(1796, "`cDiamond Lock", tostring(dl)) then droppedAny = true end
            Sleep(80)
        end
        if wl > 0 then
            if handleDrop(242, "`9World Lock", tostring(wl)) then droppedAny = true end
            Sleep(80)
        end

        if droppedAny then
            local formatted = format_locks_short(black, bgl, dl, wl)
            helpers.Say("`2DROP ALL `w: " .. formatted)
        end
    end)
    return true
end
chatCommands.da = chatCommands.daw
chatCommands.dropall = chatCommands.daw

chatCommands.cb = function()
    wear(7188)
    helpers.Say("`4Break `eBGL `2to `cDL")
    return true
end

chatCommands.calcu = function(str, args)
    args = args and args:gsub("^%s+", ""):gsub("%s+$", "") or ""
    if args == "" then ShowCalculator() return true end
    local n1, op, n2 = args:match("^([%-%d%.]+)%s*([%+%-%*/xX])%s*([%-%d%.]+)$")
    if not n1 then
        SendPacket(2, "action|input\ntext|`b[`cCalcu`b] `4Usage: /calcu 30 + 50")
        return true
    end
    local num1, num2 = tonumber(n1), tonumber(n2)
    if not num1 or not num2 then
        SendPacket(2, "action|input\ntext|`b[`cCalcu`b] `4Invalid numbers")
        return true
    end
    local result
    if op == "+" then result = num1 + num2
    elseif op == "-" then result = num1 - num2
    elseif op == "*" or op:lower() == "x" then result = num1 * num2
    elseif op == "/" then
        if num2 == 0 then
            SendPacket(2, "action|input\ntext|`b[`cCalcu`b] `4Can't divide by 0!")
            return true
        end
        result = num1 / num2
    else
        SendPacket(2, "action|input\ntext|`b[`cCalcu`b] `4Unknown operator")
        return true
    end
    local out = string.format("`b[`cCalcu`b] :`9 %s `4= `2%g", args, result)
    SendPacket(2, "action|input\ntext|" .. out)
    LogToConsole(out)
    return true
end

chatCommands.wd = function(str, args)
    local count = tonumber(args:match("(%d+)"))
    if count then
        SendPacket(2, "action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|" .. count)
        TextOverlay("`wWithdraw `2" .. count .. " `eBGL")
    end
    return true
end

chatCommands.depo = function(str, args)
    local count = tonumber(args:match("(%d+)"))
    if count then
        SendPacket(2, "action|dialog_return\ndialog_name|bank_deposit\nbgl_count|" .. count)
        TextOverlay("`wDeposit `2" .. count .. " `eBGL")
    end
    return true
end
chatCommands.dp = chatCommands.depo

-- ==========================================
-- AUTO PULL & MIN MODAL COMMANDS
-- ==========================================
chatCommands.apt = function()
    state.apt = not state.apt
    local status = state.apt and "`2ON" or "`4OFF"
    TextOverlay("`w[Auto Pull] `wis now " .. status)
    save_config()
    return true
end

chatCommands.setapt = function()
    ShowAPTDialog()
    return true
end

chatCommands.blacklist = function()
    ShowAPTBlacklistDialog()
    return true
end
chatCommands.bl = chatCommands.blacklist
chatCommands.aptbl = chatCommands.blacklist

chatCommands.bladd = function(str, args)
    local uid = tonumber(args and args:match("(%d+)"))
    if uid and uid > 0 then
        if type(state.apt_blacklist) ~= "table" then state.apt_blacklist = {} end
        state.apt_blacklist[uid] = true
        save_config()
        TextOverlay("`2Added UID " .. uid .. " to blacklist.")
    else
        TextOverlay("`4Usage: /bladd <uid>")
    end
    return true
end

chatCommands.blrem = function(str, args)
    local uid = tonumber(args and args:match("(%d+)"))
    if uid and uid > 0 then
        if type(state.apt_blacklist) == "table" then
            state.apt_blacklist[uid] = nil
            state.apt_blacklist[tostring(uid)] = nil
            save_config()
            TextOverlay("`9Removed UID " .. uid .. " from blacklist.")
        end
    else
        TextOverlay("`4Usage: /blrem <uid>")
    end
    return true
end

chatCommands.blclear = function()
    state.apt_blacklist = {}
    save_config()
    TextOverlay("`4All blacklist cleared!")
    return true
end

chatCommands.setaptpos = function(str, args)
    if not args or args == "" or args:find("auto") then
        state.apt_tile_x = 0
        state.apt_tile_y = 0
        save_config()
        TextOverlay("`w[APT Hold] `2Target tile set to AUTO (White Door)")
        return true
    elseif args:find("mypos") or args:find("me") then
        local lp = GetSafeLocal()
        if lp and lp.pos and lp.pos.x and lp.pos.y then
            state.apt_tile_x = math.floor(lp.pos.x / 32)
            state.apt_tile_y = math.floor(lp.pos.y / 32)
            save_config()
            TextOverlay("`w[APT Hold] `2Target tile set to your position: (" .. state.apt_tile_x .. ", " .. state.apt_tile_y .. ")")
        end
        return true
    end
    local x, y = args:match("(%d+)%s+(%d+)")
    if x and y then
        state.apt_tile_x = tonumber(x)
        state.apt_tile_y = tonumber(y)
        save_config()
        TextOverlay("`w[APT Hold] `2Target tile set to custom: (" .. x .. ", " .. y .. ")")
    else
        TextOverlay("`4Usage: /setaptpos <x> <y> (or /setaptpos auto | /setaptpos mypos)")
    end
    return true
end

chatCommands.minmodal = function(str, args)
    local val = tonumber(args:match("([%d%.]+)"))
    if val then
        state.apt_min_modal = math.max(0, val)
        save_config()
        local display = (state.apt_min_modal > 0) and (state.apt_min_modal .. " BGL") or "No Limit (Pull All)"
        TextOverlay("`w[Min Modal] Set to: `2" .. display)
    else
        local current = (state.apt_min_modal > 0) and (state.apt_min_modal .. " BGL") or "No Limit (0 BGL)"
        TextOverlay("`w[Min Modal] Current: `2" .. current .. " `7(Usage: /minmodal <amount>)")
    end
    return true
end
chatCommands.setminmodal = chatCommands.minmodal

-- ==========================================
-- SIMPAN FUNGSI ASLI
-- ==========================================
for cmd, func in pairs(chatCommands) do
    original_commands[cmd] = func
end

-- ==========================================
-- TERAPKAN ALIAS DAN DISABLED
-- ==========================================
applyCustomDropAliases()
applyDisabledCommands()

-- ==========================================
-- BUTTON HANDLERS
-- ==========================================
buttonHandlers.emojiTalker = chatCommands.emote
buttonHandlers.wpull = chatCommands.wrp
buttonHandlers.wkick = chatCommands.wrk
buttonHandlers.wban = chatCommands.wrb
buttonHandlers.amer1 = chatCommands.am
buttonHandlers.amer2 = chatCommands.ab
buttonHandlers.cvdlkebgl = chatCommands.cv
buttonHandlers.skinmenu = function() smenu(); return true end
buttonHandlers.applys = function(str)
    local r,g,b = str:match("bgcolor|(%d+),(%d+),(%d+)")
    if r and g and b then
        state.rs = tonumber(r); state.gs = tonumber(g); state.bs = tonumber(b)
        return applySkin(state.rs, state.gs, state.bs, "Custom")
    end
    return false
end
buttonHandlers.wskin = function() return applySkin(255,255,255,"White") end
buttonHandlers.bskin = function() return applySkin(0,0,0,"Black") end
buttonHandlers.rskin = function() return applySkin(255,0,0,"Red") end
buttonHandlers.gskin = function() return applySkin(0,255,0,"Green") end
buttonHandlers.blueskin = function() return applySkin(0,0,255,"Blue") end
buttonHandlers.yskin = function() return applySkin(255,255,0,"Yellow") end
buttonHandlers.pskin = function() return applySkin(255,193,203,"Pink") end
buttonHandlers.uskin = function() return applySkin(128,0,128,"Purple") end
buttonHandlers.blinkskin = function()
    state.skin_blink = not state.skin_blink
    local status = state.skin_blink and "Enabled" or "Disabled"
    TextOverlay("`2" .. status .. " `0Skin Blink")
    return true
end
buttonHandlers.backmenu = function()
    SendVariantList({[0]="OnDialogRequest",[1]=dialogs.cmd})
    return true
end
buttonHandlers.proxycmd = function()
    SendVariantList({[0]="OnDialogRequest",[1]=dialogs.cmd})
    return true
end
buttonHandlers.calcu = function()
    ShowCalculator()
    return true
end

-- Logs Button Handlers
buttonHandlers.checkSpinLogs = function()
    ShowPlayerSpins()
    return true
end
buttonHandlers.fakerplayer = function()
    ShowPlayerFaker()
    return true
end
buttonHandlers.playertake = function()
    ShowCollect()
    return true
end
buttonHandlers.playerdrop = function()
    ShowDropping()
    return true
end
buttonHandlers.backToLogsMenu = function()
    ShowLogsMenu()
    return true
end
buttonHandlers.resetSpinLogs = function()
    state.spins_dialog = {}
    TextOverlay("`b[`4HELL`b] `2Spin logs have been reset.")
    ShowPlayerSpins()
    return true
end
buttonHandlers.resetFakerLogs = function()
    state.faker_dialog = {}
    TextOverlay("`b[`4HELL`b] `2Typer logs have been reset.")
    ShowPlayerFaker()
    return true
end
buttonHandlers.resetCLogs = function()
    state.kolek_dialog = {}
    TextOverlay("`b[`4HELL`b] `2Collected logs have been reset.")
    ShowCollect()
    return true
end
buttonHandlers.resetDLogs = function()
    state.derop_dialog = {}
    TextOverlay("`b[`4HELL`b] `2Dropped logs have been reset.")
    ShowDropping()
    return true
end

-- APT Button Handlers
buttonHandlers.btn_apt_save_all = function(str)
    local target = "\n" .. str
    state.apt = target:match("\napt_master_active|1") and true or false
    state.apt_toggle_mode = target:match("\napt_toggle_mode|1") and true or false
    state.apt_hold_mode = target:match("\napt_hold_mode|1") and true or false
    local minValStr = target:match("\napt_min_modal_input|([^|\n\r]*)")
    if minValStr then
        local cleanVal = minValStr:match("([%d%.]+)")
        state.apt_min_modal = cleanVal and tonumber(cleanVal) or 0
    end
    local txStr = target:match("\napt_tile_x|([^|\n\r]*)")
    local tyStr = target:match("\napt_tile_y|([^|\n\r]*)")
    local cleanTx = txStr and txStr:match("(%d+)")
    local cleanTy = tyStr and tyStr:match("(%d+)")
    state.apt_tile_x = cleanTx and tonumber(cleanTx) or 0
    state.apt_tile_y = cleanTy and tonumber(cleanTy) or 0
    save_config()
    TextOverlay("`2[APT] Settings & coordinates saved successfully!")
    ShowAPTDialog()
    return true
end

buttonHandlers.btn_apt_set_my_pos = function(str)
    local lp = GetSafeLocal()
    if lp and lp.pos and lp.pos.x and lp.pos.y then
        state.apt_tile_x = math.floor(lp.pos.x / 32)
        state.apt_tile_y = math.floor(lp.pos.y / 32)
        save_config()
        TextOverlay("`2Hold target tile set to your position: (" .. state.apt_tile_x .. ", " .. state.apt_tile_y .. ")")
    end
    ShowAPTDialog()
    return true
end

buttonHandlers.btn_apt_set_door_pos = function(str)
    local dx, dy = get_spawn_tile()
    if dx and dy then
        state.apt_tile_x = dx
        state.apt_tile_y = dy
        save_config()
        TextOverlay("`2Hold target tile set to White Door: (" .. dx .. ", " .. dy .. ")")
    else
        state.apt_tile_x = 0
        state.apt_tile_y = 0
        save_config()
        TextOverlay("`4White Door not found, set to Auto (0, 0)")
    end
    ShowAPTDialog()
    return true
end

buttonHandlers.btn_apt_blacklist_menu = function(str)
    ShowAPTBlacklistDialog()
    return true
end

buttonHandlers.btn_apt_back_main = function(str)
    ShowAPTDialog()
    return true
end

buttonHandlers.btn_apt_save = function(str)
    if type(state.apt_blacklist) ~= "table" then state.apt_blacklist = {} end

    local checkedInWorld = {}
    local uncheckedInWorld = {}

    for uidStr, val in str:gmatch("apt_cb_(%d+)|(%d)") do
        local uid = tonumber(uidStr)
        if uid and uid > 0 then
            if val == "1" then
                checkedInWorld[uid] = true
            else
                uncheckedInWorld[uid] = true
            end
        end
    end

    -- 1. Remove unchecked UIDs from blacklist
    for uid, _ in pairs(uncheckedInWorld) do
        state.apt_blacklist[uid] = nil
        state.apt_blacklist[tostring(uid)] = nil
    end

    -- 2. Add checked UIDs to blacklist
    for uid, _ in pairs(checkedInWorld) do
        state.apt_blacklist[uid] = true
    end

    -- Clean any array-style entries matching unchecked UIDs
    local newClean = {}
    for k, v in pairs(state.apt_blacklist) do
        local numKey = tonumber(k)
        local numVal = tonumber(v)
        if numKey and v == true then
            if not uncheckedInWorld[numKey] then
                newClean[numKey] = true
            end
        elseif numVal and type(k) == "number" and (v ~= true and v ~= false) then
            if not uncheckedInWorld[numVal] then
                newClean[numVal] = true
            end
        end
    end
    state.apt_blacklist = newClean

    save_config()
    local total = #get_blacklisted_uids()
    TextOverlay("`2Blacklist saved! Total: `9" .. total .. " UIDs")
    ShowAPTBlacklistDialog()
    return true
end

buttonHandlers.btn_apt_select_all = function(str)
    if type(state.apt_blacklist) ~= "table" then state.apt_blacklist = {} end
    local playerList = GetPlayerList() or {}
    local lp = GetSafeLocal and GetSafeLocal() or (GetLocal and GetLocal())
    local lpUID = lp and tonumber(lp.userid or lp.userID or 0) or 0
    local addedCount = 0
    for _, player in pairs(playerList) do
        local uid = tonumber(player.userid or player.userID or 0)
        if uid and uid > 0 and uid ~= lpUID then
            if not state.apt_blacklist[uid] then
                state.apt_blacklist[uid] = true
                addedCount = addedCount + 1
            end
        end
    end
    save_config()
    local total = #get_blacklisted_uids()
    TextOverlay("`2Added " .. addedCount .. " online player(s)! Total: `9" .. total .. " UIDs")
    ShowAPTBlacklistDialog()
    return true
end

buttonHandlers.btn_apt_deselect_all = function(str)
    state.apt_blacklist = {}
    save_config()
    TextOverlay("`4All blacklist cleared!")
    ShowAPTBlacklistDialog()
    return true
end

buttonHandlers.btn_apt_add = function(str)
    local uid = tonumber(str:match("apt_uid_input|([^|\r\n]*)"))
    if uid and uid > 0 then
        if type(state.apt_blacklist) ~= "table" then state.apt_blacklist = {} end
        if not state.apt_blacklist[uid] then
            state.apt_blacklist[uid] = true
            save_config()
            TextOverlay("`2Added UID " .. uid .. " to blacklist.")
        else
            TextOverlay("`4UID " .. uid .. " is already blacklisted.")
        end
    else
        TextOverlay("`4Invalid UID.")
    end
    ShowAPTBlacklistDialog()
    return true
end

buttonHandlers.btn_apt_remove = function(str)
    local uid = tonumber(str:match("apt_uid_input|([^|\r\n]*)"))
    if uid and uid > 0 then
        if type(state.apt_blacklist) == "table" and (state.apt_blacklist[uid] or state.apt_blacklist[tostring(uid)]) then
            state.apt_blacklist[uid] = nil
            state.apt_blacklist[tostring(uid)] = nil
            save_config()
            TextOverlay("`9Removed UID " .. uid .. " from blacklist.")
        else
            TextOverlay("`4UID " .. uid .. " not found in blacklist.")
        end
    else
        TextOverlay("`4Invalid UID.")
    end
    ShowAPTBlacklistDialog()
    return true
end

-- Pull & Kick Message Button Handlers
buttonHandlers.btn_pullmsg_save = function(str)
    local pullMsg = str:match("pullmsg_input|([^|\r\n]*)") or ""
    local kickMsg = str:match("kickmsg_input|([^|\r\n]*)") or ""
    pullMsg = pullMsg:gsub("[\r\n]", ""):gsub("^%s+", ""):gsub("%s+$", "")
    kickMsg = kickMsg:gsub("[\r\n]", ""):gsub("^%s+", ""):gsub("%s+$", "")

    if not has_valid_chat_text(pullMsg) then
        pullMsg = ""
    end
    if not has_valid_chat_text(kickMsg) then
        kickMsg = ""
    end

    state.pull_msg = pullMsg
    state.kick_msg = kickMsg
    save_config()
    if pullMsg == "" and kickMsg == "" then
        TextOverlay("`9Wrench Messages cleared (Disabled)!")
    else
        TextOverlay("`9Wrench Messages updated successfully!")
    end
    ShowCustomPullDialog()
end

buttonHandlers.btn_pullmsg_clear = function(str)
    state.pull_msg = ""
    state.kick_msg = ""
    save_config()
    TextOverlay("`9Wrench Messages cleared (Disabled).")
    ShowCustomPullDialog()
end

buttonHandlers.btn_pullmsg_default = function(str)
    state.pull_msg = "`9GASS!! "
    state.kick_msg = "`4KICKED!! "
    save_config()
    TextOverlay("`9Wrench Messages restored to default.")
    ShowCustomPullDialog()
end

-- Watermark Button Handlers
buttonHandlers.btn_wm_save = function(str)
    local name = str:match("wm_name_input|([^|\n]*)") or ""
    local color = str:match("wm_color_input|([^|\n]*)") or "4"
    name = name:gsub("^%s+", ""):gsub("%s+$", "")
    color = color:gsub("^%s+", ""):gsub("%s+$", ""):gsub("^`+", "")

    if name == "" then name = "HELL" end
    local finalCol = resolveColorCode(color)

    state.watermark_name = name
    state.watermark_color = finalCol
    state.watermark = str:match("wm_active_chk|1") and true or false

    save_config()
    TextOverlay("`2Watermark updated: `" .. finalCol .. "[@" .. name .. "]")
    ShowWatermarkDialog()
    return true
end

buttonHandlers.btn_wm_default = function(str)
    state.watermark_name = "HELL"
    state.watermark_color = "4"
    state.watermark = true
    save_config()
    TextOverlay("`9Watermark restored to default (`4[@HELL]`)")
    ShowWatermarkDialog()
    return true
end

-- Watermark Emote Button Handlers
buttonHandlers.btn_open_wm_emote = function(str)
    ShowWatermarkEmoteDialog()
    return true
end

buttonHandlers.btn_open_fixed_emotes = function(str)
    ShowFixedEmotesDialog()
    return true
end

buttonHandlers.btn_back_to_wm = function(str)
    ShowWatermarkDialog()
    return true
end

buttonHandlers.btn_back_to_emote_menu = function(str)
    ShowWatermarkEmoteDialog()
    return true
end

buttonHandlers.btn_save_wm_emote = function(str)
    local target = "\n" .. str
    state.wm_emote_enabled = target:match("\nwm_emote_enable_chk|1") and true or false
    local isRandom = target:match("\nwm_emote_random_mode|1") and true or false
    local isFixed = target:match("\nwm_emote_fixed_mode|1") and true or false

    if isRandom and not isFixed then
        state.wm_emote_mode = "random"
    else
        state.wm_emote_mode = "fixed"
    end

    save_config()
    local modeTxt = (state.wm_emote_mode == "random") and "Randomize" or "Fixed / Rotating"
    local statusTxt = state.wm_emote_enabled and ("`2Enabled `w(" .. modeTxt .. ")") or "`4Disabled"
    TextOverlay("`w[Watermark Emote] is now " .. statusTxt)
    ShowWatermarkEmoteDialog()
    return true
end

buttonHandlers.btn_select_all_emotes = function(str)
    local allList = {}
    for _, em in ipairs(EMOJI_VALUES) do
        table.insert(allList, em)
    end
    state.wm_selected_emotes = allList
    save_config()
    TextOverlay("`2All 60 emotes selected for rotation!")
    ShowFixedEmotesDialog()
    return true
end

buttonHandlers.btn_deselect_all_emotes = function(str)
    state.wm_selected_emotes = {}
    save_config()
    TextOverlay("`4All emotes deselected.")
    ShowFixedEmotesDialog()
    return true
end

buttonHandlers.btn_save_fixed_emotes = function(str)
    local newList = {}
    local seen = {}
    for idxStr in str:gmatch("cb_em_(%d+)%|1") do
        local idx = tonumber(idxStr)
        if idx and EMOJI_VALUES[idx] and not seen[idx] then
            seen[idx] = true
            table.insert(newList, EMOJI_VALUES[idx])
        end
    end

    state.wm_selected_emotes = newList
    wm_emote_rotation_index = 1
    save_config()

    if #newList == 0 then
        TextOverlay("`4No emote selected (Emote disabled).")
    elseif #newList == 1 then
        TextOverlay("`2Fixed Emote set to: `w" .. newList[1])
    else
        TextOverlay("`2Rotating Emotes set: `w" .. #newList .. " emotes active!")
    end

    ShowWatermarkEmoteDialog()
    return true
end

-- SETDROP Button Handlers
buttonHandlers.btn_apply_alias = function(str)
    local cmd_wl = cleanCmdInput(str:match("cmd_wl|([^|\n]*)"))
    local cmd_dl = cleanCmdInput(str:match("cmd_dl|([^|\n]*)"))
    local cmd_bgl = cleanCmdInput(str:match("cmd_bgl|([^|\n]*)"))
    local cmd_bglk = cleanCmdInput(str:match("cmd_bglk|([^|\n]*)"))
    local disable = str:match("disable_original|1") and true or false
    
    -- Fallback support for single alias input
    local single_alias = cleanCmdInput(str:match("alias_input|([^|\n]*)"))
    local single_target = cleanCmdInput(str:match("target_input|([^|\n]*)"))
    if single_alias ~= "" and single_target ~= "" then
        removeAliasPointingTo(single_target)
        if chatCommands[single_alias] then chatCommands[single_alias] = nil end
        local aliases = parseCustomDropAliases(state.custom_drop_aliases)
        aliases[single_alias] = single_target
        state.custom_drop_aliases = serializeCustomDropAliases(aliases)
        registerCommandAlias(single_alias, single_target)
        if not state.disabled_commands then state.disabled_commands = {} end
        if disable then
            chatCommands[single_target] = nil
            state.disabled_commands[single_target] = true
        else
            chatCommands[single_target] = original_commands[single_target]
            state.disabled_commands[single_target] = nil
        end
        save_config()
        TextOverlay("`wAlias `2/" .. single_alias .. "`w -> `2/" .. single_target)
        ShowSetdropDialog()
        return
    end

    local mapping = {
        dw = cmd_wl ~= "" and cmd_wl or "dw",
        dd = cmd_dl ~= "" and cmd_dl or "dd",
        db = cmd_bgl ~= "" and cmd_bgl or "db",
        di = cmd_bglk ~= "" and cmd_bglk or "di",
    }
    
    -- Check uniqueness among configured commands
    local usedNames = {}
    for target, alias in pairs(mapping) do
        if usedNames[alias] then
            TextOverlay("`4Commands must be unique! Duplicate: /" .. alias)
            ShowSetdropDialog()
            return
        end
        usedNames[alias] = target
    end
    
    -- Clear old drop aliases
    removeAliasPointingTo("dw")
    removeAliasPointingTo("dd")
    removeAliasPointingTo("db")
    removeAliasPointingTo("di")
    
    local aliases = parseCustomDropAliases(state.custom_drop_aliases)
    if not state.disabled_commands then state.disabled_commands = {} end

    for target, alias in pairs(mapping) do
        if alias ~= target then
            if chatCommands[alias] then chatCommands[alias] = nil end
            aliases[alias] = target
            registerCommandAlias(alias, target)
            if disable then
                chatCommands[target] = nil
                state.disabled_commands[target] = true
            else
                chatCommands[target] = original_commands[target]
                state.disabled_commands[target] = nil
            end
        else
            chatCommands[target] = original_commands[target]
            state.disabled_commands[target] = nil
        end
    end
    
    state.custom_drop_aliases = serializeCustomDropAliases(aliases)
    save_config()
    TextOverlay("`2Custom drop commands updated successfully!")
    ShowSetdropDialog()
end

buttonHandlers.btn_restore_alias = function(str)
    removeAliasPointingTo("dw")
    removeAliasPointingTo("dd")
    removeAliasPointingTo("db")
    removeAliasPointingTo("di")
    
    local defaultTargets = { "dw", "dd", "db", "di" }
    for _, target in ipairs(defaultTargets) do
        if state.disabled_commands then
            state.disabled_commands[target] = nil
        end
        if original_commands[target] then
            chatCommands[target] = original_commands[target]
        end
    end
    
    save_config()
    TextOverlay("`2Drop commands restored to defaults (/dw, /dd, /db, /di)")
    ShowSetdropDialog()
end

-- ==========================================
-- ONSENDPACKET HOOK
-- ==========================================
local function onsendpacket(type, str)
    local wrenchNetId = str:match("action|wrench\n|netid|(%d+)")
    if wrenchNetId then
        local id = tonumber(wrenchNetId)
        local playerName = "Unknown"
        for _, player in pairs(GetPlayerList()) do
            if player.netID == id or player.netid == id then
                playerName = player.name
                break
            end
        end
        if playerName == "Unknown" then
            local p = GetPlayer(id)
            if p then playerName = p.name end
        end
        if is_left_alt_held() then
            SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. id .. "|\nbuttonClicked|kick")
            if has_valid_chat_text(state.kick_msg) then
                local msg = state.kick_msg:gsub("{name}", playerName)
                if has_valid_chat_text(msg) then
                    SendPacket(2, "action|input\ntext|" .. msg)
                end
            end
            return true
        end

        if perform_wrench_action(id, playerName) then
            return true
        end
    end

    if str:find("dialog_name|spam_menu") then
        local target = "\n" .. str
        state.spam_text1 = target:match("\nt1|([^|\n]*)") or ""
        state.spam_text2 = target:match("\nt2|([^|\n]*)") or ""
        state.spam_text3 = target:match("\nt3|([^|\n]*)") or ""
        state.spam_text4 = target:match("\nt4|([^|\n]*)") or ""
        state.delay1 = tonumber(target:match("\nd1|([^|\n]*)")) or 2000
        state.delay2 = tonumber(target:match("\nd2|([^|\n]*)")) or 2000
        state.delay3 = tonumber(target:match("\nd3|([^|\n]*)")) or 2000
        state.delay4 = tonumber(target:match("\nd4|([^|\n]*)")) or 2000
        state.use_text1 = target:match("\nuse_t1|1") and true or false
        state.use_text2 = target:match("\nuse_t2|1") and true or false
        state.use_text3 = target:match("\nuse_t3|1") and true or false
        state.use_text4 = target:match("\nuse_t4|1") and true or false
        state.spam_rainbow = target:match("\nspam_rb|1") and true or false
        state.spam_rline = target:match("\nspam_rline|1") and true or false
        local btn = target:match("\nbuttonClicked|([%w_]+)")
        if btn == "spam_toggle" then
            if state.spam_active then
                state.spam_active = false
                TextOverlay("`w[`4Spammer Stopped`w]")
            else
                start_spammer_thread()
                TextOverlay("`w[`2Spammer Started`w]")
            end
            save_config()
            ShowSpammerMenu()
        else
            TextOverlay("`w[`2Settings Saved`w]")
            save_config()
        end
        return true
    end

    if str:find("dialog_name|apt_main") then
        local btn = str:match("buttonClicked|([%w_]+)")
        if btn then
            local handler = buttonHandlers[btn]
            if handler then
                return handler(str)
            end
        end
        return true
    end

    local buttonName = str:match("buttonClicked|([%w_]+)")
    if buttonName then
        local calcAction = buttonName:match("^calc_(.+)")
        if calcAction and str:find("dialog_name|calculator") then
            return handleCalculator(str, calcAction)
        end
        local handler = buttonHandlers[buttonName]
        if handler then
            return handler(str)
        end
    end

    local chatText = str:match("action|input\n|?text|([^\r\n]*)") or str:match("action|input\ntext|([^\r\n]*)")
    if chatText then
        local cleanChat = chatText:gsub("^%s+", "")
        local cmd, args = cleanChat:match("^/([%a%d]+)%s*(.*)")
        if cmd then
            args = args:gsub("%s*$", "")
            local handler = chatCommands[cmd]
            if handler then
                return handler(str, args)
            end

            -- Multiplier Drop Command Handler (e.g. /dd3 5 -> 3 * 5 = 15 DL)
            local baseCmd, multStr = cmd:match("^([%a]+)(%d+)$")
            if baseCmd and multStr then
                local multiplier = tonumber(multStr)
                local targetHandler = chatCommands[baseCmd] or original_commands[baseCmd]
                if targetHandler and multiplier and multiplier > 0 then
                    local baseCount = tonumber(args:match("(%d+)"))
                    local totalCount = (baseCount and baseCount > 0) and (baseCount * multiplier) or multiplier
                    return targetHandler(str, tostring(totalCount))
                end
            end
        end
    end

    if state.watermark and str:find('action|input\n') and (str:find('|text|') or str:find('text|')) then
        local text = str:match('|text|([^\r\n]+)') or str:match('text|([^\r\n]+)')
        if text and not text:find('^/') and not text:find('^%((%w+)%)') then
            local wmName = tostring(state.watermark_name or "HELL")
            if wmName == "" or wmName:find("action|input") then wmName = "HELL" end
            local col = resolveColorCode(state.watermark_color or "4")
            local em = get_current_watermark_emote(true)
            local emPart = (em and em ~= "") and (em .. " ") or ""
            local wmPrefix = "`" .. col .. "[@" .. wmName .. "] " .. emPart .. "`w: "
            local tagCheck = "[@" .. wmName .. "]"
            if not text:find(tagCheck, 1, true) and not text:find(wmPrefix, 1, true) then
                SendPacket(2, "action|input\n|text|" .. wmPrefix .. text)
                return true
            end
        end
    end

    if state.emoji_Talk and str:find('action|input\n|text|') and not str:find('|text|/') and not str:find('|text|%((%w+)%)') then
        local Text = str:match('|text|([^\n]+)')
        SendPacket(2, 'action|input\n|text|' .. GetRandomEmoji() .. ' : ' .. Text .. ' `4#HELL')
        return true
    end

    return false
end

-- ==========================================
-- VARIANT HANDLERS
-- ==========================================
local variantHandlers = {}

variantHandlers.OnDialogRequest = function(var)
    local content = var[1]
    if not content then return false end

    -- 1. Handle Inventory Dialog (viewinv / scan / modal)
    if content:find("'s Inventory", 1, true) then
        local summary = parse_inventory_summary_from_dialog(content)
        if summary and summary.playername and summary.playername ~= "Unknown" then
            -- Skip local player's own inventory if manually opened
            local lp = GetSafeLocal()
            local lpName = lp and lp.name and Filter(lp.name):lower():gsub("[%+%s%@]+", "")
            local lpUid = lp and tonumber(lp.userid or lp.userID or 0)
            local sNameClean = Filter(summary.playername):lower():gsub("[%+%s%@]+", "")
            local sUid = tonumber(summary.userid or 0)

            if (lpName and sNameClean and lpName == sNameClean) or (lpUid and sUid and lpUid ~= 0 and lpUid == sUid) then
                return false -- Our own inventory, let player see it
            end

            local now = os.clock()
            local matched_netid = nil

            -- 1. Match by UserID from pending queue
            if summary.userid and summary.userid ~= 0 then
                for nid, info in pairs(pending_modal_pull) do
                    if info.userid and info.userid == summary.userid and (now - info.timestamp) < 5.0 then
                        matched_netid = nid
                        break
                    end
                end
            end

            -- 2. Match by Clean Name from pending queue
            if not matched_netid and sNameClean ~= "" then
                for nid, info in pairs(pending_modal_pull) do
                    local tName = Filter(info.name or ""):lower():gsub("[%+%s%@]+", "")
                    if (now - info.timestamp) < 5.0 and (sNameClean == tName or tName:find(sNameClean, 1, true) or sNameClean:find(tName, 1, true)) then
                        matched_netid = nid
                        break
                    end
                end
            end

            -- 3. Match from active world PlayerList
            if not matched_netid then
                matched_netid = find_netid_by_name_or_uid(summary.playername, summary.userid)
            end

            -- 4. Fallback to most recent pending request
            if not matched_netid then
                for nid, info in pairs(pending_modal_pull) do
                    if (now - info.timestamp) < 4.0 then
                        matched_netid = nid
                        break
                    end
                end
            end

            local total_bgl = (summary.blackgl_count * 100) + summary.bgl_count + (summary.dl_count / 100) + (summary.wl_count / 10000)
            local min_modal = tonumber(state.apt_min_modal) or 0
            local cleanName = Filter(summary.playername):gsub("^%s+", ""):gsub("%s+$", "")
            local modalStr = string.format("%.2f", total_bgl)

            local info = nil
            local is_from_pending = false

            if matched_netid then
                info = pending_modal_pull[matched_netid]
                if info then
                    is_from_pending = true
                    pending_modal_pull[matched_netid] = nil
                end

                local isAptActive = state.apt or (state.apt_hold_mode ~= false and is_left_alt_held())
                if isAptActive and total_bgl >= min_modal then
                    local targetNid = matched_netid
                    SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. targetNid .. "|\nbuttonClicked|pull")
                    if has_valid_chat_text(state.pull_msg) then
                        local msg = state.pull_msg:gsub("{name}", cleanName)
                        if has_valid_chat_text(msg) then
                            SendPacket(2, "action|input\ntext|" .. msg)
                        end
                    end
                    RunDelayed(60, function()
                        SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|" .. targetNid .. "|\nbuttonClicked|pull")
                    end)
                    if webhook.pull and webhook.pull ~= "" then
                        local lpNameSafe = GetSafeLocalName()
                        local worldName = GetSafeWorldName()
                        Webhuk(webhook.pull, "Proxy TeamHELL", "", "**Player:** `2" .. lpNameSafe .. "`w\n**Action:** Auto Pulled `4" .. cleanName .. "`w (UID: `9" .. (info and info.userid or summary.userid or "?") .. "`w)\n**Modal:** `e" .. modalStr .. " BGL`w (Min: " .. min_modal .. " BGL)\n**Reason:** " .. (info and info.reason or "Scan") .. "\n**World:** `9" .. worldName .. "`w\n**Time:** " .. os.date("%I:%M %p"))
                    end
                end
            end

            local isAptRunning = state.apt or (state.apt_hold_mode ~= false and is_left_alt_held())

            if state.showmodal then
                local balance_msg = format_inventory_balance_message(summary)
                TextOverlay(balance_msg)
                LogToConsole(balance_msg)
                if state.showbal_use_chat then
                    SendPacket(2, "action|input\n|text|" .. balance_msg)
                end
                return true
            end

            -- Jika request otomatis dari scanner APT di background, tetap tahan agar tidak mengganggu
            if is_from_pending or isAptRunning then
                return true
            end

            -- Jika showmodal OFF dan dibuka secara manual (misal /viewinv), biarkan dialog muncul di layar
            return false
        end
    end

    -- 2. Pure profile dialogs (without 's Inventory) pass through normally
    if content:find("end_dialog|profileinfo") or content:find("dialog_name|profileinfo") or content:find("dialog_name|player_profile") or content:find("Profile of") then
        return false
    end

    local x = tonumber(content:match("embed_data|x|(%d+)") or content:match("\nx|(%d+)"))
    local y = tonumber(content:match("embed_data|y|(%d+)") or content:match("\ny|(%d+)"))
    local num = content:match("embed_data|num|(%d+)") or content:match("\nnum|(%d+)")

    if content:find("fast delivery") or (content:find("end_dialog|telephone") and not content:find("`wTelephone")) then
        return true
    end

    if content:find("`wTelephone") and x and y then
        if state.buycemp2 then
            SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|" .. (num or "53785") .. "|\nx|" .. x .. "|\ny|" .. y .. "|\nbuttonClicked|getchamp2")
            TextOverlay("`9Success `1BUY `9Champ Bgems")
            local playerName = GetSafeLocalName()
            Webhuk(webhook.champ, "Proxy TeamHELL", "", "**Player:** `2" .. playerName .. "`w\n**Action:** Bought Champagne using `eBgems`w\n**Time:** " .. os.date("%I:%M %p"))
            return true
        elseif state.buycemp then
            SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|" .. (num or "53785") .. "|\nx|" .. x .. "|\ny|" .. y .. "|\nbuttonClicked|getchamp")
            TextOverlay("`9Success `1BUY `9Champ")
            local playerName = GetSafeLocalName()
            Webhuk(webhook.champ, "Proxy TeamHELL", "", "**Player:** `2" .. playerName .. "`w\n**Action:** Bought Champagne using `cDL`w\n**Time:** " .. os.date("%I:%M %p"))
            return true
        elseif state.cbgl then
            SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|" .. (num or "53785") .. "|\nx|" .. x .. "|\ny|" .. y .. "|\nbuttonClicked|bglconvert")
            TextOverlay("`2Converted to BGL")
            return true
        end
    end

    if content:find("One Champagne Bottle") then
        return true
    end

    return false
end

local pending_collect = { black = 0, bgl = 0, dl = 0, wl = 0 }
local collect_timer_running = false
local collect_batch_delay_ms = 200

variantHandlers.OnConsoleMessage = function(var)
    local msg = var[1]
    if not msg then return false end

    if state.blockspam and msg:find("'s Spammer Slave.") then
        return true
    end

    if msg:find("CT:") and msg:find("spun") and msg:find("wheel") and msg:find("got") then
        LogToConsole("`c[TYPER DETECTED] " .. msg)
        local worldName = GetSafeWorldName()
        local _spin = '[World: `2' .. worldName .. '``] `4[FAKE] ``' .. tostring(msg)
        table.insert(state.faker_dialog, _spin)
        local ka = msg:match("<(.+)>") or "Unknown"
        SendVariantList({
            [0] = "OnAddNotification",
            [1] = "interface/atomic_button.rttex",
            [2] = "`8GrowID`b:`` " .. Filter(ka) .. " `9Typer `2BOS`4!!",
            [3] = "audio/hub_open.wav",
        })
        local cleanName = Filter(ka)
        Webhuk(webhook.typer, "Proxy TeamHELL", "", "**Player:** `2" .. cleanName .. "`w\n**Action:** `4Typer/Fake Spin Detected`w\n**World:** `9" .. worldName .. "`w\n**Time:** " .. os.date("%I:%M %p"))
        return true
    end

    if msg:find("spun the wheel") then
        LogToConsole(tostring(msg) .. "`b[`9REAL`b]")
        local worldName = GetSafeWorldName()
        local _spin = '[World: `2' .. worldName .. '``] `b[`2REAL`b] ``' .. tostring(msg)
        table.insert(state.spins_dialog, _spin)
        return true
    end

    if msg:find("Collected") then
        local jumlah = tonumber(msg:match("(%d+)"))
        local lockType = ""
        local itemID = nil
        if msg:find("World Lock") then
            lockType = "`9World Lock"
            itemID = 242
        elseif msg:find("Diamond Lock") then
            lockType = "`cDiamond Lock"
            itemID = 1796
        elseif msg:find("Blue Gem Lock") then
            lockType = "`eBlue Gem Lock"
            itemID = 7188
        elseif msg:find("Black Gem Lock") then
            lockType = "`bBlack Gem Lock"
            itemID = 11550
        end
        if itemID and jumlah and jumlah > 0 and getItemCount(itemID) >= jumlah then
            local worldName = GetSafeWorldName()
            local logMsg = "[World: `2" .. worldName .. "`w] `9COLLECT: `2#" .. jumlah .. " " .. lockType
            table.insert(state.kolek_dialog, logMsg)
            
            if itemID == 11550 then pending_collect.black = pending_collect.black + jumlah
            elseif itemID == 7188 then pending_collect.bgl = pending_collect.bgl + jumlah
            elseif itemID == 1796 then pending_collect.dl = pending_collect.dl + jumlah
            elseif itemID == 242 then pending_collect.wl = pending_collect.wl + jumlah end

            if not collect_timer_running then
                collect_timer_running = true
                RunThread(function()
                    Sleep(collect_batch_delay_ms)
                    local formatted = format_locks_short(pending_collect.black, pending_collect.bgl, pending_collect.dl, pending_collect.wl)
                    if formatted and formatted ~= "" and formatted ~= "`w0 WL" then
                        helpers.Say("`9COLLECT `w: " .. formatted)
                    end
                    pending_collect = { black = 0, bgl = 0, dl = 0, wl = 0 }
                    collect_timer_running = false
                end)
            end

            if webhook.lock and webhook.lock ~= "" then
                local playerName = GetSafeLocalName()
                local worldName = GetSafeWorldName()
                local formatted = formatLockAmount(jumlah, itemID)
                local actionName = ""
                if itemID == 7188 then actionName = "Collected " .. formatted
                elseif itemID == 11550 then actionName = "Collected " .. formatted
                elseif itemID == 1796 then actionName = "Collected " .. formatted
                elseif itemID == 242 then actionName = "Collected " .. formatted
                else actionName = "Collected " .. jumlah .. " " .. lockType end
                Webhuk(webhook.lock, "Proxy TeamHELL", "", "**Player:** `2" .. playerName .. "`w\n**Action:** " .. actionName .. "`w\n**World:** `9" .. worldName .. "`w\n**Time:** " .. os.date("%I:%M %p"))
            end
            auto_combine_locks()
        end
    end

    return false
end

variantHandlers.OnTalkBubble = function(var)
    local text = var[2]
    if type(text) ~= "string" then return false end

    if state.blockspam and (text:find("Spammer Slave") or text:find("spammer slave")) then
        return true
    end

    if text:find("You got") and text:find("Blue Gem Lock") then
        RunThread(function()
            Sleep(300)
            if getItemCount(7188) >= 100 then
                ensureBlackGemLock()
            end
        end)
    end
    if text:find("spun the wheel") then
        local rawNumStr = text:match("and got (.+)")
        local spinNum = text:gsub("`.", ""):match("and got (%d+)")
        local h = 0
        if rawNumStr then
            local cleanNum = rawNumStr:gsub("!%]", ""):gsub("`", "")
            local onlyNumber = cleanNum:sub(2):gsub(" ", "")
            h = tonumber((onlyNumber:gsub("!7", ""):gsub("]", ""))) or 0
        end
        local isGameMode = (state.reme or state.qeme or state.leme or state.sleme or state.lewa6 or state.lewa7 or state.lemeagus or state.lemeagus3)
        local finalText
        if isGameMode then
            if state.shortspin then
                finalText = "`w(" .. (spinNum or "?") .. ") " .. getGame(h)
            else
                finalText = "`w[`2REAL`w] " .. tostring(text) .. " " .. getGame(h)
            end
        else
            if state.shortspin then
                finalText = "`w(" .. (spinNum or "?") .. ")"
            else
                finalText = "`b[`2REAL`b] " .. text
            end
        end
        SendVariantList({ [0]='OnTalkBubble', [1]=var[1], [2]=finalText, [3]=var[3] })
        return true
    end
    return false
end

variantHandlers.OnSpawn = function(var)
    local spawnData = var[1]
    if type(spawnData) ~= "string" then return false end

    -- Skip local player avatar spawn
    if spawnData:find("type%s*|%s*local") or spawnData:find("type|local") then
        return false
    end

    if state.blockspam and (spawnData:find("Spammer Slave") or spawnData:find("spammer")) then
        return true
    end

    if spawnData:find("|-558|") or (spawnData:find("invis|1") and spawnData:find("type|2")) then
        return true
    end

    local isHoldActive = (state.apt_hold_mode ~= false and is_left_alt_held())
    local isAptActive = state.apt or isHoldActive
    if isAptActive then
        local netID = spawnData:match("netID%s*|%s*(%d+)")
        local userID = spawnData:match("userID%s*|%s*(%d+)")
        local nameMatch = spawnData:match("name%s*|%s*([^|\n]+)")
        if netID then
            local targetName = nameMatch and Filter(nameMatch) or "Unknown"
            local playerObj = {
                netid = tonumber(netID),
                netID = tonumber(netID),
                userid = tonumber(userID),
                name = targetName,
            }
            local reason = isHoldActive and "Hold Alt (Respawn)" or "OnSpawn"
            check_and_execute_pull(playerObj, reason)
        end
    end

    return false
end

variantHandlers.OnSDBroadcast = function(var)
    if state.sdbb then return true end
    return false
end

local function onvariant(var)
    local eventName = var[0]
    if not eventName then return false end
    local handler = variantHandlers[eventName]
    if handler then
        return handler(var)
    end
    if type(eventName) == "string" and eventName:find("OnKill") then
        SendPacket(2, "action|input\n|text|`4TIDAK `2MAIN `cDULU `9:v`4!!")
    end
    return false
end

local function raw(packet)
    local ctrl_state = tonumber(GetAsyncKeyState(0x11)) or 0
    if (is_shift_held() or ctrl_state < 0 or ctrl_state >= 32768) and packet and packet.type == 3 then
        return true
    end

    if state.tpdisplay and packet.type == 3 and packet.value == 18 then
        local tile = GetTile(packet.px, packet.py)
        if tile and tile.fg == 1422 then
            RunThread(function()
                local lp = GetSafeLocal()
                if lp and lp.pos and lp.pos.x and lp.pos.y then
                    state.originX = math.floor(lp.pos.x / 32)
                    state.originY = math.floor(lp.pos.y / 32)
                    FindTP(packet.px, packet.py)
                    Sleep(1)
                    FindTP(state.originX, state.originY)
                end
            end)
            return true
        end
    end
    return false
end

local function on_world_touch_wrench_pull(position, mouse_down)
    local WRENCH_ID = 32
    if not mouse_down then return false end
    if position == nil or position.x == nil or position.y == nil then return false end

    local ctrl_state = tonumber(GetAsyncKeyState(0x11)) or 0
    if ctrl_state < 0 or ctrl_state >= 32768 then
        local clickX = math.floor(position.x / 32)
        local clickY = math.floor(position.y / 32)
        local isObjSuccess, objList = pcall(GetObjectList)
        if isObjSuccess and objList then
            local maxDistSq = 64 * 64
            for _, obj in pairs(objList) do
                if obj and obj.pos and obj.oid then
                    local dx = obj.pos.x - position.x
                    local dy = obj.pos.y - position.y
                    local distSq = (dx * dx) + (dy * dy)
                    if distSq <= maxDistSq then
                        SendPacketRaw(false, { type = 11, value = obj.oid, x = obj.pos.x, y = obj.pos.y })
                    end
                end
            end
        end
        return true
    end

    if is_shift_held() then
        local clickX = math.floor(position.x / 32)
        local clickY = math.floor(position.y / 32)
        local isLocalOk, lp = pcall(GetLocal)
        local startX, startY = clickX, clickY
        if isLocalOk and lp and lp.pos then
            startX = math.floor(lp.pos.x / 32)
            startY = math.floor(lp.pos.y / 32)
        end
        local distBlocks = math.abs(clickX - startX) + math.abs(clickY - startY)
        local startMs = math.floor(os.clock() * 1000)
        
        RunThread(function()
            FindPath(clickX, clickY)
            local arrived = false
            local waited = 0
            while waited < 4000 do
                local ok, nowLp = pcall(GetLocal)
                if ok and nowLp and nowLp.pos then
                    local nowX = math.floor(nowLp.pos.x / 32)
                    local nowY = math.floor(nowLp.pos.y / 32)
                    if nowX == clickX and nowY == clickY then
                        arrived = true
                        break
                    end
                end
                Sleep(50)
                waited = waited + 50
            end
            pcall(SendPacketRaw, false, { type = 8, pos_x = clickX * 32 + 16, pos_y = clickY * 32 + 16 })
            SendTileEffect(clickX * 32 + 16, clickY * 32 + 16)
        end)
        return true
    end

    if not state.wrench_touch_pull then return false end

    local success, player_items = pcall(GetPlayerItems)
    local selected_item = success and player_items and player_items.backpack
        and tonumber(player_items.backpack.selected) or 0
    if selected_item ~= WRENCH_ID then return false end

    local target = find_closest_player(position)
    if not target then return false end

    local targetNetID = target.netID or target.netid
    local targetName = target.name or "Unknown"
    if targetNetID then
        perform_wrench_action(targetNetID, targetName, { force_pull = true })
        return true
    end

    return false
end

-- ==========================================
-- LOG USER INFO TO ProxyHELL.txt
-- ==========================================
local function logUserInfo()
    local success, localPlayer = pcall(GetLocal)
    if not success or not localPlayer then return end
    local uid = localPlayer.userid or localPlayer.netID or "Unknown"
    local name = localPlayer.name or "Unknown"
    local world = GetWorld() and GetWorld().name or "Unknown"
    local date = os.date("%Y-%m-%d %H:%M:%S")
    local content = string.format([[
===================================
 PROXY TeamHELL - USER LOG
===================================
User ID      : %s
GrowID       : %s
World        : %s
Date/Time    : %s
Status       : Authenticated
===================================
]], tostring(uid), tostring(name), tostring(world), date)
    local f = io.open("ProxyHELL.txt", "w")
    if f then
        f:write(content)
        f:close()
    end
end

-- ==========================================
-- AUTHENTICATION : System UID & Pastebin
-- ==========================================
local PastebinURL = "https://pastebin.com/raw/x0RAXkgt"

local function AuthenticateUID()
    local isSuccess, localPlayer = pcall(GetLocal)
    if not isSuccess or not localPlayer then return false end
    local myUID = tonumber(localPlayer.userid or localPlayer.netID or 0)
    if myUID == 0 then return false end
    LogToConsole("`4[TeamHELL Proxy]: `wChecking authorization for UID :`2 "..tostring(myUID))
    local success, response = pcall(MakeRequest, PastebinURL, "GET")
    if not success or not response then
        LogToConsole("`4[HELL Proxy]: `wFailed to connect to authorization server!")
        return false
    end
    if type(response) == "table" then
        if type(response.body) == "string" then response = response.body
        elseif type(response.content) == "string" then response = response.content
        else
            LogToConsole("`4[HELL Proxy]: `wUnexpected authorization response type: " .. type(response))
            return false
        end
    end
    if type(response) ~= "string" or response == "" then
        LogToConsole("`4[HELL Proxy]: `wFailed to connect to authorization server!")
        return false
    end
    for line in response:gmatch("[^\r\n]+") do
        local cleanLine = line:match("^%s*(.-)%s*$")
        if tonumber(cleanLine) == myUID then
            return true
        end
    end
    return false
end

-- ==========================================
-- BACKGROUND HOTKEY LISTENER
-- ==========================================
local function start_hotkey_listener()
    RunThread(function()
        local delete_was_pressed = false
        local hold_active = false
        while true do
            -- 1. Toggle Mode: Delete key
            if state.apt_toggle_mode ~= false and GetAsyncKeyState then
                local s = tonumber(GetAsyncKeyState(KeyCodes.Delete or 46)) or 0
                local is_pressed = (s < 0 or s >= 32768)
                if is_pressed and not delete_was_pressed then
                    delete_was_pressed = true
                    if chatCommands and chatCommands.apt then
                        chatCommands.apt()
                    else
                        state.apt = not state.apt
                        local status = state.apt and "`2ON" or "`4OFF"
                        TextOverlay("`w[Auto Pull] `wis now " .. status)
                        save_config()
                    end
                elseif not is_pressed then
                    delete_was_pressed = false
                end
            end

            -- 2. Hold Mode: Left Alt continuous pulling (Target tile: Custom or Auto White Door)
            local is_holding_alt = (state.apt_hold_mode ~= false and is_left_alt_held())
            if is_holding_alt then
                local targetX, targetY, isCustom = get_target_pull_tile()
                if not hold_active then
                    hold_active = true
                    if targetX and targetY then
                        TextOverlay("`w[APT Hold] `2Scanning Auto Pull Tiles (" .. targetX .. ", " .. targetY .. ")...")
                    else
                        TextOverlay("`w[APT Hold] `4Target tile not found!")
                    end
                end
                if targetX and targetY then
                    SendTileEffect(targetX * 32 + 16, targetY * 32 + 16)
                    local ok, pList = pcall(GetPlayerList)
                    if ok and pList then
                        for _, p in pairs(pList) do
                            if not should_skip_player(p) and p.pos and p.pos.x and p.pos.y then
                                local pxCenter = math.floor((p.pos.x + 16) / 32)
                                local pyCenter = math.floor((p.pos.y + 16) / 32)
                                local rawPx = math.floor(p.pos.x / 32)
                                local rawPy = math.floor(p.pos.y / 32)
                                local xMatch = (pxCenter == targetX or rawPx == targetX)
                                local yMatch = (pyCenter == targetY or rawPy == targetY or pyCenter == targetY + 1 or rawPy == targetY + 1)
                                if xMatch and yMatch then
                                    check_and_execute_pull(p, "Hold Alt (" .. (isCustom and "Custom Tile" or "White Door") .. ")")
                                end
                            end
                        end
                    end
                end
            else
                if hold_active then
                    hold_active = false
                end
            end

            if is_holding_alt then
                Sleep(15) -- Fast polling rate for Alt Hold
            elseif state.apt then
                Sleep(35) -- Smooth, lightweight presence scanner (0% CPU)
            else
                Sleep(50)
            end
        end
    end)
end

-- ==========================================
-- LOAD CONFIG & EXECUTION
-- ==========================================
load_config()
state.spam_active = false
applyCustomDropAliases()
applyDisabledCommands()

if AuthenticateUID() then
    logUserInfo()
    local lp = GetSafeLocal()
    local playerName = lp and lp.name and Filter(lp.name) or "Unknown"
    local uid = lp and (lp.userid or lp.userID or 0) or 0
    local worldName = GetSafeWorldName()
    Webhuk(webhook.inject, "Proxy by TeamHELL", "", "**Player:** `2" .. playerName .. "`w\n**UID:** `9" .. tostring(uid) .. "`w\n**World:** `9" .. worldName .. "`w\n**Status:** `2Authenticated`w\n**Time:** " .. os.date("%I:%M %p"))
    AddHook("onsendpacket", "onsendpacket", onsendpacket)
    AddHook("onvariant", "onvariant", onvariant)
    AddHook("onsendpacketraw", "onsendpacketraw", raw)
    AddHook("onworldtouch", "onworldtouch", on_world_touch_wrench_pull)
    AddHook("OnInput", "InputDetector", InputDetector)
    start_hotkey_listener()
    LogToConsole("`4[TeamHELL Proxy]: `wAuthorized User : `2" .. tostring(uid))
    TextOverlay("`w[`2Authorized User`w : `9" .. tostring(uid) .. "`w]")
    SendVariantList({ [0] = "OnDialogRequest", [1] = dialogs.opening })
else
    local lp = GetSafeLocal()
    local uid = lp and (lp.userid or lp.userID or 0) or 0
    local name = lp and lp.name and Filter(lp.name) or "Unknown"
    Webhuk(webhook.allow, "Proxy by TeamHELL", "", "**Player:** `2" .. name .. "`w\n**UID :** `9" .. tostring(uid) .. "`w\n**Status:** `4ILLEGAL ATTEMPT`w\n**Time:** " .. os.date("%I:%M %p"))
    LogToConsole("`4[ACCESS DENIED] `2UserID has not been authenticated `w(`9" .. tostring(uid) .. "`w)! `4Script terminated`w.")
    RunThread(function()
        Sleep(500)
        TextOverlay("`4[ACCESS DENIED] `2UserID has not been authenticated `w! `4Script terminated`w.")
    end)
    return
end