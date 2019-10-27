% Main file


clear all;

populationSize = 30;
numberOfGenes = 40;
crossoverProbability = 0.8;
mutationProbability = 0.025;
tournamentSelectionParameter = 0.75;
tournamentSize = 2;
variableRange = 5.0;
numberOfGenerations = 100;
fitness = zeros(populationSize, 1);

%plotting 2D
fitnessFigureHandle = figure;
hold on;
set(fitnessFigureHandle, 'position', [50,50,500,200]);
set(fitnessFigureHandle, 'DoubleBuffer', 'on');
axis([1 numberOfGenerations 0 1]);
bestPlotHandle = plot(1:numberOfGenerations, zeros(1, numberOfGenerations));
textHandle = text(30, 2.6, sprintf('best: %4.3f', 0.0));

hold off;
drawnow;

%plotting 3D
surfacefigurehandle = figure;
hold on;
set(surfacefigurehandle, 'DoubleBuffer', 'on');
delta = 0.1;
limit = fix(2*variableRange/delta) + 1;
[xValues, yValues] = meshgrid(-variableRange:delta:variableRange, -variableRange:delta:variableRange);
zValues = zeros(limit, limit);
for j = 1:limit
    for k = 1:limit
        zValues(j,k) = gFunction([xValues(j,k), yValues(j,k)]);
    end
end
surfl(xValues, yValues, zValues);
colormap gray;
shading interp;
view([-7 -9 10]);
decodedPopulation = zeros(populationSize, 2);
populationPlotHandle = plot3(decodedPopulation(:,1), decodedPopulation(:,2), fitness(:), 'kp');
hold off;
drawnow;


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
    
    
    numberOfBestIndToInsert = 1;
    %numberOfBestIndToInsert = 2;
    %numberOfBestIndToInsert = 1+fix(rand*2);

    bestIndividual = population(bestIndividualIndex, :);
    tempPopulation = InsertBestIndividual(tempPopulation, bestIndividual, numberOfBestIndToInsert);
    population = tempPopulation;
    plotvector = get(bestPlotHandle, 'YData');
    plotvector(iGeneration) = maximumFitness;
    set(bestPlotHandle, 'YData', plotvector);
    set(textHandle, 'String', sprintf('best : %4.3f', maximumFitness)); 
    set(populationPlotHandle, 'Xdata', decodedPopulation(:,1), 'Ydata', decodedPopulation(:,2), 'Zdata', fitness(:)); 
    drawnow;
end

disp('xBest');
disp(xBest);