@echo off
"D:\Programs\Lua\bin\lua.exe" -e "package.path=\"C:\\Users\\Admin\\AppData\\Roaming/luarocks/share/lua/5.1/?.lua;C:\\Users\\Admin\\AppData\\Roaming/luarocks/share/lua/5.1/?/init.lua;d:\\programs\\lua\\/share/lua/5.1/?.lua;d:\\programs\\lua\\/share/lua/5.1/?/init.lua;C:\\Program Files (x86)\\LuaRocks\\lua\\?.lua;\"..package.path; package.cpath=\"C:\\Users\\Admin\\AppData\\Roaming/luarocks/lib/lua/5.1/?.dll;d:\\programs\\lua\\/lib/lua/5.1/?.dll;\"..package.cpath" -e "local k,l,_=pcall(require,\"luarocks.loader\") _=k and l.add_context(\"lua-cjson\",\"2.1.0-1\")" "d:\programs\lua\\lib\luarocks\rocks\lua-cjson\2.1.0-1\bin\json2lua" %*
exit /b %ERRORLEVEL%
