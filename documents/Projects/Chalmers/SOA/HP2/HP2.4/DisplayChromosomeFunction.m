% Function that find the string of the function implemented by a
% chromosome.

function result = DisplayChromosomeFunction(chromosome, constantReg, nbVariablesReg)
    nbGenes = size(chromosome, 1);
    nbConstants = size(constantReg, 2);
    
    operatorsStr = ["+", "-", "*", "/" ];
    registerStr = string( zeros(1, nbConstants + nbVariablesReg) );
    
    registerStr(1) = "x";
    
    for index = 1:nbConstants
        registerStr(index + nbVariablesReg) = string(constantReg(index));
    end
    
    for i = 1:nbGenes
        numOperator = chromosome(i,1);
        numDest = chromosome(i,2);
        op1 = chromosome(i,3);
        op2 = chromosome(i,4);
        
        registerStr(numDest) = "(" + registerStr(op1)...
                                   + operatorsStr(numOperator)...
                                   + registerStr(op2)...
                             + ")";
    end
    result = registerStr(1);
end