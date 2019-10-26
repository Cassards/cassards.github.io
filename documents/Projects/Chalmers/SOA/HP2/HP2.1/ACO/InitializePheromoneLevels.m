% Initialize pheromone level
% Takes as inputs the nb of cities and tau0


function pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0)
    pheromoneLevel = tau0*ones(numberOfCities, numberOfCities);
end
