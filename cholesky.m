function x = cholesky(A) %defines the function named cholesky that takes matrix A as an input
[m,n] = size(A); % Determine the size of A
% Input checks
if m ~= n
error('Error: A is not a square matrix'); %ensure A is a square matrix; number of coloumns = number of rows
end
b = [sum(A(1,:)); sum(A(2,:)); sum(A(3,:))]; %construct vector b by summing the elements of each row of A
U = chol(A); %performs cholesky decomposition of matrix A, returning an upper triangle matrix U 
disp('U = '); disp(U) 
d = U'\b; %uses forward sub
x = U\d; %
disp('x = '); disp(x) %prints x
