%Test

m = 100;% the number of population
maxGens = 500;% max generation
Px = 0.00;%probability of crossover
Pm = 1.007;%probability of mutation

bound = [-3.0 4.1;
        12.1 5.8];

    
n = size(bound,2);
GA(m,maxGens,Px,Pm,bound,@testFunc2);
return;
%for Px = 0.1:0.1:0.9
%    for Pm = 0.01:0.01:0.09

vars = zeros(100,n,10);
val = zeros(100,3,10);

parfor t = 11:1:99
    Px = floor(t/10) * 0.1;
    Pm = mod(t,10) * 0.01;
    if Pm ~= 0
        fprintf('Px = %f Pm = %f\n',Px,Pm);
        for q = 1:10
            [bestVars,bestVal,avgVal,stdVal] = GA(m,maxGens,Px,Pm,bound,@testFunc2);
            vars(t,:,q) = bestVars';
            val(t,:,q) = [bestVal avgVal stdVal]; 
        end
    end
end

save vars.mat vars
save val.mat val