%script
rangeVar = 1;
thetaVar = 6;
velocityVar = 10;
% targetInit = [7071; 7071; 225; 7.72];
% ownshipInit = [0; 0; 170; 2.57];
targetInit = [7071; 7071; -5.4589; -5.4589];
ownshipInit = [0; 0; -2.5310; .4463];
ownshipState = ownshipInit;
targetState = targetInit;
targetStateLog = [];
ownshipStateLog = [];
startTime = 60;
time = startTime;
finalTime = 1800;
timeStep = 60;

%Initial Measurements
bearing = atan2(targetInit(1)-ownshipInit(1),targetInit(2)-ownshipInit(2))*180/pi + (thetaVar * randn());
distance = sqrt((targetInit(1)-ownshipInit(1)+(rangeVar * randn()))^2+(targetInit(2)-ownshipInit(2)+(rangeVar * randn()))^2);
targetEst = [distance*cosd(bearing);
             distance*sind(bearing);
             0;
             0];
targetEstLog = [targetEst];
P = [0 0 0 0;
     0 0 0 0;
     0 0 velocityVar^2 0;
     0 0 0 velocityVar^2];
Q = [rangeVar^2 0;
     0 rangeVar^2];

 
 
%Simulation
for i = startTime:timeStep:finalTime
    time = i;
    
%move vehicle and target
if(time == 900)
    ownshipState(3) = 1.4371;
    ownshipState(4) = -2.1306;
end
ownshipState = [ownshipState(1) + ownshipState(3)*timeStep;
    ownshipState(2) + ownshipState(4)*timeStep;
    ownshipState(3);
    ownshipState(4)];
ownshipStateLog = [ownshipStateLog ownshipState];
targetState = [targetState(1) + targetState(3)*timeStep;
    targetState(2) + targetState(4)*timeStep;
    targetState(3);
    targetState(4)];
targetStateLog = [targetStateLog targetState];

%Measure
varry = rangeVar * randn();
distance = sqrt((targetState(1)-ownshipInit(1)+varry)^2+(targetState(2)-ownshipInit(2)+varry)^2);%Check the variance method

%Estimation


end

%Figure
plot(targetEst(1),targetEst(2),'x')
hold on
plot(targetStateLog(1,:),targetStateLog(2,:),'-b')
hold on
plot(ownshipStateLog(1,:),ownshipStateLog(2,:),'-r')
hold on
plot(ownshipInit(1),ownshipInit(2),'or', 'MarkerSize', 2)
hold on
plot(targetInit(1),targetInit(2),'ob', 'MarkerSize', 2)
legend('Target','Ownship','Target initial','Ownship initial')
%plot(ownshipStateLog(1,:),ownshipStateLog(2,:),'o')
legend('Location','northwest')
xlim([-4000 8000])
ylim([-4000 8000])
xlabel('x(in meters)','FontSize',9)
ylabel('y(in meters)','FontSize',9)
title('Target and ownship trajectories','FontSize',9)

hold on

