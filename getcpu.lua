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
