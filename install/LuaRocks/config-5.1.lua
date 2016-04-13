rocks_trees = {
    { name = [[user]],
         root    = home..[[/luarocks]],
    },
    { name = [[system]],
         root    = [[d:\programs\lua\]],
    },
}
variables = {
    MSVCRT = 'm',   -- make MinGW use MSVCRT.DLL as runtime
    LUALIB = 'liblua.dll.a'
}
verbose = false   -- set to 'true' to enable verbose output
