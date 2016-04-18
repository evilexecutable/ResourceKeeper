xcopy install\Lua C:\Lua /s /y
xcopy install\OpenSSL-Win32 C:\OpenSSL-Win32 /s /y
xcopy install\LuaRocks "C:\Program Files (x86)\LuaRocks" /s /y
xcopy install\appdata\LuaRocks %localappdata%\LuaRocks /s /y
mkdir %appdata%\LuaRocks

setx LUA_PATH "C:\Program Files (x86)\LuaRocks\lua\?.lua;C:\Program Files (x86)\LuaRocks\lua\?\init.lua;C:\Users\gelada.CUBO\AppData\Roaming\LuaRocks\share\lua\5.1\?.lua;C:\Users\gelada.CUBO\AppData\Roaming\LuaRocks\share\lua\5.1\?\init.lua;C:\Lua\share\lua\5.1\?.lua;C:\Lua\share\lua\5.1\?\init.lua"
setx LUA_CPATH "C:\Users\gelada.CUBO\AppData\Roaming\LuaRocks\lib\lua\5.1\?.dll;C:\Lua\lib\lua\5.1\?.dll"
set PATH=%PATH%;C:\Lua\bin;C:\Lua;C:\Program Files (x86)\7-Zip;C:\MinGW\bin;C:\Program File\Git\bin;C:\Program Files\Git\cmd;C:\Program Files (x86)\Luarocks

pause
