function LuxorGraphPlot.GraphViz(tng::TensorNetworkGraph, locs=Layout(:stress); kwargs...)

    black = (255, 255, 255, 0.8)
    r = (255, 0, 0, 0.8)
    g = (0, 255, 0, 0.8)

    colors = Vector{typeof(r)}()
    text = Vector{String}()
    sizes = Vector{Float64}()

    for i in 1:nv(tng.graph)
        if i in keys(tng.tensors_labels)
            push!(colors, black)
            push!(text, string(tng.tensors_labels[i]))
            push!(sizes, 20.0)
        else
            push!(colors, r)
            push!(text, string(tng.indices_labels[i]))
            push!(sizes, 10.0)
        end
    end

    for oi in tng.open_indices
        id = _get_key(tng.indices_labels, oi)
        colors[id] = g
    end

    return GraphViz(; locs=render_locs(tng.graph, locs), edges=[(src(e), dst(e)) for e in edges(tng.graph)], texts = text, vertex_colors = colors, vertex_sizes = sizes, kwargs...)
end

function _get_key(dict::Dict, value)
    for (key, val) in dict
        if val == value
            return key
        end
    end
    @error "Value not found in dictionary"
end

function LuxorGraphPlot.show_graph(tng::TensorNetworkGraph, locs=Layout(:stress); filename = nothing, kwargs...)
    gviz = GraphViz(tng, locs; kwargs...)
    return show_graph(gviz, filename = filename)
end

function show_hypergraph(adj::SparseMatrixCSC, locs=Layout(:stress); vl::Vector = [1:size(adj, 1)...], el::Vector = [1:size(adj, 2)...], oe::Vector = [], filename = nothing, kwargs...)
    lhg = LabeledHyperGraph(adj; vl=vl, el=el, oe=oe)
    tng = TensorNetworkGraph(lhg)
    return show_graph(tng, locs; filename = filename, kwargs...)
end