@testset "adjacency_mat" begin
    graph = random_regular_graph(10, 3)
    adj = adjacency_mat(graph)
    @test size(adj) == (10, 15)
    @test sum(adj) == 30
    for i in 1:10
        @test sum(adj[i, :]) == 3 
    end
end