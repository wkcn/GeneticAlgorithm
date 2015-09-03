function swapSeq = GetRandSwapSeq(city)
    swapSeq = zeros(city,2);
    for i = 1:city
        j = ceil(rand * city);
        k = ceil(rand * city);
        while j == k
            k = ceil(rand * city);
        end
        swapSeq(i,:) = [j k];
    end
end