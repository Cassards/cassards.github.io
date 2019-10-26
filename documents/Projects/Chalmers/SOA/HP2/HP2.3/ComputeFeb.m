function engineBreakForce =  ComputeFeb(cb, numGear)
    gearCoeff = [7.0, 5.0, 4.0, 3.0, 2.5, 2.0, 1.6, 1.4, 1.2, 1]; % Hardcoding of the eq (5) coeffs
    engineBreakForce = gearCoeff(numGear) * cb;
end