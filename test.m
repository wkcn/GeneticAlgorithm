%Test

m = 100;% the number of population
maxGens = 500;% max generation
Px = 0.7;%probability of crossover
Pm = 0.007;%probability of mutation

bound = [-3.0 4.1;
        12.1 5.8];

GA(m,maxGens,Px,Pm,bound,@testFunc2);
