x=0;%first guess
f = @(x) 8*x^3 + x^2 + 8*x - 3; %given equation
ff= @(x) 24*x^2 + 2*x + 8; %derivative equation as per method 
E = 0.001; %tolerance as given
for i = 1:10 %1-10 iterations done, could increase for better accuracy
    x1 = x - (f(x)/ff(x)); %as per procedure for this method
    if abs (x1-x)<E %stop when E is reached
        break;
    end
    x=x1;
    x1
end
