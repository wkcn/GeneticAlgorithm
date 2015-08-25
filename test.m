%Test

m = 100;% the number of population
maxGens = 500;% max generation
Px = 0.8;%probability of crossover
Pm = 0.001;%probability of mutation

%bound = [-3.0 4.1;
%         12.1 5.8];

bound = [-3 4.1;
        12.1 5.8];

func = @testFunc2;

n = size(bound,2);%the number of feature

X = init_population(bound,m);

[lastBestVal,lastBestIndex] = max(evaluate(X,func));
lastBestX = X(lastBestIndex)';

for gen = 1:maxGens
    X = select_population(X,func);
	X = crossover(X,Px);
	X = mutate(X,bound,Pm);
	[bestVal,avgVal,stdVal] = report(X,func);
	fprintf('%d,   %f,%f,%f\n',gen,bestVal,avgVal,stdVal);
	X = elitist(X,func,lastBestVal,lastBestX);
    
    [lastBestVal,lastBestIndex] = max(evaluate(X,func));
    lastBestX = X(lastBestIndex)';
end

fprintf('Simulation Completed\n');
fprintf('Best Number:\n');
[bestFit,bestIndex] = max(evaluate(X,func));
for i = 1:n
	fprintf('\tvar(%d) = %f\n',i,X(bestIndex,i));
end
fprintf('Best Fitness = %f\n',bestFit);
% notice : bestFit is not function value!
