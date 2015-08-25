function [bestVal,avgVal,stdVal] = report(X,f)
	[m,n] = size(X);
	fitness = evaluate(X,f);
	fitSum = sum(fitness);
	fitSquare = sum(fitness .* fitness);

	bestVal = max(fitness);
	avgVal = fitSum / m;
	squareSum =  avgVal * avgVal * m;
	stdVal = sqrt((fitSquare - squareSum) / (m-1));
end
