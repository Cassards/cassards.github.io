% Take as input a chromosome and a mutation probability
% Return a mutated chromosome

function mutatedChromosome = Mutate(chromosome, nCities, mutationProbability)
    nGenes = size(chromosome, 2);
    mutatedChromosome = chromosome;
    
    for j = 1:nGenes
        r = rand;
        if (r < mutationProbability)
            randomIndex = randi(nCities, 1, 2);
            tmp = mutatedChromosome(randomIndex(1));
            mutatedChromosome(randomIndex(1)) = mutatedChromosome(randomIndex(2));
            mutatedChromosome(randomIndex(2)) = tmp;
        end
    end
end