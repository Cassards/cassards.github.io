% Return the vsibility matrix of a given set of cities
% For the TSP, we take visibility(i,j) = 1/distance(i,j)

function visibility = GetVisibility(cityLocation)
    nCities = size(cityLocation,1);
    visibility = zeros(nCities,nCities);
    
    for line = 1:nCities
        %As the matrix is symmetric, we only need to compute half of the values
        for column = line:nCities
            if (line == column)
                visibility(line, column) = 0;
            else
                visibility(line, column) = 1/CartesianDistance(cityLocation(line,:), cityLocation(column,:));
                visibility(column, line) = visibility(line, column);
            end
        end
    end
end