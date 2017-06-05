%script
targetInit = [7071; 7071; 225; 7.72];
ownshipInit = [0; 0; 170; 2.57];
ownshipState = ownshipInit;
targetState = targetInit;
targetStateLog = [];
ownshipStateLog = [];
startTime = 60;
time = startTime;
finalTime = 1800;
timeStep = 60;

%Simulation
for i = startTime:timeStep:finalTime
    time = i;
%move vehicle
if(time == 900)
    ownshipState(3) = -56;
end
ownshipState = [ownshipState(1) + ownshipState(4)*60*cosd(ownshipState(3));
    ownshipState(2) + ownshipState(4)*60*sind(ownshipState(3));
    ownshipState(3);
    ownshipState(4)];
ownshipStateLog = [ownshipStateLog ownshipState];




end

%Figure
plot(ownshipStateLog(1,:),ownshipStateLog(2,:),'-r')
hold on
plot(ownshipInit(1),ownshipInit(2),'or', 'MarkerSize', 2)
hold on
plot(targetInit(1),targetInit(2),'ob', 'MarkerSize', 2)
legend('Ownship','Target initial','Ownship initial')
%plot(ownshipStateLog(1,:),ownshipStateLog(2,:),'o')
legend('Location','northwest')
xlim([-4000 8000])
ylim([-4000 8000])
hold on

