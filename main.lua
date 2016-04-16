-----------------------------------------------------------------------------
--    {ResourceKeeper}
--    Copyright (C) {2016}  {Lewis Smith}
--
--    This program is free software; you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation; either version 2 of the License, or
--    (at your option) any later version.

--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.

--    You should have received a copy of the GNU General Public License along
--    with this program; if not, write to the Free Software Foundation, Inc.,
--    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
---------------------------------------------------------------------------
-- Check for updates
local currentversion = 1
os.execute("curl https://raw.githubusercontent.com/evilexecutable/ResourceKeeper/master/version.txt > version.txt")
io.input("version.txt")
getversion = io.read("*all")
if currentverion < getversion then
	dofile("updater.lua")
else

-- Get Hostname for later use.
pcname = os.execute("hostname > host.txt")
hostname = io.input("host.txt")
tostring(hostname)
readhostname = io.read("*all")

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

os.execute('getcpu.bat')

readcpu = io.input("cpu-usage.txt")
readcpu = tostring(io.read("*line"))

cpumagic = {}
cpumagic[1] = tostring(io.read("*line"))
cpumagic[2] = tostring(io.read("*line"))
cpumagic[3] = tostring(io.read("*line"))
cpumagic[4] = tostring(io.read("*line"))
cpumagic[5] = tostring(io.read("*line"))
cpumagic[6] = tostring(io.read("*line"))
cpumagic[7] = tostring(io.read("*line"))
cpumagic[8] = tostring(io.read("*line"))
cpumagic[9] = tostring(io.read("*line"))
cpumagic[10] = tostring(io.read("*line"))
cpumagic[11] = tostring(io.read("*line"))
cpumagic[12] = tostring(io.read("*line"))
cpumagic[13] = tostring(io.read("*line"))
cpumagic[14] = tostring(io.read("*line"))
cpumagic[15] = tostring(io.read("*line"))
cpumagic[16] = tostring(io.read("*line"))
cpumagic[17] = tostring(io.read("*line"))
cpumagic[18] = tostring(io.read("*line"))
cpumagic[19] = tostring(io.read("*line"))
cpumagic[20] = tostring(io.read("*line"))
cpumagic[21] = tostring(io.read("*line"))
cpumagic[22] = tostring(io.read("*line"))
cpumagic[23] = tostring(io.read("*line"))
cpumagic[24] = tostring(io.read("*line"))
cpumagic[25] = tostring(io.read("*line"))
cpumagic[26] = tostring(io.read("*line"))

-- Check if resources are below a dangerous level, if they are, run the email script.
i = 2
while i < 26 do
	o = tonumber(string.match(cpumagic[i], ('%d*[.]%d%d%d%d%d%d')))
	print(o)
	i = i + 1
	if o > 70 
	then dofile("email.lua")
else
end
end

if getspace <= 50
	then
	dofile("email.lua")
	else
end

if getram <= 2048
	then
	dofile("email.lua")
	else
end
-------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------

