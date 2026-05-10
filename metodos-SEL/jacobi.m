function x = jacobi(A,b,e,imax)
    % A: matriz de coeficientes
    % b: vetor de termos independentes
    % e: tolerancia
    % imax: tope de iteraciones

    x_actual = zeros(length(b),1);

    % Descomposición
    % D = diag(diag(A));
    D_inv = diag(1./diag(A));
    L = tril(A,-1);
    U = triu(A,1);    

    % Matrices auxiliares
    B = -D_inv * (L+U);
    C = D_inv * b;

    % Bucle
    i = 1;
    err = e+1;
    while ((err>e) && (i<=imax))
        x_nuevo = B * x_actual + C;
        err = norm(x_nuevo - x_actual, inf);
        x_actual = x_nuevo;
        i = i+1;
    end
    x = x_actual;

    if i > imax
        disp('Se alcanzó el límite de iteraciones!');
    end
end