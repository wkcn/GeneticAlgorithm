%testPSO

m = 100;% the number of population
maxGens = 500;% max generation
o = 0.5;
c = [2.0;2.0];


bound = [-3.0 4.1;
        12.1 5.8];

func = @testFunc2;

[bestVars,bestVal,avgVal,stdVal] = PSO(func,bound,m,maxGens,o,c);