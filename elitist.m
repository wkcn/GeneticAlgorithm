function [X,best,lastBestX] = elitist(X,func,lastBestVal,lastBestX)
	f = evaluate(X,func);
	[best,ind] = max(f);
	if best <= lastBestVal
		[~,i] = min(f);
		X(i,:) = lastBestX';
        best = lastBestVal;
    else
        lastBestX = X(ind,:)';%update the best
	end
end
