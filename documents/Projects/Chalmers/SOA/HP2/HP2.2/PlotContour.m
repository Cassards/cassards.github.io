function PlotContour(xMin, xMax)
    %Plot objective function
    x = linspace(xMin(1), xMax(1));
    y = linspace(xMin(2), xMax(2));

    nbOfPoints = size(x,2);
    z = zeros(nbOfPoints,nbOfPoints);

    for i = 1:nbOfPoints
        for j = 1:nbOfPoints
            z(i,j) = log(0.01 + ObjectiveFunction([x(j), y(i)]) );
        end
    end
    contour(x,y,z);
    grid('on');
    title('log(0.01 + f(x,y))');
    xlabel('x');
    ylabel('y');
    hold on;
end