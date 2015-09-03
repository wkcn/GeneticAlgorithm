function disMat = GetDisMat(data)
    city = size(data,1);
    disMat = zeros(city,city);
    for i = 1:city
        for j = 1:city
            f = data(i,:);
            t = data(j,:);
            dis = sqrt(sum((f - t) .^ 2));
            disMat(i,j) = dis;
            disMat(j,i) = dis;
        end
    end
end