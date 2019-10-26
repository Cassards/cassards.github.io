% This function takes the population size and the number of genes as input
% Return the entire population as a matrix. Each line correspond to a
% chromosome, which consist of a list of intergers determining the indices
% of the cities.

function population = InitializePopulation(populationSize, nGenes)
    population = zeros(populationSize, nGenes);
    for i = 1:populationSize
        population(i,:) = randperm(nGenes);
    end
end