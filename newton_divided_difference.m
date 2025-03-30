function newton_divided_difference()
    % Define data points
    x = [100,150,200,250,300];
    y = [958,917,865,799,712];
    n = length(x);
    
    % Create the divided difference table
    diffTable = zeros(n, n);
    diffTable(:,1) = y';
    
    % Fill the divided difference table
    for i = 2:n
        for j = 1:n-i+1
            diffTable(j,i) = (diffTable(j,i-1) - diffTable(j+1,i-1)) / (x(j) - x(j+i-1));
        end
    end
    
    % Display the divided difference table
    fprintf('Divided Difference Table:\n');
    for i = 1:n
        for j = 1:n-i+1
            fprintf('%.8f\t', diffTable(i,j));
        end
        fprintf('\n');
    end
    
    % Value to interpolate
    value = 275;
    
    % Apply Newton's formula
    result = diffTable(1,1);
    for i = 2:n
        result = result + productTerm(i-1, value, x) * diffTable(1,i);
    end
    
    % Display result
    fprintf('\nValue at %.8f is %.8f\n', value, result);
end

% Function to compute the product term
function prod = productTerm(i, value, x)
    prod = 1;
    for j = 1:i
        prod = prod * (value - x(j));
    end
end