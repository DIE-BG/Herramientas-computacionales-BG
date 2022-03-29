using Literate

notebooks_dir = joinpath("julia", "content")

notebooks = [
    "Julia_main_differences.jl"
]

for notebook in notebooks 
    Literate.notebook(joinpath(notebooks_dir, notebook), notebooks_dir; execute=false)
end