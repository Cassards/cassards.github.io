% Return a NN path for given cityLocation

function nnPath = NNPathCalculator(cityLocation)
    nCities = size(cityLocation,1);
    nnPathLength = 0;
    nnPath = zeros(1, nCities);
    
    hasBeenVisited = zeros(nCities,1);

    indexStartCity = randi(nCities);
    startCity = cityLocation(indexStartCity, :);
    currentCity = startCity;
    hasBeenVisited(indexStartCity) = 1;
    nnPath(1) = indexStartCity;
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
                    nnPath(i)=j;
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

    %disp("length :");
    %disp(nnPathLength);
end