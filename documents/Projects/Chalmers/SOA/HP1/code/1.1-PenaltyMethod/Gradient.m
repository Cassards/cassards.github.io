% Returns the gradient of fp(x; ?) (a vector with two elements).
% Takes as inputs the values of x1, x2, and ?

function result = Gradient(x1, x2, mu)
    bool = (x1^2 + x2^2 -1 > 0);        %change name x)
    derivativeX1 = 2*(x1-1) + bool*4*x1*mu*(x1^2 + x2^2 -1);
    derivativeX2 = 4*(x2-2) + bool*4*x2*mu*(x1^2 + x2^2 -1);
    result = [derivativeX1, derivativeX2];
end