using PlasticityBase
using Documenter

DocMeta.setdocmeta!(PlasticityBase, :DocTestSetup, :(using PlasticityBase); recursive=true)

makedocs(;
    modules=[PlasticityBase],
    authors="Joby M. Anthony III",
    sitename="PlasticityBase.jl",
    format=Documenter.HTML(;
        canonical="https://jmanthony3.github.io/PlasticityBase.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jmanthony3/PlasticityBase.jl",
    devbranch="master",
)
