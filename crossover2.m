function X = crossover2(X,p)
	%We don't use the continuous gene crossover!
	[m,n] = size(X);
	canco = rand(m,1) < p;
    s = 1:m;
	colist = s(canco);
	%shuffle
	colist = shuffle(colist);
	
	num_pair = floor(length(colist)/2);
    
    %需要并行优化！
	for q = 1:num_pair
		i = colist(q*2-1);
		j = colist(q*2);
		%crossover i and j
		r = randperm(n);
		num_swap = floor(rand() * n);
		r_swap = r(1:num_swap);

		%swap
		temp = X(i,r_swap);
		X(i,r_swap) = X(j,r_swap);
		X(j,r_swap) = temp;

	end
end
