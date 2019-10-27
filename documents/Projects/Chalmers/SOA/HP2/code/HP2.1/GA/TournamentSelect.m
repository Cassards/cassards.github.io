% Take as input :
%   - the vector of fitness values from the most recently evaluated population
%   - the tournament selection parameter
%   - the tournament size
% Return the index of the selected individual, using tournament selection.



function indexOfIndividual = TournamentSelect(fitness, tournamentParameter, sizeTournament)
    
    populationSize = size(fitness, 1);
    iRandomIndividuals = zeros(sizeTournament, 2); %matrix of random index with their respective fitnesses
    
    % Selecting sizeTournament random individuals
    for i = 1:sizeTournament
        randomIndex = 1 + fix(rand*populationSize);
        iRandomIndividuals(i,:) = [ randomIndex, fitness(randomIndex) ];
    end
    iRandomIndividuals = sortrows(iRandomIndividuals, 2, 'descend'); %Sorting by descending fitnesses
    
    % Proceeding to tournament
    tournamentOver = false;
    tmpIndex = 1;
    while (~tournamentOver)
        r = rand;
        if (tmpIndex == sizeTournament)
            indexOfIndividual = iRandomIndividuals(tmpIndex, 1);
            tournamentOver = true;
        else
            if (r > tournamentParameter)
                tmpIndex = tmpIndex+1;
            else
                indexOfIndividual = iRandomIndividuals(tmpIndex, 1);
                tournamentOver = true;
            end
        end
    end
end



