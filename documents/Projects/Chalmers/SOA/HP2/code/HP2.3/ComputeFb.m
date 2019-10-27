function breakingForce = ComputeFb(tb, tMax, masse, g, pedalPressure)
    breakingForce = pedalPressure*(masse*g)/20;
    if ~(tb < tMax-100)
        breakingForce = breakingForce * exp( -( tb-(tMax-100) ) /100 )
    end 
end