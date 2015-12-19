--Installer
--Known issue: the code being installed should have its Main tab as the left-most tab

local function success(data)
    if data:find("%-%-%# Main") then --paste-into-project format
        data = data.."--# " --add new file tag to end in order to capture last file
        for name, file in data:gmatch("(%w+)\n(.-)\n%-%-%# ") do --capture each name and file
            saveProjectTab(name, file)
            print("Saved", name)
        end
    else --put it all in one tab
        saveProjectTab("Main", data)
    end
    load(data)() --load the file
    setup() --run it
end

local function failure(error)
    print("Error", error)
end

http.request("https://raw.githubusercontent.com/TokOut/The-Great-Work/master/Windows/OneClassOpening/Local.lua", success, failure)
