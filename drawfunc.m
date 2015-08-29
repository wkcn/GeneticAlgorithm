x = -3:0.01:12.1;
y = 4.1:0.01:5.8;

[xx,yy] = meshgrid(x,y);

z = 21.5 + xx .* sin(4*pi*xx) + yy .* sin(20*pi*yy);
mesh(xx,yy,z);
xlabel('x_{1}');
ylabel('x_{2}');
zlabel('f(x_{1},x_{2}) = 21.5 + x_{1}sin(4*pi*x_{1}) + x_{2}sin(20*pi*x_{2})');
