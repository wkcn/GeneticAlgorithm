%Use Ant Algorithm to solve TSP
data = load('data.txt');
%att48 = load('att48.txt');%33524
%data = att48(:,2:3);

disMat = GetDisMat(data);

city = size(data,1);

m = 200; % the number of particles
maxGen = 200; % generation
alpha = 1;  %��Ϣ����Ҫ�̶�����
beta = 3;   %����������Ҫ�̶�����
rho = 0.1;  %��Ϣ�ػӷ�����
Q = 1;      %��ϵ��
Eta = 1 ./ disMat;  %��������
T = ones(city,city);    %��Ϣ�ؾ���
delta = Q ./ disMat;

gBest = randperm(city);
gFit = GetFit(disMat,gBest);
gi = 0;
DrawPic(data,gBest);

tic;
for g = 1:maxGen
    fprintf('Generation:%d\n',g);
    %�ֲ���ʼ��
    route = zeros(m,city);  %����·����
    route(:,1) = ceil((rand(m,1) * city));
    for a = 1:m
        allow = 1:city;
        st = route(a,1);
        allow(st) = city;%replace
        for c = 2:city
            r = city - c + 1;%r Ϊʣ���ѡ������
            al = allow(1:r);
            st = route(a,c - 1);%������
            d = (T(st,al) .^ alpha) .* (Eta(st,al) .^ beta);
            %���̷�
            ds = cumsum(d);
            v = rand * ds(length(ds));
            for k = 1:r
                if v < ds(k)
                    break;
                end
            end
            nextCity = al(k);
            route(a,c) = nextCity;%��¼������һ�����ĳ���
            allow(k) = allow(r);
        end
    end
    %������Ϣ��
    %�ӷ�
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