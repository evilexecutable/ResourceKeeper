local Mailgun = require("mailgun").Mailgun

--Get Hostname
pcname = os.execute("hostname")
-- Lets run a CMD command that will get the free space for the C drive and save to a file.
os.execute('wmic /node:"%COMPUTERNAME%" LogicalDisk Where DriveType="3" Get DeviceID,FreeSpace|find /I "c:" > freespace.txt')
-- Now lets make that file the only input file.
loadfreespace = assert(io.input("freespace.txt"))
-- Convert from userdata to string and read the entire file (it's only 1 line)
tostring(loadfreespace)
readfreespace = io.read("*all")
-- Print it to test it has only displayed the free space. Now we can convert from bytes to GB.
--test = print(tonumber(string.match(readfreespace, "%d+")))
-- Calculate from B to GB and print
getspace = tonumber(string.match(readfreespace, "%d+")) / 1024 / 1024 / 1024
print(getspace .. " Gigabytes Free on C:\\")
-- Close the freespace file so we can continue to open some later
io.input():close()
collectgarbage()
-------------------------------------------------------------------------------------------------------

-- Now lets calculate RAM in the same way.
os.execute('wmic /node:"%COMPUTERNAME%" OS get FreePhysicalMemory /VALUE > ram.txt')
-- Convert the file from Unicode to ANSI so Lua can read it correctly.
os.execute('type "ram.txt" > freeram.txt')
-- Load file again.
loadfreeram = assert(io.input("freeram.txt"))
-- and we convert to string
tostring(loadfreeram)
readfreeram = io.read("*all")
-- Test print
getram = tonumber(string.match(readfreeram, "%d+")) /1024
print(getram .. " MB Free RAM")
-------------------------------------------------------------------------------------------------------

-- Email Support

local m = Mailgun({
  domain = "",
  api_key = ""
})

m:send_email({
  to = "",
  cc = "",
  subject = "Server Report for" .. pcname ..,
  html = false,
  body = [[Server Report for ]] .. pcname "\n" .. [[
  		--Ram:]] .. getram .. [[ MB Free]] .. "\n" .. [[
  		--HDD:]] .. getspace .. [[ GB Free]] .. "\n" .. [[
  ]]
})

