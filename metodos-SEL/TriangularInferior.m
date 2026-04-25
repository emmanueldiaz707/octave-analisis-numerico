% Resolver SEL Ax=b triangular inferior (sustitución hacia adelante)

function x = TriangularInferior(A,b)
  n = length(b); % dimensión
  x = zeros(n,1); % inicializar (para que no de error)

  % Método recursivo:

  x(1) = b(1) / A(1,1); % despejar primera incógnita x_1 = b_1 / a_11

  if (n>1)

    % matriz A nueva
    A2 = A(2:n , 2:n);

    % vector b nuevo
    b2 = b(2:n) - A(2:n , 1) * x(1);

    % llamada recursiva
    x(2:n) = TriangularInferior(A2,b2);

  endif

endfunction
