using PlasticityBase
using Documenter

DocMeta.setdocmeta!(PlasticityBase, :DocTestSetup, :(using PlasticityBase); recursive=true)

makedocs(;
    modules=[PlasticityBase],
    authors="Joby M. Anthony III",
    sitename="PlasticityBase.jl",
    doctest=false,
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://jmanthony3.github.io/PlasticityBase.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jmanthony3/PlasticityBase.jl",
    devbranch="main",
)
