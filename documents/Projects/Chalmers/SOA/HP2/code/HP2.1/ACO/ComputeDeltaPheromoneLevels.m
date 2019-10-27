


function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
    nCities = size(pathCollection, 2)-1;
    numberOfAnts = size(pathCollection, 1);
    
    deltaPheromoneLevel = zeros(nCities, nCities);
    
    for k = 1:numberOfAnts
        path = pathCollection(k,:);
        pathLength = pathLengthCollection(k);
        for index = 1:nCities
            j = path(index);
            i = path(index+1);
            deltaPheromoneLevel(i,j) = deltaPheromoneLevel(i,j) + 1/pathLength;
        end
    end
end