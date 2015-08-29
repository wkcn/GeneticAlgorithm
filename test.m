%Test

m = 100;% the number of population
maxGens = 500;% max generation
Px = 0.7;%probability of crossover
Pm = 0.07;%probability of mutation

bound = [-3.0 4.1;
        12.1 5.8];

    
n = size(bound,2);


s = zeros(10,1);

for i = 1:10
    [~,bv,~,~,genRecord] = GA(m,maxGens,Px,Pm,bound,@testFunc2);
    s(i) = bv;
end

fprintf('best val:%f\n',mean(s));

gen = 1:maxGens;
plot(gen,genRecord);
xlabel('generation');
ylabel('best fitness');

return;

%以下为大规模并行计算

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
            [bestVars,bestVal,avgVal,stdVal,~] = GA(m,maxGens,Px,Pm,bound,@testFunc2);
            vars(t,:,q) = bestVars';
            val(t,:,q) = [bestVal avgVal stdVal]; 
        end
    end
end

save vars.mat vars
save val.mat val