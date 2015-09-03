function pos = GetNewPos(pos,swapSeq)
    si = size(swapSeq,1);
    for i = 1:si
        j = swapSeq(i,1);
        k = swapSeq(i,2);
        temp = pos(j);
        pos(j) = pos(k);
        pos(k) = temp;
    end
end