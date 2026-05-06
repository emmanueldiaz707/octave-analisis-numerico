function a = interpolacion_vandermonde(x,y)
    n = length(x);
    x = x(:); % convertir a vector columna 
    y = y(:);
    V = zeros(n,n);

    for j=1:n % armar matriz V
        V(:,j) = x.^(j-1);
    endfor

    a = V\y; % resolver sistema
endfunction