
function positions = InitializePositions(nbParticules, nbVariables, xMin, xMax)
    positions = zeros(nbParticules, nbVariables);
    for i = 1:nbParticules
        for j = 1:nbVariables
            positions(i,j) = xMin(j) + rand * (xMax(j) - xMin(j));
        end
    end
end