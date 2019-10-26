% Return a mutated chromosome

function mutatedChromosome = Mutate(chromosome, mutationCoefficient, nbOperators, nbVariablesReg, nbConstantsReg)
    nGenes = size(chromosome, 1);
    mutatedChromosome = chromosome;
    
    for j = 1:nGenes
        r = rand;
        if (r < mutationCoefficient/nGenes)
            indexMutation = randi(size(chromosome, 2));
            if (indexMutation == 1)
                mutatedChromosome(j, indexMutation) = randi(nbOperators);
            elseif (indexMutation == 2)
                mutatedChromosome(j, indexMutation) = randi(nbVariablesReg);
            else
                mutatedChromosome(j, indexMutation) = randi(nbVariablesReg + nbConstantsReg);
            end
        end
    end
end