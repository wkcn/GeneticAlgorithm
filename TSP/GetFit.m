function fitness = GetFit(disMat,pos)
    city = size(disMat,1);
    m = size(pos,1);
    fitness = zeros(m,1);
    for i = 1:m
        dis = 0;
        for j = 1:city-1
            from = pos(i,j);
            to = pos(i,j+1);
            dis = dis + disMat(from,to);
        end
        from = pos(i,city);
        to = pos(i,1);
        dis = dis + disMat(from,to);
        fitness(i) = dis;
    end
end