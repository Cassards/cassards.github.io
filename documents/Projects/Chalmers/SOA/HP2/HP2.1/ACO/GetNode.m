% getNode(tabuList, visibility, Pheromone, alpha, beta
% Choisir j avec proba Pij(e|S)=formule
function node = GetNode(currentNode, tabuList, pheromoneLevel, visibility, alpha, beta)
    nCities = size(tabuList,1);
    j = currentNode;
    node = -1;
    
    % Computing the denominator of P( e(ij) | S )
    denom = 0;
    for l = 1:nCities
        tau = pheromoneLevel(l,j);
        eta = visibility(l,j);
        denom = denom + (1-tabuList(l)) * tau^alpha * eta^beta;
    end
    
    % Finding next node using rouletteWheel selection
    proba = 0;
    r = rand;
    bestNumerator = -inf;                   %for special case 
    for i = 1:nCities        
        if (~tabuList(i))
            
            tau = pheromoneLevel(i,j);
            eta = visibility(i,j);
            
            if (denom == 0) % Sometimes some values are to small for matlab precision
                numerator = (tau^alpha * eta^beta);    % Then as it's a particular case, we choose the node with best numerator
                if numerator >= bestNumerator
                    bestNumerator = numerator;
                    node = i;
                end
            else
                proba = proba + (tau^alpha * eta^beta)/(denom);
            end

            if (r <= proba)
                node = i;
                break;
            end
        end
    end
end
   