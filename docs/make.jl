using LuxorTensorPlot
using Documenter

DocMeta.setdocmeta!(LuxorTensorPlot, :DocTestSetup, :(using LuxorTensorPlot); recursive=true)

makedocs(;
    modules=[LuxorTensorPlot],
    authors="Xuanzhao Gao <gaoxuanzhao@gmail.com> and contributors",
    sitename="LuxorTensorPlot.jl",
    format=Documenter.HTML(;
        canonical="https://ArrogantGao.github.io/LuxorTensorPlot.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ArrogantGao/LuxorTensorPlot.jl",
    devbranch="main",
)
