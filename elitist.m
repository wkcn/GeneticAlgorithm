function X = elitist(X,func,lastBestVal,lastBestX)
	f = evaluate(X,func);
	best = max(f);
	if best <= lastBestVal
		[~,i] = min(f);
		X(i,:) = lastBestX';
	end
end
