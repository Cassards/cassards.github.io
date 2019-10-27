% Carries out gradient descent until the modulus of the gradient
% drops below the threshold.
%   Takes as inputs :
%       - the starting point x0 (as a vector with two elements)
%       - the value of ?
%       - the step length (for gradient descent)
%       - a threshold T

function result = GradientDescent(startPoint, mu, stepLength, threshold)
    currentPoint = startPoint;
    gradFp = Gradient(currentPoint(1), currentPoint(2), mu);

    
    while (norm(gradFp, 2) > threshold)
        currentPoint = currentPoint - stepLength*gradFp;
        gradFp = Gradient(currentPoint(1), currentPoint(2), mu);
    end
    result = currentPoint;
end
