function newV = shuffle(v)
	%shuffle a vector
	m = length(v);
	r = randperm(m);
	newV = v(r);
end
