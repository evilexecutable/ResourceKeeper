local Mailgun = require("mailgun").Mailgun

-- Get Hostname for later use.
pcname = os.execute("hostname")
-- Lets run a CMD command that will get the free space for the C drive and save to a file and load that file in memory.
os.execute('wmic /node:"%COMPUTERNAME%" LogicalDisk Where DriveType="3" Get DeviceID,FreeSpace|find /I "c:" > freespace.txt')
loadfreespace = assert(io.input("freespace.txt"))
tostring(loadfreespace)
readfreespace = io.read("*all")
-- Read the numbers from the file in the variable and divide by 1024 3x to get from Bytes to GB.
getspace = tonumber(string.match(readfreespace, "%d+")) / 1024 / 1024 / 1024
print(getspace .. " Gigabytes Free on C:\\")
-- Close the file so we can continue to open some later then collect garbage manually to keep overhead as low as possible (useful for next part).
io.input():close()
collectgarbage()
-------------------------------------------------------------------------------------------------------

-- We need to calculate the free RAM of the local machine, convert the file to ANSI and load it in memory.
os.execute('wmic /node:"%COMPUTERNAME%" OS get FreePhysicalMemory /VALUE > ram.txt')
os.execute('type "ram.txt" > freeram.txt')
loadfreeram = assert(io.input("freeram.txt"))
tostring(loadfreeram)
readfreeram = io.read("*all")
-- Now we need to read the numbers from the file that's in a variable and divide by 1024 to get the MB.
getram = tonumber(string.match(readfreeram, "%d+")) /1024
print(getram .. " MB Free RAM")
-- Close file and collect garbage.
io.input():close()
collectgarbage()
-------------------------------------------------------------------------------------------------------

-- Lets run a command to get CPU usage, time etc.
os.execute('typeperf "\processor(_total)\% processor time" -sc 25 > cpu-usage.txt')
os.execute('type "cpu-usage.txt > cpu.txt')
-- Load the file in memory to get what we need.
readcpusage = io.input("cpu.txt")
-- We don't need to do anything further so we can keep it here to add to the email below.

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

