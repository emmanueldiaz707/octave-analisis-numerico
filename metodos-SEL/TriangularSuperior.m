% Resolver SEL Ax=b triangular superior (sustitución hacia atrás)

function x = TriangularSuperior(A,b)
  n = length(b); % dimensión
  x = zeros(n,1); % inicializar (para que no de error)

  % Método recursivo:

  x(n) = b(n) / A(n,n); % despejar última incógnita x_n = b_n / a_nn

  if (n>1)

    % matriz A nueva
    A2 = A(1:n-1 , 1:n-1);

    % vector b nuevo
    b2 = b(1:n-1) - A(1:n-1 , n) * x(n);

    % llamada recursiva
    x(1:n-1) = TriangularSuperior(A2,b2);

  endif

endfunction
