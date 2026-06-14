function p = evaluar_newton(c, x, x0)
    % (Generado por IA)
    % Evalúa el polinomio de Newton en un conjunto de puntos x0
    % c: coeficientes
    % x: nodos equidistantes
    % x0: puntos donde evaluar (para graficar)
    
    n = length(x);
    p = c(1) * ones(size(x0)); % Inicializa el polinomio con el valor c_1
    termino_acumulado = ones(size(x0));
    
    for j = 2:n
        % Va construyendo la productoria: (x0 - x_1)(x0 - x_2)...
        termino_acumulado = termino_acumulado .* (x0 - x(j-1));
        % Suma el término actual multiplicado por su coeficiente c_j
        p = p + c(j) * termino_acumulado;
    endfor
endfunction