function fitness = EvaluateIndividual(chromosome, nbVariablesReg, constantReg, maxChromosomeLength, eps)
    dataPoints = LoadFunctionData();
    nbOfPoints = size(dataPoints, 1);
    chromosomeLength = size(chromosome, 1);
    
    sumSquareError = 0;
    
    for i = 1:nbOfPoints
        x = dataPoints(i,1);
        y = dataPoints(i,2);
        
        result = ExecuteChromosomeInstructions(chromosome, x, nbVariablesReg, constantReg, eps);
        sumSquareError = sumSquareError + (result - y)^2;
    end
    
    error = sqrt((1/nbOfPoints) * sumSquareError);
    
    % multiplicative penalty factor for chromosomes which are too long
    if (chromosomeLength > maxChromosomeLength)
        error = error * (chromosomeLength/maxChromosomeLength);
    end
    fitness = 1/(error + eps);
end