%Take as input :
%   - a population
%   - the best individual in the most recently evaluated generation 
%   - the number of copies (nc) of the best individual that are to be inserted (normally one or two).
% The function inserts the best individual in the nc first positions in the population
% Return the modified population.

function modifiedPopulation = InsertBestIndividual(population, bestIndividual, numberOfCopies)
    modifiedPopulation = population;
    
    for i=1:numberOfCopies
        modifiedPopulation(i, :) = bestIndividual;
    end
end