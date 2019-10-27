function bestPositionFound = UpdateBestPositionFound(evaluations, positions, bestPositionFound)
    nParticules = size(evaluations, 1);
    bestEvaluationFound = ObjectiveFunction(bestPositionFound);
    
    for i = 1:nParticules
        if (evaluations(i) < bestEvaluationFound)
            bestPositionFound = positions(i,:);
        end
    end
end