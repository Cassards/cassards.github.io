% Take two chromosomes as input
% Carry out single-point crossover
% Return a chromosome pair

function newChromosomePair = Cross(chromosome1, chromosome2)
    sizeChromosome1 = size(chromosome1, 1);
    sizeChromosome2 = size(chromosome2, 1);
    
    
    % Generating crossover points
    crossOverPoint11 = 1+fix(rand*(sizeChromosome1-1));
    crossOverPoint12 = crossOverPoint11+1 + fix(rand*(sizeChromosome1-crossOverPoint11-1));
    crossOverPoint21 = 1+fix(rand*(sizeChromosome2-1));
    crossOverPoint22 = crossOverPoint21+1 + fix(rand*(sizeChromosome2-crossOverPoint21-1));
    
    % Builing newCromosomes
    sizeNewChromosome1 = sizeChromosome1 - (crossOverPoint12 - crossOverPoint11) + (crossOverPoint22 - crossOverPoint21);
    sizeNewChromosome2 = sizeChromosome2 - (crossOverPoint22 - crossOverPoint21) + (crossOverPoint12 - crossOverPoint11);
    
    newChromosome1 = zeros(sizeNewChromosome1, size(chromosome1, 2));
    newChromosome2 = zeros(sizeNewChromosome2, size(chromosome2, 2));
    
    j=crossOverPoint21;
    for i = 1:sizeNewChromosome1
        if (i <= crossOverPoint11)
            newChromosome1(i,:) = chromosome1(i,:);
            iStop = i;
        elseif (i <= crossOverPoint11 + (crossOverPoint22 - crossOverPoint21))
            newChromosome1(i,:) = chromosome2(j,:);
            j=j+1;
        else
            newChromosome1(i,:) = chromosome1(iStop,:);
            iStop = iStop+1;
        end
    end
    
    j=crossOverPoint11;
    for i = 1:sizeNewChromosome2
        if (i <= crossOverPoint21)
            newChromosome2(i,:) = chromosome2(i,:);
            iStop = i;
        elseif (i <= crossOverPoint21 + (crossOverPoint12 - crossOverPoint11))
            newChromosome2(i,:) = chromosome1(j,:);
            j=j+1;
        else
            newChromosome2(i,:) = chromosome2(iStop,:);
            iStop = iStop+1;
        end
    end
    newChromosomePair = [ struct('Chromosome',newChromosome1), struct('Chromosome',newChromosome2) ];
end