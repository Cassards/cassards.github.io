% Return the length of a NN path for a given set of cities (cityLocation)

function nnPathLength = NNPathLengthCalculator(cityLocation)
    nCities = size(cityLocation,1);
    nnPathLength = 0;
    
    hasBeenVisited = zeros(nCities,1);

    indexStartCity = randi(nCities);
    startCity = cityLocation(indexStartCity, :);
    currentCity = startCity;
    hasBeenVisited(indexStartCity) = 1;
    
    for i = 2:nCities
        indexNN = -1;
        distanceToNN = inf;
        for j = 1:nCities % Looking for NN
            if ~hasBeenVisited(j)
                tmpCity = cityLocation(j, :);
                distanceToCity = cartesianDistance(currentCity, tmpCity);
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
    lastPath = cartesianDistance(currentCity, startCity);
    nnPathLength = nnPathLength + lastPath;
end