function F = evaluate(X,f)
    %X is the all of population
    %f is a function
    m = size(X,1);
    F = zeros(m,1);
    for i = 1:m
        F(i) = f(X(i,:)');
    end
end
