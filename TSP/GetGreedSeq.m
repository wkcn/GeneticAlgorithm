function seq = GetGreedSeq(disMat,sti)
    city = size(disMat,1);
    seq = zeros(100,1);
    seq(1) = sti;
    for i = 2:city
        la = seq(i-1);
        [best,bi] = max(disMat(la,:));
        for j = 1:city
           can = 1;
           for k = 1:i-1
               if seq(k) == j
                   can = 0;
                   break;
               end
           end
           if can == 0
               continue;
           end
           if disMat(la,j) < best
               best = disMat(la,j);
               bi = j;
           end
        end
        seq(i) = bi;
    end
end