% This function takes the population size and the number of genes as input
% Return the entire population as a matrix of binary numbers

function population = InitializePopulation(populationSize, nGenes)
%This function generate a population of random binary chromosomes
    population = zeros(populationSize, nGenes);
    for i = 1:populationSize
            for j = 1:nGenes
                s = rand;
                if (s <0.5)
                    population(i,j)=0;
                else
                    population(i,j)=1;
                end
            end
    end
end
