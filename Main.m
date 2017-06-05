%script
targetInit = [7071; 7071; 225; 7.72];
ownshipInit = [0; 0; 170; 2.57];
ownshipState = ownshipInit;
targetState = targetInit;
targetStateLog = [targetState];
ownshipStateLog = [ownshipState];



%Simulation








%Figure
plot(ownshipInit(1),ownshipInit(2),'or', 'MarkerSize', 2)
hold on

plot(targetInit(1),targetInit(2),'ob', 'MarkerSize', 2)
legend('Target initial','Ownship initial')
%plot(ownshipStateLog(1,:),ownshipStateLog(2,:),'o')
legend('Location','northwest')
xlim([-4000 8000])
ylim([-4000 8000])
hold on

