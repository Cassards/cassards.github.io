% Dispay various informations about a given chromosome (error, rms error,
% values, etc...).

function DisplayScore(chromosome, nbVariablesReg, constantReg, maxChromosomeLength, eps)
    dataPoints = LoadFunctionData();
    nbOfPoints = size(dataPoints, 1);
    chromosomeLength = size(chromosome, 1);
    
    chromosomeResults = zeros(nbOfPoints, 5);
    
    sumSquareError = 0;
    
    for i = 1:nbOfPoints
        x = dataPoints(i,1);
        y = dataPoints(i,2);
        
        result = ExecuteChromosomeInstructions(chromosome, x, nbVariablesReg, constantReg, eps);
        chromosomeResults(i,:) = [x, y, result, abs(result - y), (result - y)^2];
        
        sumSquareError = sumSquareError + (result - y)^2;
    end
    
    error = sqrt((1/nbOfPoints) * sumSquareError);
    
    % multiplicative penalty factor for chromosomes who are too long
    if (chromosomeLength > maxChromosomeLength)
        error = error * (chromosomeLength/maxChromosomeLength);
    end
    fitness = 1/(error + eps);
    
    % displaying datas
    xValues = chromosomeResults(:,1);
    yValues = chromosomeResults(:,2);
    yValuesGA = chromosomeResults(:,3);
    simpleError = chromosomeResults(:,4);
    SquareError = chromosomeResults(:,5);
    
    table(xValues, yValues, yValuesGA, simpleError, SquareError)
    
    averagedSimpleError = mean(simpleError);
    table(fitness, error, averagedSimpleError)
end