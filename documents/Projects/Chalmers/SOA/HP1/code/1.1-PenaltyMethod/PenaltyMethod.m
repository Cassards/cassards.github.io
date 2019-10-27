clear all;

eta = 0.0001;
T = 10^(-6);
muValues = [1; 10; 100; 1000];
x1Values = zeros(length(muValues), 1);
x2Values = zeros(length(muValues), 1);
start = [1,2];

for i = 1:length(muValues)
    xValue = GradientDescent(start, muValues(i), eta, T);
    x1Values(i) = xValue(1);
    x2Values(i) = xValue(2);
end

table(muValues, x1Values, x2Values)
