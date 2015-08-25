function X = mutate(X,bound,p)
	%Every gene has the same pobability to mutate
	[m,n] = size(X);
	delta = bound(2,:) - bound(1,:);
	for i = 1:n
		for j = 1:m
			%feature i,example j
			if rand() < p
				X(j,i) = rand() * delta(i) + bound(1,i);
			end
		end
	end
end
