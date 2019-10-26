% Returns the cartesian distance between Point1 and Point 2

function distance = CartesianDistance(point1, point2)
    distance = sqrt( (point1(1) - point2(1))^2 + ( point1(2) - point2(2) )^2 );
end