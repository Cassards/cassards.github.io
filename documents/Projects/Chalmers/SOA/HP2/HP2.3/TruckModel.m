function nextSpeed = TruckModel(currentSpeed, deltaT, masse, alphaSlope, g,...
                        tb, tMax, pedalPressure, ...
                        cb, numGear)

    % Computing Forces applied on truck
    gravityForce = ComputeFg(alphaSlope, masse, g);
    breakingForce = ComputeFb(tb, tMax, masse, g, pedalPressure);
    engineBreakForce =  ComputeFeb(cb, numGear);
    
    % Computing acceleration
    acceleration = (gravityForce -breakingForce - engineBreakForce)/masseTruck;
    
    % Finding speed at t + deltaT
    nextSpeed = currentSpeed + acceleration * deltaT;

end