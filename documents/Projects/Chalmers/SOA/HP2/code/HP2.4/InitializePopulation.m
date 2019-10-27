function population = InitializePopulation(populationSize, minChromosomeLength,...
                                      maxChromosomeLength, nbVariablesReg,...
                                      nbConstantsReg, genesPerInstruction, nbOperators)
    population = [];
    for i = 1:populationSize
     chromosomeLength = minChromosomeLength + fix(rand*(maxChromosomeLength-minChromosomeLength+1));
     
     tmpChromosome = zeros(chromosomeLength, genesPerInstruction);
     for j = 1:chromosomeLength
        operator = randi(nbOperators);
        destReg = randi(nbVariablesReg);
        op1 = randi(nbVariablesReg + nbConstantsReg);
        op2 = randi(nbVariablesReg + nbConstantsReg);
        
        tmpChromosome(j,:) = [operator, destReg, op1, op2];
     end
     
     tmpIndividual = struct('Chromosome',tmpChromosome);
     population = [population tmpIndividual];
    end
end