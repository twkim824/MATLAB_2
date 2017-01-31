
% Section: 23
% Design Project 1
% TaeWon Kim
% ID: tko5521


% Initialization
AB_tension_table = [];           
AC_tension_table = [];
AD_tension_table = [];

AB_mag_table = [];
                    
cost_table = []; % magnitude x tension

% AB = [x,4,z];                 
AC = [-3,4,-2];
AD = [-2,4,3];



xcounter = 0;

for x = 0:0.05:5
    
    xcounter = xcounter + 1;
    zcounter = 0;
    
    for z = 0:-0.05:-5
        
        zcounter = zcounter + 1;
        
        AB = [x,4,z];
        AB_mag = norm(AB); % AB magnitude to be used later when
                                 % calculating cost
         
                                 
      % AB_mag_table records the AB magnitude for each coordinate.  
        AB_mag_table(xcounter,zcounter) = AB_mag;
        
        eAB = AB / norm(AB); % unit vector of AB
        
        eAC = AC / norm(AC); % unit vector of AC
        
        eAD = AD / norm(AD); % unit vector of AD
        
        A = [eAB(1),eAC(1),eAD(1);
             eAB(2),eAC(2),eAD(2);
             eAB(3),eAC(3),eAD(3)];
        
        b = [0;981;0];
        
        tension = A\b;
        
        AB_tension_table(xcounter,zcounter) = tension(1);
        AC_tension_table(xcounter,zcounter) = tension(2);
        AD_tension_table(xcounter,zcounter) = tension(3);
        
        cost_table(xcounter,zcounter) = tension(1) .* AB_mag;
        
    end
end

optimal = min(min(cost_table));

% Finding the coordinate at which cost is minimised:

optimal_x = (find(min(cost_table') == min(min(cost_table'))) - 1) * 0.05;

optimal_z = -(find(min(cost_table) == min(min(cost_table))) - 1) * 0.05;

fprintf('Minimum cost: %.2f\nOptimal X location: %.2f\nOptimal Z location: %.2f\n', optimal, optimal_x, optimal_z)

x = 0:0.05:5;
z = 0:-0.05:-5;

figure(1);
surf(x,z,AB_tension_table);
xlabel('x coordinate');
ylabel('z coordinate');
zlabel('Tension in AB');
title('How different x,z-coordinates affect tension in AB');

figure(2);
surf(x,z,AC_tension_table);
xlabel('x coordinate');
ylabel('z coordinate');
zlabel('Tension in AC');
title('How different x,z-coordinates affect tension in AC');

figure(3);
surf(x,z,AD_tension_table);
xlabel('x coordinate');
ylabel('z coordinate');
zlabel('Tension in AD');
title('How different x,z-coordinates affect tension in AD');

figure(4);
surf(x,z,cost_table);
xlabel('x coordinate');
ylabel('z coordinate');
zlabel('Cost');
title('How different x,z-coordinates affect cost');













