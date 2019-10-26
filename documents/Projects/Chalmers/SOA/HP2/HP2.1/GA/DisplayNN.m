%Generate and plot a NN path

cityLocation = LoadCityLocations;
nCities = size(cityLocation,1);
path = NNPathCalculator(cityLocation);
disp("start city :");
disp(path(1));

tspFigure = InitializeTspPlot(cityLocation,[0 20 0 20]); 
connection = InitializeConnections(cityLocation); 
PlotPath(connection,cityLocation,path);    