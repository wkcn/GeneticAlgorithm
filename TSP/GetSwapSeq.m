function swapSeq = GetSwapSeq(from,to)
    city = length(to);
    seq = zeros(city,2);%temp seq
    si = 0;
    for i = 1:city
        if from(i) ~= to(i)
            for j = 1:city
                if from(j) == to(i)
                    %swap from's i and j
                    temp = from(i);
                    from(i) = from(j);
                    from(j) = temp;
                    si = si + 1;
                    seq(si,:) = [i,j];
                end
            end
        end
    end
    if si == 0
        swapSeq = [];
    else
        swapSeq = seq(1:si,:);
    end
end
        