function x = nodos_chebyshev(a,b,n)
    % intervalo [a,b]
    % n: cantidad de nodos

    l = 1:n; % índices
    x = ((a+b)/2)+((b-a)/2)*cos(((2*l-1)/(2*n))*pi);

    x = fliplr(x); % invertir orden del vector
endfunction
