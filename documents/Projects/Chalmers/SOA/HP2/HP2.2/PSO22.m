clear all;
clc;

nbParticules = 20;
nbVariables = 2;
nbIterations = 200;

alpha = 1;
deltaT = 1;
c1 = 2;
c2 = 2;

xMin = [-5, -5];
xMax = [5, 5];

% init w
weight = 1.4;
weightReduceFactor = 0.99;
minWeight = 0.3;

vMax = (xMax-xMin)/deltaT;
vMin = -vMax; 
bestPositionFound = xMin;
bestParticlesPositon = xMin .* ones(nbParticules, nbVariables);

% Initialization
disp('============== Initialization : ==============');
positions = InitializePositions(nbParticules, nbVariables, xMin, xMax);
velocities = InitializeVelocities(nbParticules, nbVariables, alpha, deltaT, xMin, xMax);
disp('-> OK');
disp('================ Processing : ================');
for i = 1:nbIterations
    % plot swarm
    hold off;
    PlotContour(xMin, xMax);
    scatter( positions(:,1), positions(:,2), 'filled', 'red');
    drawnow;
    hold on;
    
    % Evaluation
    evaluations = EvaluatePositions(nbParticules, positions);

    % Updating best results
    bestParticlesPositon = UpdateParticlesBestPosition(bestParticlesPositon, evaluations, positions);
    bestPositionFound = UpdateBestPositionFound(evaluations, positions, bestPositionFound);
    
    % Update velocities & positions
    velocities = UpdateVelocities(velocities, positions, weight, bestParticlesPositon, bestPositionFound, vMax, vMin, c1, c2, deltaT);
    weight = UpdateWeight(weight, weightReduceFactor, minWeight);
    positions = UpdatePositions(positions, velocities, xMax, xMin, deltaT);
end
disp('-> OK');

disp('============= Computation Over : =============');
fprintf(' Found local minima in : (%.6f, %.6f) \n', bestPositionFound(1), bestPositionFound(2));
fprintf(' Value : %.6f\n', ObjectiveFunction(bestPositionFound) );
ObjectiveFunction(bestPositionFound)
