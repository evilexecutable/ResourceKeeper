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

local Mailgun = require("mailgun").Mailgun

local m = Mailgun({
  domain = "",
  api_key = ""
})

m:send_email({
  from = "",
  to = "",
  cc = "",
  subject = "Server Report for ".. readhostname,
  html = false,
  body = [[Server Report ]] .."\n".. [[
  		Ram:]] .. getram .. [[ MB Free]] .. "\n" .. [[
  		HDD:]] .. getspace .. [[ GB Free]] .. "\n\n\n\n" .. [[
      CPU Usage:]] .. o .. [[ %]]
      [[
  ]]
})
