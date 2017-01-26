
prereq( "petsc" )
prereq( "hdf5" )
prereq( "vtk-dbg" )
prereq( "boost-dbg" )
prereq( "openblas" )

conflict("libmesh")
conflict ("libmesh-dbg")

local hier = hierarchyA("libmesh", 6)

local compiler = hier[6]
local compiler_version = hier[5]

local mpi_implementation = hier[4]
local mpi_version = hier[3]

help(
"This module loads libMesh "..version.." master branch, compiled with "..compiler.." "..compiler_version.." and "..mpi_implementation.." "..mpi_version
)

local libmesh_arch = name.."/"..version.."/"..compiler.."/"..compiler_version.."/"..mpi_implementation.."/"..mpi_version.."/petsc/"..petsc_version.."/"..blas_implementation.."/"..blas_version.."/boost-dbg/"..boost_version.."/hdf5/"..hdf5_version.."/vtk-dbg/"..vtk_version

local libmesh_dir = pathJoin( libs_dir, libmesh_arch )

if isDir(libmesh_dir) then
else LmodError("module reports "..libmesh_dir.." is not a directory! Module not loaded.")
end

setenv( "LIBMESH_DIR", libmesh_dir )
setenv( "LIBMESH_VERSION", version )

prepend_path( "PATH", pathJoin( libmesh_dir, "bin" ) )
prepend_path( "LD_LIBRARY_PATH",  pathJoin( libmesh_dir.."lib" ) )
