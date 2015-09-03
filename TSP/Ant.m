%Use Ant Algorithm to solve TSP
data = load('data.txt');
%att48 = load('att48.txt');%33524
%data = att48(:,2:3);

disMat = GetDisMat(data);

city = size(data,1);

m = 200; % the number of particles
maxGen = 200; % generation
alpha = 1;  %信息素重要程度因子
beta = 3;   %启发函数重要程度因子
rho = 0.1;  %信息素挥发因子
Q = 1;      %常系数
Eta = 1 ./ disMat;  %启发函数
T = ones(city,city);    %信息素矩阵
delta = Q ./ disMat;

gBest = randperm(city);
gFit = GetFit(disMat,gBest);
gi = 0;
DrawPic(data,gBest);

tic;
for g = 1:maxGen
    fprintf('Generation:%d\n',g);
    %分布起始点
    route = zeros(m,city);  %蚂蚁路径表
    route(:,1) = ceil((rand(m,1) * city));
    for a = 1:m
        allow = 1:city;
        st = route(a,1);
        allow(st) = city;%replace
        for c = 2:city
            r = city - c + 1;%r 为剩余可选城市数
            al = allow(1:r);
            st = route(a,c - 1);%出发点
            d = (T(st,al) .^ alpha) .* (Eta(st,al) .^ beta);
            %轮盘法
            ds = cumsum(d);
            v = rand * ds(length(ds));
            for k = 1:r
                if v < ds(k)
                    break;
                end
            end
            nextCity = al(k);
            route(a,c) = nextCity;%记录蚂蚁下一步到的城市
            allow(k) = allow(r);
        end
    end
    %更新信息素
    %挥发
    T = T * (1 - rho);
    for a = 1:m
        for c = 1:city - 1
            %frome c to c + 1
            fr = route(a,c);
            to = route(a,c + 1);
            T(fr,to) = T(fr,to) + delta(fr,to);
            T(to,fr) = T(to,fr) + delta(to,fr);
        end
        fr = route(a,city);
        to = route(a,1);
        T(fr,to) = T(fr,to) + delta(fr,to);
        T(to,fr) = T(to,fr) + delta(to,fr);
    end
    %Eval
    fitness = GetFit(disMat,route);
    [gFit2,gi2] = min(fitness);
    if gFit2 < gFit
        gFit = gFit2;
        gi = gi2;
        gBest = route(gi2,:);
        DrawPic(data,gBest);
    end
    fprintf('Less Distance:%f\n',gFit);
end
toc;