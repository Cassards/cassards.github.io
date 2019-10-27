function pathLength = GetPathLength(path,cityLocation)
    pathLength = 0;
    
    for i = 1:size(path, 2)-1
        currentCity = cityLocation(path(i),:);
        nextCity = cityLocation(path(i+1),:);
        
        pathLength = pathLength + CartesianDistance(currentCity, nextCity);
    end
end