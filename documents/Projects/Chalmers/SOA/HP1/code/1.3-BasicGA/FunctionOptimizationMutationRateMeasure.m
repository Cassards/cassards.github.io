% Script used to measure impact of mutation rate on results
clear all;


mutationProbability = 0.05;

populationSize = 100;
numberOfGenes = 50;
crossoverProbability = 0.8;
tournamentSelectionParameter = 0.75;
tournamentSize = 2;
variableRange = 5.0;
numberOfGenerations = 100;

fitnessResults = zeros(100, 1);

for loop=1:100
    

fitness = zeros(populationSize, 1);
decodedPopulation = zeros(populationSize, 2);
population = InitializePopulation(populationSize, numberOfGenes);

for iGeneration = 1:numberOfGenerations
    
    maximumFitness = 0.0;
    xBest = zeros(1,2);
    bestIndividualIndex = 0;
    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome, 2, variableRange);
        decodedPopulation(i,:) = x; %for plotting
        fitness(i) = EvaluateIndividual(x);
        if(fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividualIndex = i;
            xBest = x;
        end
    end
    
    tempPopulation = population;

    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);
        
        r = rand;
        
        if (r < crossoverProbability)
            newChromosomePair = Cross(chromosome1, chromosome2);
            tempPopulation(i,:) = newChromosomePair(1,:);
            tempPopulation(i+1,:) = newChromosomePair(2,:);
        else
            tempPopulation(i,:) = chromosome1;
            tempPopulation(i+1,:) = chromosome2;
        end
    end

    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome, mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    
    numberOfBestIndToBeInserted = 1;

    bestIndividual = population(bestIndividualIndex, :);
    tempPopulation = InsertBestIndividual(tempPopulation, bestIndividual, numberOfBestIndToBeInserted);
    population = tempPopulation;
end

fitnessResults(loop) = maximumFitness;
end

fitnessResults = sort(fitnessResults);
medianFitness = fitnessResults(50)