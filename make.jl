using Pkg;

Pkg.add("Literate")
Pkg.add("Plots")

using Literate, Plots

PREFIX = "J_"
JMD = joinpath("../",@__DIR__, "jmd")
MD_OUTPUT = joinpath(@__DIR__, "content", "posts")

for file in readdir(MD_OUTPUT, join=false)
    println(file)
    if startswith(file, PREFIX)
        rm(joinpath(MD_OUTPUT,file), recursive=true)
    end
end


for file in readdir(JMD; join=false)
    endswith(file, ".jl") || continue
    Literate.markdown(joinpath(JMD,file), joinpath(MD_OUTPUT,PREFIX*file[1:end-2]), name="index"; execute=true,flavor = Literate.CommonMarkFlavor())
end
