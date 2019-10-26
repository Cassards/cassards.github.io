eps = 10^(-9);
bestFunctionFound = @(x) ((((((x-(0/x))-(0/x))+((x-(0/x))-(0/x)))+1)/1)*(1/((x+1)+(((x-(0/x))-(0/x))*(x/1)))));

datas = LoadFunctionData;

xMin = min(datas(:,1));
xMax = max(datas(:,1));

X = linspace(xMin, xMax);
Y = zeros(size(X,1), size(X,2));

for i = 1:size(Y,2)
    Y(i) = bestFunctionFound(X(i));
end


plot(X,Y);
hold on;
plot(datas(:,1), datas(:,2));
grid on;
legend('best function found','exact function');

X = datas(:,1);
Y = datas(:,2);
yGA = zeros(size(datas,1), 1);

squareError = zeros(size(datas,1), 1);
error = zeros(size(datas,1), 1);

for i = 1:size(datas,1)
    x = X(i);
    if (x == 0)
        x = eps;
    end
    y = Y(i);
    yGA(i) = bestFunctionFound(x);
    
    error(i)=abs(y-yGA(i));
    squareError(i)=(y-yGA(i))^2;
end

disp("Error table :")
disp(table(X, Y, yGA, error, squareError));
disp("Global :");

meanError = mean(error);
rmsError = sqrt(mean(squareError));
fitness = 1/rmsError;
disp(table(meanError, rmsError, fitness));

