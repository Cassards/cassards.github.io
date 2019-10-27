
function evaluations = EvaluatePositions(nbParticules, positions)
    evaluations = zeros(nbParticules, 1);
    for i = 1:nbParticules
    	evaluations(i) = ObjectiveFunction(positions(i,:));
    end
end