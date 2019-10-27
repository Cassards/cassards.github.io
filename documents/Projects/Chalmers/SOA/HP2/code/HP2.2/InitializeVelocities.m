

function velocities = InitializeVelocities(nbParticules, nbVariables, alpha, deltaT, xMin, xMax)
    velocities = zeros(nbParticules, nbVariables);
    for i = 1:nbParticules
        for j = 1:nbVariables
            velocities(i,j) = ( alpha / deltaT )*( - (xMax(j) - xMin(j))/2 + rand * (xMax(j) - xMin(j)) );
        end
    end
end