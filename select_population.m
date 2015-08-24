function newX = select_population(X,f)
    %X is the all of population
    %f is a function
    %use roulette
    F = evaluate(X,f);
    sumF = sum(F);
    gradSum = zeros(m,1);
    
    [m,n] = size(X);
    newX = zeros(m,n);
    
    parfor i = 1:m
        r = rand() * sumF;
        k = 0;
        while(
        newX(i,:) = 
    end
end