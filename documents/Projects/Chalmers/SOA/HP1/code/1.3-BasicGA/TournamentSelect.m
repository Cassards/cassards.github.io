% Take as input :
%   - the vector of fitness values from the most recently evaluated population
%   - the tournament selection parameter
%   - the tournament size
% Return the index of the selected individual, using tournament selection.



function indexOfIndividual = TournamentSelect(fitness, tournamentParameter, sizeTournament)
    
    populationSize = size(fitness, 1);
    iRandomIndividuals = [];
    
    % Selecting sizeTournament random individuals
    for i = 1:sizeTournament
        randomIndex = 1 + fix(rand*populationSize);
        iRandomIndividuals = InsertOnRightPosition(fitness, iRandomIndividuals, randomIndex);
    end
    
    % Proceeding to tournament
    tournamentOver = false;
    tmpIndex = 1;
    while (~tournamentOver)
        r = rand;
        if (tmpIndex == sizeTournament)
            indexOfIndividual = tmpIndex;
            tournamentOver = true;
        else
            if (r > tournamentParameter)
                tmpIndex = tmpIndex+1;
            else
                indexOfIndividual = tmpIndex;
                tournamentOver = true;
            end
        end
    end
end


% Horrible Linear Sorting function (sorting by descending fitness)
function iRandomIndividuals = InsertOnRightPosition(fitness, indexRandomIndividuals, indexToInsert)
    currentIndex = 1;
    fitnessOfIndToInsert = fitness(indexToInsert);
    
    if (length(indexRandomIndividuals) > 1)
        while currentIndex < length(indexRandomIndividuals)
            nextIndex = currentIndex + 1;
            nextFitness = fitness(indexRandomIndividuals(nextIndex));

            if (nextFitness < fitnessOfIndToInsert)
                break;
            end
            currentIndex = currentIndex + 1;
        end
        iRandomIndividuals = [indexRandomIndividuals(1:currentIndex),indexToInsert,indexRandomIndividuals(currentIndex+1:end)];
        
    elseif (length(indexRandomIndividuals) == 1)
         fitnessOfElt = fitness(indexRandomIndividuals(1));
         if (fitnessOfElt < fitnessOfIndToInsert)
             iRandomIndividuals = [ indexToInsert indexRandomIndividuals ];
         else 
             iRandomIndividuals = [ indexRandomIndividuals indexToInsert ];
         end
    elseif (length(indexRandomIndividuals) == 0)
        iRandomIndividuals = [ indexToInsert ];
    end
end





