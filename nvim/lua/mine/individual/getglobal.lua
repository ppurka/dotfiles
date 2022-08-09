-- Get some global settings. The arguments passed correspond to the global
-- variable that is eventually set.
-- 1. "night_time"  - (boolean) night time or day time
-- 2. "is_laptop"   - (boolean) are we running on laptop
-- 3. "only_laptop" - (boolean) are we running only on laptop (not on external display)
-- 4. "is_term"     - (boolean) are we running in terminal
-- 5. "username_uid"- (int    ) get the current user's UID
local M = {}

-- use function instead of os.execute. neovide tends to hang on os.execute
local function exec(cmd)
    local fh = assert(io.popen(cmd))
    local output = fh:read('*a')
    fh:close()
    return output
end

M = function(arg)
    -- check this only once
    local islpt = false
    if (arg == "is_laptop" or arg == "only_laptop") then
        if (vim.g.is_laptop ~= nil) then
            islpt = vim.g.is_laptop
        else
            -- this should be done only once (1 => local laptop/desktop)
            islpt = tonumber(exec("hostname -d | grep -c localdomain")) == 1
        end
    end

    if (arg == "night_time") then
        local hour  = tonumber(exec("date +%H"))    -- current hour in 24 hour format
        local day   = (7 <= hour) and (hour < 19)   -- day time
        return not day

    elseif (arg == "is_laptop") then
        return islpt

    elseif (arg == "only_laptop") then
        local onlylptp = false
        if islpt then
            -- run the exec only if laptop is confirmed
            -- number of displays - used to determine if only laptop is connected
            onlylptp = tonumber(exec("xrandr |& grep -scw connected")) == 1
        end
        return onlylptp

    elseif (arg == "is_term") then
        local isterm = false
        if (vim.g.is_term ~= nil) then
            isterm = vim.g.is_term
        else
            -- run this exec only once. It is unique per session
            isterm = tonumber(exec("tty -s && echo 1 || echo 0")) == 1
        end
        return isterm

    elseif (arg == "username_uid") then
        local uid = vim.g.username_uid
        if (uid == nil) then
            -- run this only once per session (unless uid happens to be nil)
            uid = tonumber(exec("echo $UID"))   -- os.getenv("UID") returns nil
        end
        return uid

    end
end

return M
