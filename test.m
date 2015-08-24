%Test

m = 100;% the number of population
maxGens = 500;% max generation

bound = [-3.0 4.1;
         12.1 5.8];

func = @testFunc;
     
X = init_population(bound,m);

%F = evaluate(X,func);

%keep the best
%[bestFit,bestIndex] = max(F);

for gen = 1:maxGens
    X = select(X,func);