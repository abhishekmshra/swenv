
conflict("antioch")
conflict("antioch-dbg")

local hier = hierarchyA("antioch",5)
local compiler = hier[5]
local compiler_version = hier[4]

help(
"\n"..
"This module loads the Antioch Library from Github and sets ANTIOCH_BIN ANTIOCH_LIB ANTIOCH_DIR and ANTIOCH_VERSION"..
"\n"..
"Version: "..version
)

whatis( "Name: ANTIOCH" )
whatis( "Version: "..version )

local antioch_prefix  = libs_dir.."/"..name.."/"..version.."/"..compiler.."/"..compiler_version.."/gsl/"..gsl_version

if isDir(antioch_prefix) then
else LmodError("module reports "..antioch_prefix.." is not a directory! Module not loaded.")
end


prepend_path( "PATH", pathJoin(antioch_prefix, "bin" ) )
prepend_path( "LD_LIBRARY_PATH", pathJoin(antioch_prefix, "lib" ) )

setenv( "ANTIOCH_BIN", pathJoin(antioch_prefix, "bin" ) )
setenv( "ANTIOCH_LIB", pathJoin(antioch_prefix, "lib" ) )
setenv( "ANTIOCH_DIR", antioch_prefix )
setenv( "ANTIOCH_VERSION",  version )
