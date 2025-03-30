function main
    % Example data points (x values and corresponding y values)
    vec = [100,150,200,250]; % x-values
    y_values = [958,917,865,799]; % Corresponding y-values
    polynomial = Lagrangee(vec, y_values); % Call the Lagrange interpolation function
    y_at_130 = double(subs(polynomial, 130)); % Evaluate the polynomial at x = 130
    fprintf('The value of the polynomial at x = 130 is: %.4f\n', y_at_130);
end
function p = Lagrangee(vec, y_values)
    n = length(vec);
    Lx = 0; % Initialize polynomial
    for i = 1:n
        numerator = 1; % Initialize numerator for Lagrange polynomial
        for j = 1:n
            if i == j
                continue % Skip the current index
            end
            % Create the numerator polynomial
            numerator = conv(numerator, [1, -vec(j)]);
        end
        % Calculate the differences for the denominator
        dif = vec(i) - vec;
        dif(i) = []; % Remove current index
        y = y_values(i); % Get the corresponding y value
        Lx = Lx + y * numerator / prod(dif); % Update the polynomial
    end
    % Lx is a vector of the polynomial coefficients
    p = poly2sym(Lx); % Convert to symbolic polynomial
end

% Run the main function
main;