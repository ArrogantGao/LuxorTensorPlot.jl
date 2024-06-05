using OMEinsum, LuxorTensorPlot
using Graphs

graph = random_regular_graph(10, 3)
adj = adjacency_mat(graph)
graph_path = joinpath(@__DIR__ , "figs/simple_graph.png")
show_hypergraph(adj, filename = graph_path)

simple_ecode = ein"(ab, ica), bde, cjfdlm, eg, gfk -> ijklm"
simple_path = joinpath(@__DIR__ , "figs/simple_tensornetwork.png")
show_tensornetwork(simple_ecode, filename = simple_path)

complex_ecode = readjson(joinpath(@__DIR__ , "qc50.json")).eins
complex_path = joinpath(@__DIR__ , "figs/complex_tensornetwork.png")
show_tensornetwork(complex_ecode, filename = complex_path)