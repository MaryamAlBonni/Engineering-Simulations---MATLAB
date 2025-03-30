x0=0;%first guess
x1 = 0.6;%second guess
f = @(x) 8*x^3 + x^2 + 8*x - 3; %given equation
E = 0.001; %tolerance as given
for i = 1:10 %iterate for 10 times incremented
    x2 = x1 - f(x1) * ((x1-x0)/(f(x1)-f(x0))) %per procedure of the secant method
    if abs(x2-x1)<E %when the difference between the bounds are less than the tolerance given, continue with the logic of the if statement and end the process
        break;
    end
    x0 = x1;
    x1 = x2;
end
disp(x2)


