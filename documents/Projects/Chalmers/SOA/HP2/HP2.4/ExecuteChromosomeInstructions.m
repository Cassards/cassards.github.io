function result = ExecuteChromosomeInstructions(chromosome, x, nbVariablesReg, constantReg, eps)
    nbInstructions = size(chromosome, 1);
    
    variableReg = zeros(nbVariablesReg, 1);
    variableReg(1) = x;
    
    for i = 1:nbInstructions
        instruction = chromosome(i,:);
        op1 = GetOperand(instruction(3), variableReg, constantReg);
        op2 = GetOperand(instruction(4), variableReg, constantReg);
        
        destId = instruction(2);
        operator = instruction(1);
        
        variableReg(destId) = applyOperator(operator, op1, op2, eps);
    end
    result = variableReg(1);
end


function operand = GetOperand(opId, variableReg, constantReg)
    nbVar = size(variableReg, 1);
    if (opId <= nbVar)
        operand = variableReg(opId);
    else
        operand = constantReg(opId-nbVar);
    end
end

function result = applyOperator(operator, op1, op2, eps)
    if (operator == 1)
        result = op1 + op2;
    elseif (operator == 2)
        result = op1 - op2;
    elseif (operator == 3)
        result = op1 * op2;
    elseif (operator == 4)
        result = op1 /(op2 + eps);
    else
        disp("ERROR : Wrong OpCode !");
        result = -inf;
    end
end