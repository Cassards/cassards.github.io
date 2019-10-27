function weight = UpdateWeight(weight, weightReduceFactor, minWeight)
    newWeight = weight*weightReduceFactor;
    if (newWeight >= minWeight)
        weight = newWeight;
    end 
end