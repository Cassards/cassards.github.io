% Main file

clear all;
clc;

% General parameters

populationSize = 5000;
numberOfGenerations = 500;

nbOperators = 4;
nbVariablesReg = 3;

constantReg = [1];
nbConstantsReg = size(constantReg, 2);
eps = 10^(-9);


% Length in instructions (not gene)
genesPerInstruction = 4;
minChromosomeLength = 15;                
maxChromosomeLength = 150;

crossoverProbability = 0.8;
mutationCoefficient = 5;
tournamentSelectionParameter = 0.75;
tournamentSize = 2;

numberOfBestIndToInsert = 3; 
%numberOfBestIndToInsert = 1+fix(rand*2);

% Initialization
fitness = zeros(populationSize, 1);

population = InitializePopulation(populationSize, minChromosomeLength,...
                             maxChromosomeLength, nbVariablesReg,...
                             nbConstantsReg, genesPerInstruction, nbOperators);
errorPlotX = zeros(numberOfGenerations, 1);
errorPlotY = zeros(numberOfGenerations, 1);



for iGeneration = 1:numberOfGenerations
    maximumFitness = -inf;
    
    % Updating best result
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        fitness(i) = EvaluateIndividual(chromosome, nbVariablesReg, constantReg, maxChromosomeLength, eps);
        
        if(fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestChromosome = chromosome;
            bestIndividualIndex = i;
        end
    end
    
    tempPopulation = population;
    
    % Selection
    
    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        chromosome1 = population(i1).Chromosome;
        chromosome2 = population(i2).Chromosome;
        
        r = rand;
        
        if (r < crossoverProbability)
            newChromosomePair = Cross(chromosome1, chromosome2);
            tempPopulation(i).Chromosome = newChromosomePair(1).Chromosome;
            tempPopulation(i+1).Chromosome = newChromosomePair(2).Chromosome;
        else
            tempPopulation(i).Chromosome = chromosome1;
            tempPopulation(i+1).Chromosome = chromosome2;
        end
    end
    
    % Mutation
    for i = 1:populationSize
        originalChromosome = tempPopulation(i).Chromosome;
        mutatedChromosome = Mutate(chromosome, mutationCoefficient, nbOperators, nbVariablesReg, nbConstantsReg);
        tempPopulation(i).Chromosome = mutatedChromosome;
    end
    % Decreasing mutation coefficient
    if ((mutationCoefficient > 1.1) && (mod(iGeneration, (fix(numberOfGenerations*1/50))) == 0))
        mutationCoefficient = mutationCoefficient - 0.1;
    end
    
    % Elitism
    bestIndividual = population(bestIndividualIndex);
    tempPopulation = InsertBestIndividual(tempPopulation, bestIndividual, numberOfBestIndToInsert);
    
    % Next Generation
    population = tempPopulation;
    
    fprintf("Generation %i, max fitness = %.6f, min error = %.6f\n", iGeneration, maximumFitness, 1/maximumFitness);
    errorPlotX(iGeneration) = iGeneration;
    errorPlotY(iGeneration) = 1/maximumFitness;
end

% Plot the error :
axis([1 numberOfGenerations 0 1]);
xlabel('generation');
ylabel('error');
grid on;
hold on;
plot(errorPlotX, errorPlotY);

disp('Best Chromosome :');
disp(bestChromosome);

disp('Max fitness :');
disp(maximumFitness);
disp('Min error :');
disp(1/maximumFitness);
disp('Score :');
DisplayScore(bestChromosome, nbVariablesReg, constantReg, maxChromosomeLength, eps);
disp('Corresponding function :');
if (size(bestChromosome, 1) < 30)
    DisplayChromosomeFunction(bestChromosome, constantReg, nbVariablesReg)
else
    disp("The length of this chromosome seems too long and might make the string concatenation crash...");
end
disp('--> Over !');