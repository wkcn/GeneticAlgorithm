function res = testFunc2(x)
    res = 21.5 + x(1) * sin(4*pi*x(1)) + x(2) * sin(20 * pi * x(2));
    %res = sin(x(1)*5) + sin(x(2)*5);
    %res = 100 * (x(1)^2 - x(2))^2 + (1-x(2))^2;
    %res = -(x(1)-2)^2+10;
    %res = 1 / (sum(x.*x) + 1);
end