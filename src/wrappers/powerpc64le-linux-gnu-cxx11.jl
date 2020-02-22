# Autogenerated wrapper script for NOMAD_jll for powerpc64le-linux-gnu-cxx11
export libnomadEval, libnomadUtils, libnomadInterface, libsgtelib, libnomadAlgos

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libnomadEval`
const libnomadEval_splitpath = ["lib", "libnomadEval.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libnomadEval_path = ""

# libnomadEval-specific global declaration
# This will be filled out by __init__()
libnomadEval_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libnomadEval = "libnomadEval.so"


# Relative path to `libnomadUtils`
const libnomadUtils_splitpath = ["lib", "libnomadUtils.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libnomadUtils_path = ""

# libnomadUtils-specific global declaration
# This will be filled out by __init__()
libnomadUtils_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libnomadUtils = "libnomadUtils.so"


# Relative path to `libnomadInterface`
const libnomadInterface_splitpath = ["lib", "libnomadInterface.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libnomadInterface_path = ""

# libnomadInterface-specific global declaration
# This will be filled out by __init__()
libnomadInterface_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libnomadInterface = "libnomadInterface.so"


# Relative path to `libsgtelib`
const libsgtelib_splitpath = ["lib", "libsgtelib.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libsgtelib_path = ""

# libsgtelib-specific global declaration
# This will be filled out by __init__()
libsgtelib_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libsgtelib = "libsgtelib.so"


# Relative path to `libnomadAlgos`
const libnomadAlgos_splitpath = ["lib", "libnomadAlgos.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libnomadAlgos_path = ""

# libnomadAlgos-specific global declaration
# This will be filled out by __init__()
libnomadAlgos_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libnomadAlgos = "libnomadAlgos.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"NOMAD")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libnomadEval_path = normpath(joinpath(artifact_dir, libnomadEval_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libnomadEval_handle = dlopen(libnomadEval_path)
    push!(LIBPATH_list, dirname(libnomadEval_path))

    global libnomadUtils_path = normpath(joinpath(artifact_dir, libnomadUtils_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libnomadUtils_handle = dlopen(libnomadUtils_path)
    push!(LIBPATH_list, dirname(libnomadUtils_path))

    global libnomadInterface_path = normpath(joinpath(artifact_dir, libnomadInterface_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libnomadInterface_handle = dlopen(libnomadInterface_path)
    push!(LIBPATH_list, dirname(libnomadInterface_path))

    global libsgtelib_path = normpath(joinpath(artifact_dir, libsgtelib_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libsgtelib_handle = dlopen(libsgtelib_path)
    push!(LIBPATH_list, dirname(libsgtelib_path))

    global libnomadAlgos_path = normpath(joinpath(artifact_dir, libnomadAlgos_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libnomadAlgos_handle = dlopen(libnomadAlgos_path)
    push!(LIBPATH_list, dirname(libnomadAlgos_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

