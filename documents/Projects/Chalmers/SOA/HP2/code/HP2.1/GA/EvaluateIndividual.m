% Take the vector of variables (x) and the matrix of cities loactaions as inputs
% Return the fitness value

function f = EvaluateIndividual(x, cityLocation)
    nCities = size(cityLocation,1);
    distance = 0;
    
    for i=1:nCities-1
        currentCity = cityLocation(x(i), :);
        nextCity = cityLocation(x(i+1), :);
        
        pathLength = CartesianDistance(currentCity, nextCity);
        
        distance = distance + pathLength;
    end
    lastCity = cityLocation(x(nCities), :);
    firstCity = cityLocation(x(1), :);
    lastTravel = CartesianDistance(lastCity, firstCity); %Back to the initial city
    distance = distance + lastTravel;
    
    f = 1/distance;
end