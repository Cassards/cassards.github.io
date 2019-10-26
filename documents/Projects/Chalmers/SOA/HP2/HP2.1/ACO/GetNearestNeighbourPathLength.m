% Compute le nearest neighbour path length for a given cities' locations
% vector

function nnPathLength = GetNearestNeighbourPathLength(cityLocation)
    nCities = size(cityLocation,1);
    nnPathLength = 0;
    
    hasBeenVisited = zeros(nCities,1);

    startCity = cityLocation(1, :);
    currentCity = startCity;
    hasBeenVisited(1) = 1;
    
    for i = 2:nCities
        indexNN = -1;
        distanceToNN = inf;
        for j = 1:nCities % Looking for NN
            if ~hasBeenVisited(j)
                tmpCity = cityLocation(j, :);
                distanceToCity = CartesianDistance(currentCity, tmpCity);
                if distanceToCity < distanceToNN
                    distanceToNN = distanceToCity;
                    indexNN = j;
                end
            end    
        end
        nnPathLength = nnPathLength + distanceToNN;
        hasBeenVisited(indexNN) = 1;
        currentCity = cityLocation(indexNN, :);
    end
    % Back to start point
    lastPath = CartesianDistance(currentCity, startCity);
    nnPathLength = nnPathLength + lastPath;
end