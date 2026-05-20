% Recibe vectores x e y, devuelve vector de coeficientes a
function a = interpolacion_newton(x,y)
    n = length(x);
    x = x(:); % convertir a vector columna 
    y = y(:);
    N = zeros(n,n);

    N(:,1) = 1;

    for i=2:n
        for j=2:i
            N(i,j) = N(i,j-1) * (x(i) - x(j-1));
        endfor
    endfor
    a = N\y; % resolver sistema
endfunction