function X = crossover(X,p)
	%We use the continuous gene crossover!
	[m,n] = size(X);
	canco = rand(m,1) < p;
    s = 1:m;
	colist = s(canco);
	%shuffle(随机后难以达到较优？)
	colist = shuffle(colist);
	
	num_pair = floor(length(colist)/2);
    
    %需要并行优化！
	for q = 1:num_pair
		i = colist(q*2-1);
		j = colist(q*2);
		%crossover i and j
		num_swap = floor(rand() * n);

		%swap
        temp = X(i,1:num_swap);
        X(i,1:num_swap) = X(j,1:num_swap);
        X(j,1:num_swap) = temp;

	end
end
