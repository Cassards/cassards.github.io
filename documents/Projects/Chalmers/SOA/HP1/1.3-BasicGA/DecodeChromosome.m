% Take as input :
%   - a binary chromosome
%   - the number of variables that are to be extracted
%   - the variable range.
% Return the extracted variables (as a vector)

function x = DecodeChromosome(chromosome, nVariables, variableRange)
    nGenes = size(chromosome, 2);
    bitsPerVariable = fix(nGenes/nVariables);
    
    x = zeros(1, nVariables);
    for i=1:nVariables
        for j = 1:bitsPerVariable
            x(i) = x(i) + + chromosome(j + bitsPerVariable * (i-1))*2^(-j);
        end
        x(i) = -variableRange + 2*variableRange*x(i) / (1-2^(-bitsPerVariable));
    end
end