load('vars.mat');%bestVars';
load('val.mat');%[bestVal avgVal stdVal]; 

n = 2;
fvars = zeros(100,n);
fval = zeros(100,3);
fbestVal = zeros(100,1);

for i = 1:100
    for j = 1:10
        fbestVal(i) = max(fbestVal(i),val(i,1,j));
        %fbestVal(i) = fbestVal(i) + val(i,1,j);
    end
end

%fbestVal = fbestVal / 10;

Px = 0.1:0.1:0.9;
Pm = 0.01:0.01:0.09;
[x,y] = meshgrid(Px,Pm);
z = fbestVal(GetID(x,y));
mesh(x,y,z);
hold on;
xlabel('Pc');
ylabel('Pm');
zlabel('Best Fitness');
hold off;

y = zeros(length(Pm),length(Px));
i = 1;
j = 1;
for xx = Px
    for mm = Pm
        y(i,j) = fbestVal(GetID(xx,mm));
        i=i+1;
    end
    j=j+1;
    i=1;
end

save 'rep.txt' y;

[ma,i] = max(fbestVal)
fprintf('maxvalue = %f, id = %d\n',ma,i);

return;
pc = 0.7;
v = zeros(size(Pm));
i = 0;
for pm = Pm
    i=i+1;
    id = GetID(pc,pm);
    v(i) = fbestVal(id);
end

plot(Pm,v);