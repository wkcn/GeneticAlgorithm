function [bestVars,bestVal,avgVal,stdVal] = PSO(func,bound,m,maxGens,o,c)
    %func Function
    %bound
    %m the number of population
    %o inertance:a number
    %c accelerator coefficient:a vector [c1;c2]
    n = size(bound,2);
    X = init_population(bound,m);
    vs = init_population(bound,m); %rand init_velocity
    pBest = X;%person history best
    pBestValue = evaluate(X,func);
    fprintf('Simulation Start\n');
    
    lowerBound = repmat(bound(1,:),m,1);
    upperBound = repmat(bound(2,:),m,1);
    for gen = 1:maxGens
       %evaluate
       F = evaluate(X,func);
       change = F > pBestValue;
       pBest(change,:) = X(change,:);
       pBestValue(change) = F(change);
       [~,i] = max(F);
       gBest = X(i,:);%[1;2;3]
       %simultaneous
       vs = vs * o + c(1) * rand(m,n) .* (pBest - X) + c(2) * rand(m,n) .* (repmat(gBest,m,1) - X);
       X = X + vs;
       %solve edge
       lc = X < lowerBound;
       X(lc) = lowerBound(lc);
       uc = X > upperBound;
       X(uc) = upperBound(uc);
    end
    
    fprintf('Simulation Completed\n');
    fprintf('Best Number:\n');
    [bestFit,bestIndex] = max(evaluate(X,func));
    for i = 1:n
        fprintf('\tvar(%d) = %f\n',i,X(bestIndex,i));
    end
    fprintf('Best Fitness = %f\n',bestFit);
    % notice : bestFit is not function value!
    [bestVal,avgVal,stdVal] = report(X,func);
    bestVars = X(bestIndex)';
end