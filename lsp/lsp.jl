import Pkg
Pkg.activate(@__DIR__)  # make sure we activate this directory
Pkg.instantiate()


# Load LanguageServer from the project next to this file
## Save old load path
old_load_path = copy(LOAD_PATH)
push!(empty!(LOAD_PATH), @__DIR__)
## Load packages
using LanguageServer, SymbolServer
## Restore old load path
append!(empty!(LOAD_PATH), old_load_path)

function find_current_project()
    p = get(ENV, "JULIA_PROJECT", nothing)
    if !(isnothing(p) || isempty(p))
        @info("using JULIA_PROJECT environment variable for project path")
        return dirname(p)
    end
    p = joinpath(pwd(),"Manifest.toml")
    if isfile(p)
        @info("using current directory for project path")
        return dirname(p)
    end
    p = joinpath(pwd(),"..","Manifest.toml")
    if isfile(p)
        @info("using parent directory for project path")
        return dirname(p)
    end
    @info("using default load path for project path")
    dirname(Base.load_path_expand("@#.#"))
end

# Figure out the active project
## This configuration is a good default
project_path = find_current_project()

# Depot path for the server to index (empty uses default).
depot_path = get(ENV, "JULIA_DEPOT_PATH", expanduser("~/.julia/"))

# Start the server
@info "Running julia language server" VERSION project_path depot_path
server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
server.runlinter = true
run(server)
