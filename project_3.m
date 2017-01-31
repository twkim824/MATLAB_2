mg = 9.81;

tension_vector = zeros(1,51);

for ii = 20:70
    
    vert_weight_1 = 2 * mg * (cosd(ii))^2 + mg;
    
    normal_1 = vert_weight_1 / sind(ii);
    
    distance_1 = 0.1 / tand(ii/2);
    
    distance_2 = distance_1 + 0.2;
    
    distance_3 = distance_1 + 0.4;
    
    tension = (normal_1 * distance_1 + mg * sind(ii) * distance_2 + ...
              mg * sind(ii) * distance_3) / sind(90 - ii);
    
    tension_vector(ii - 19) = tension;

end

find(tension_vector == min(tension_vector)) + 19;

alpha = 20:70;

figure(1)
plot(alpha, tension_vector);

xlabel('Angle in degrees');
ylabel('Tension in Newtons');
title('How angle affects the tension in the cable');

tension_vector_2 = zeros(51);


for ii = 20:70
    
    y_counter = 0;
    
    for jj = 20:1.4:90
    
    y_counter = y_counter + 1;
        
    vert_weight_1 = 2 * mg * (cosd(ii))^2 + mg;
    
    normal_1 = vert_weight_1 / sind(ii);
    
    distance_1 = 0.1 / tand(ii/2);
    
    distance_2 = distance_1 + 0.2;
    
    distance_3 = distance_1 + 0.4;
    
    
    tension_2 = (normal_1 * distance_1 + mg * sind(ii) * distance_2 + ...
              mg * sind(ii) * distance_3) / sind(180 - ii - jj);
    
    tension_vector_2(ii - 19,y_counter) = tension_2;
    
    end
end

beta = 20:70;

figure(2)
surf(alpha,beta,tension_vector_2)
xlabel('Angle alpha');
ylabel('Angle beta');
title('How angles alpha and beta affect the tension in the cable');

