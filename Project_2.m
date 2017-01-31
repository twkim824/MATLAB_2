% Section 23
% TaeWon Kim
% tko5521
% 2986603

momentVector = zeros(1,91);
angleVector = zeros(1,91);

for ii = 0:90
    
angleVector(ii + 1) = ii;
    
ABmag = sqrt(10.2956^2 + 17^2 - 2 * 10.2956 * 17 * cosd(60.9454 + ii));
EBmag = 17;

force = 10 * ABmag - ... 
        10*sqrt(10.2956^2 + 17^2 - 2 * 10.2956 * 17 * cosd(60.9454));

ABE = acosd((10.2956^2 - ABmag^2 - 17^2) / (-34 * ABmag));

moment = 17 * force * sind(ABE);

momentVector(ii + 1) = moment;

ABmag * sind(ABE);

end

plot(angleVector, momentVector);
xlabel('Angle');
ylabel('Moment about elbow');
title('How angle affects the moment');