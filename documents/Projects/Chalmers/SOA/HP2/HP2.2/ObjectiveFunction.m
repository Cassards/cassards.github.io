function f = ObjectiveFunction(X)
    x = X(1);
    y = X(2);
    
    f = (x^2 + y -11)^2 + (x + y^2 - 7)^2;
end