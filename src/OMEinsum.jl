using OMEinsum
using OMEinsum: flatten, getixsv, getiyv

function ein2hypergraph(ec::AbstractEinsum)
    fec = flatten(ec)
    ixs = getixsv(fec)
    iy = getiyv(fec)

    edges = unique!([Iterators.flatten(ixs)...])
    open_edges = [iy[i] for i in 1:length(iy) if iy[i] in edges]

    rows = Int[]
    cols = Int[]
    for (i,ix) in enumerate(ixs)
        push!(rows, map(x->i, ix)...)
        push!(cols, map(x->findfirst(==(x), edges), ix)...)
    end
    adj = sparse(rows, cols, ones(Int, length(rows)))

    return LabeledHyperGraph(adj, el = edges, oe = open_edges)
end

function show_hypergraph(ec::AbstractEinsum; locs=Layout(:stress), filename = nothing, kwargs...)
    tng = TensorNetworkGraph(ein2hypergraph(ec))
    gviz = GraphViz(tng, locs; kwargs...)
    return show_graph(gviz, filename = filename)
end