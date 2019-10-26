function positions = UpdatePositions(positions, velocities, xMax, xMin, deltaT)
    nbParticules = size(positions, 1);
    nbVariables = size(positions, 2);
    for i = 1:nbParticules
        for j = 1:nbVariables
            positions(i,j) = positions(i,j) + velocities(i,j)*deltaT;
            
            if (positions(i,j) > xMax(j))
                positions(i,j) = xMax(j);
            end
            if (positions(i,j) < xMin(j))
                positions(i,j) = xMin(j);
            end
        end
    end
end