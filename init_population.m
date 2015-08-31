function X = init_population(bound,m)
    %m is the number of population
    %n is the number of feature
    %bound is a 2 x n matrix
    %return X,X is the all of population
    n = size(bound,2);
    %X = zeros(m,n);
    delta = bound(2,:) - bound(1,:);
    %for i = 1:m
    %    X(i,:) = rand(1,n) .* delta + bound(1,:);
    %end
    X = rand(m,n) .* repmat(delta,m,1) + repmat(bound(1,:),m,1);
end
    
    