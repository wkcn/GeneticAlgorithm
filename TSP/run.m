%Use PSO to Solve TSP
%we mark the first place as No.1
%In this problem,the LESS fitness is the better!
%data = load('data.txt');
%croa = load('croa100].txt');
%data = croa(:,2:3);

att48 = load('att48.txt');%33524
data = att48(:,2:3);

disMat = GetDisMat(data);

city = size(data,1);

m = 500; % the number of particles
maxGen = 5000; % generation
w = 0.5;
c1 = 1;
c2 = 1;

pos = zeros(m,city);

%use greed init

greed = 0;

for i = 1:m-greed
    pos(i,:) = randperm(city);
end

for i = m-greed+1:m
    pos(i,:) = GetGreedSeq(disMat,mod(i,city) + 1);
end

fitness = GetFit(disMat,pos);

%speed
v = cell(m,1);
for i = 1:m
    v{i} = GetRandSwapSeq(city);
end

[gFit,gi] = min(fitness);
pFit = fitness;
pBest = pos;%global best place
gBest = pos(gi,:);%person best place4

fprintf('Start Emulation\n');

if w > 1
    w = 1;
end

DrawPic(data,pos(gi,:));

tic;
for g = 1:maxGen
    fprintf('Generation:%d\n',g);
    for i = 1:m
        if i == gi
            %continue;
        end
        %update v
        pv = v{i};
        len = size(pv,1);
        newLen = ceil(len * w);
        
        pos(i,:) = GetNewPos(pos(i,:),pv(1:newLen,:));
        
        pv2 = GetSwapSeq(pos(i,:),pBest(i,:));
        len2 = size(pv2,1);
        newLen2 = ceil(len2 * c1 * rand);
        if newLen2 > len2
            newLen2 = len2;
        end
        
        pos(i,:) = GetNewPos(pos(i,:),pv2(1:newLen2,:));
        
        pv3 = GetSwapSeq(pos(i,:),gBest);
        len3 = size(pv3,1);
        newLen3 = ceil(len3 * c2 * rand);
        if newLen3 > len3
            newLen3 = len3;
        end
        
        pos(i,:) = GetNewPos(pos(i,:),pv3(1:newLen3,:));
        
        v{i} = [pv(1:newLen,:);pv2(1:newLen2,:);pv3(1:newLen3,:)];
        
        %update Position
        %pos(i,:) = GetNewPos(pos(i,:),v{i});
    end
    
    %update pBest
    newFit = GetFit(disMat,pos);
    pb = newFit < fitness;
    pBest(pb,:) = pos(pb,:);
    fitness(pb) = newFit(pb);
    
    fprintf('improve:%d\n',sum(pb));
    fprintf('bad:%d\n',sum(newFit > fitness));
    
    %update gBest
    [gFit2,gi2] = min(fitness);
    if gFit2 < gFit
        gBest = pos(gi2,:);
        gi = gi2;
        gFit = gFit2;
        DrawPic(data,pos(gi,:));
    end
    
    %DrawPic(data,pos(gi,:));
    
    fprintf('Less Distance:%f\n',gFit);
end
toc;

save 'result.mat' gBest gFit