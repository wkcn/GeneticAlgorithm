function newX = select_population(X,f)
    %X is the all of population
    %f is a function
    %use roulette

    [m,n] = size(X);
    newX = zeros(m,n);

    fitness = evaluate(X,f); %fitness is a vector
    sumFits = sum(fitness);
    gradSum = cumsum(fitness);
    
    for i = 1:m
        p = rand() * sumFits;
        k = 1;

        for k = 1:m
			if p < gradSum(k)
				break;
			end
		end

        newX(i,:) = X(k,:);
	end

end
