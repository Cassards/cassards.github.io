function gravityForce = ComputeFg(alpha, masse, g)
    gravityForce = masse*g*sin(alpha);
    % warning, sin expects angles in radian, use sind for angle in degree
end