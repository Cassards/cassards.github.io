% return the path for one ant

function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)

    nCities = size(visibility, 1);
    
    tabuList = zeros(nCities,1);
    path = zeros(1,nCities+1);
    startNode = randi(nCities);
    
    tabuList(startNode) = 1;
    path(1) = startNode;
    path(nCities+1) = startNode;
    
    for i = 2:nCities
        path(i) = GetNode(path(i-1), tabuList, pheromoneLevel, visibility, alpha, beta);
        tabuList(path(i)) = 1;
    end
end