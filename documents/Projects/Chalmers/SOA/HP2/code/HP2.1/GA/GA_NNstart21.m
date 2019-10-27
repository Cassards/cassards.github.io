% Improved Version Of the GA.
% population is initialized with NN path

clear all;
clc;

% Parameters
populationSize = 2000;
numberOfGenerations = 100;

cityLocation = LoadCityLocations;
nCities = size(cityLocation,1);

mutationProbability = 1/nCities;
tournamentSelectionParameter = 0.75;
tournamentSize = populationSize;
numberOfBestIndToInsert = 1+fix(rand*2);

% Initialization
disp("===== Initialization: =====");

fitness = zeros(populationSize, 1);
tspFigure = InitializeTspPlot(cityLocation,[0 20 0 20]); 
connection = InitializeConnections(cityLocation); 
     
population = InitializePopulationNN(populationSize, nCities, cityLocation);
disp("-> OK !");

disp("======= Running GA: =======");
for iGeneration = 1:numberOfGenerations
%    disp(iGeneration);
    
    maximumFitness = 0.0;
    xBest = zeros(1,2);
    bestIndividualIndex = 1;
    for i = 1:populationSize
        x = population(i,:);
        fitness(i) = EvaluateIndividual(x, cityLocation);
        if(fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            xBest = x;
            bestIndividualIndex = i;
            
            %displaying new path
            refresh(tspFigure);
            PlotPath(connection,cityLocation,x);
        end
    end
    tempPopulation = population;

    for i = 1:populationSize
        ind = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        chromosome = population(ind,:);
        tempPopulation(i,:) = chromosome;
    end

    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome, nCities, mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end

    bestIndividual = population(bestIndividualIndex, :);
    tempPopulation = InsertBestIndividual(tempPopulation, bestIndividual, numberOfBestIndToInsert);
    population = tempPopulation;
end
disp("-> OK !");

disp("======== Results: ========");

disp('Max fitness :');
disp(maximumFitness);

disp('Min distance :');
disp(1/maximumFitness);

disp('Min Path :');
for i= 1:size(xBest, 2)
    fprintf("%i->", xBest(i));
end
fprintf("%i\n", xBest(1));

disp('Over !');