function res = testFunc2(x)
    res = 21.5 + x(1) * sin(4*pi*x(1)) + x(2) * sin(20 * pi * x(2));
    %res = sin(x(1)) + sin(x(2));
end