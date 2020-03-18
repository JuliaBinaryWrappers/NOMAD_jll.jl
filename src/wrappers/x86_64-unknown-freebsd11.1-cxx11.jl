# Autogenerated wrapper script for NOMAD_jll for x86_64-unknown-freebsd11.1-cxx11
export libnomadUtils, libnomadInterface, libsgtelib, libnomadAlgos, nomad, libnomadEval

using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

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


# Relative path to `nomad`
const nomad_splitpath = ["bin", "nomad"]

# This will be filled out by __init__() for all products, as it must be done at runtime
nomad_path = ""

# nomad-specific global declaration
function nomad(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(nomad_path)
    end
end


# Relative path to `libnomadEval`
const libnomadEval_splitpath = ["lib", "libnomadEval.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libnomadEval_path = ""

# libnomadEval-specific global declaration
# This will be filled out by __init__()
libnomadEval_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libnomadEval = "libnomadEval.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"NOMAD")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (CompilerSupportLibraries_jll.LIBPATH_list,))

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

    global nomad_path = normpath(joinpath(artifact_dir, nomad_splitpath...))

    push!(PATH_list, dirname(nomad_path))
    global libnomadEval_path = normpath(joinpath(artifact_dir, libnomadEval_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libnomadEval_handle = dlopen(libnomadEval_path)
    push!(LIBPATH_list, dirname(libnomadEval_path))

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

