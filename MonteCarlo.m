iterations = 100;
rmsLog100 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

for i = 1:1:iterations
   rmsLog = MainAsFunction;
   rmsLog100 = rmsLog100 + rmsLog;
    
end
rmsLog100 = rmsLog100./iterations;
plot(rmsLog100)