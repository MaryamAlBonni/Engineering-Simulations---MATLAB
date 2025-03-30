%Define the problem
f = @(x) 8*x^3 + x^2 + 8*x - 3; %given equation
a = 0.0; %lower bound
b= 0.6; %higher bound
E = 0.001; %tolerance

iter = 0; 
if f(a)*f(b) > 0 %if both lower and higher bound are on the same side either both positive or negative, means that the root doesn't exist between these guesses
    disp('Wrong Interval')
else 
    c = (a+b) / 2; %find avg
    total = abs(b-a); 
    while total>E %to iterate until the tolerance is reached
        iter = iter+1; %increment until E is reached
        if f(a)*f(c)<0 %per procedure for the bisection method
            b = c;
        else 
            a = c;
        end
        c = (b+a)/2;
        total = abs(b-a);
        disp(c)
    end
end


