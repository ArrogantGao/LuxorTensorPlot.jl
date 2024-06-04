using OMEinsum, LuxorTensorPlot, LuxorGraphPlot

simple_ecode = ein"(ab, ica), bde, cjfdlm, eg, gfk -> ijklm"
show_graph(simple_ecode)

complex_ecode = readjson(joinpath(@__DIR__ , "qc50.json")).eins
show_graph(complex_ecode)