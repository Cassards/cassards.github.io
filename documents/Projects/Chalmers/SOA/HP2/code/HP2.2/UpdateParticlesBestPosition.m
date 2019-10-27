function bestParticlesPositon = UpdateParticlesBestPosition(bestParticlesPositon, evaluations, positions)
    nParticules = size(evaluations, 1);
    
    for i=1:nParticules
        currentBestPosition = bestParticlesPositon(i,:);
        currentBestValue = ObjectiveFunction(currentBestPosition);
        
        if (evaluations(i) < currentBestValue)
            bestParticlesPositon(i,:) = positions(i,:);
        end
    end
end