

function velocities = UpdateVelocities(velocities, positions, weight, bestParticlesPositon, bestPositionFound, vMax, vMin, c1, c2, deltaT)
    nbParticules = size(positions, 1);
    nbVariables = size(positions, 2);
    
    for i = 1:nbParticules
        for j = 1:nbVariables
            q = rand;
            r = rand;
            x = positions(i,j);
            xPb = bestParticlesPositon(i,j);
            xSb = bestPositionFound(j);
            
            velocities(i,j) = weight*velocities(i,j) + c1*q*((xPb-x)/deltaT) + c2*r*((xSb-x)/deltaT); %Ajouter W
            
            if (velocities(i,j) > vMax(j))
                velocities(i,j) = vMax(j);
            end
            if (velocities(i,j) < vMin(j))
                velocities(i,j) = vMin(j);
            end
            
        end
    end
end