-- Get some global settings. The arguments passed correspond to the global
-- variable that is eventually set.
-- 1. "night_time"  - (boolean) night time or day time
-- 2. "is_laptop"   - (boolean) are we running on laptop
-- 3. "only_laptop" - (boolean) are we running only on laptop (not on external display)
-- 4. "is_term"     - (boolean) are we running in terminal
-- 5. "username_uid"- (int    ) get the current user's UID
-- 6. "have_git"    - (boolean) whether git is available
-- 7. "python3"     - (string ) try to use env; get python3 path; call after determining is_laptop
-- 8. "node"        - (string ) try to use env; get nodejs path; call after determining is_laptop
-- 9. "custombg"    - (boolean) whether the background was toggled using Ctrl-F5
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
            -- faster - just check os.execute that behaves okay now
            islpt = os.execute("xrandr |& grep -qcs 'connected 1920x10'") == 0
        end
    end

    if (arg == "night_time") then
        local hour  = tonumber(os.date("%H"))       -- current hour in 24 hour format
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
            isterm = not os.execute("tty -s")
        end
        return isterm

    elseif (arg == "username_uid") then
        local uid = vim.g.username_uid
        if (uid == nil) then
            -- run this only once per session (unless uid happens to be nil)
            uid = tonumber(exec("echo $UID"))   -- os.getenv("UID") returns nil
        end
        return uid

    elseif (arg == "have_git") then
        local havegit = vim.fn.executable("git") == 1
        return havegit

    elseif (arg == "python3") then
        local py3 = exec("which python3")
        if (py3 == nil) then
            if vim.g.is_laptop then
                py3 = "/usr/bin/python3"
            else
                local home = os.getenv("HOME")
                py3 = home .. '/Installations/python3.6.db9/bin/python3'
            end
        end
        return string.gsub(py3, "\n", "")

    elseif (arg == "node") then
        local nd = exec("which neovim-node-host")
        if (nd == nil) then
            local home = os.getenv("HOME")
            if vim.g.is_laptop then
                nd = home .. "/Documents/Installations/nodejs/node_modules/.bin/neovim-node-host"
            else
                nd = home .. "/Installations/node.db11/bin/neovim-node-host"
            end
        end
        return string.gsub(nd, "\n", "")

    elseif (arg == "custombg") then
        return vim.g.custombg

    end
end

return M
