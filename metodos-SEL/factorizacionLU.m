% Métodos directos para SEL: Factorización LU

function x = factorizacionLU(A,b)

  n = length(A);

  % Obtener matrices U y L
  U=A;
  L = eye(n); % matriz identidad

  for j = 1:n-1   % recorrer columnas
    for i = j+1:n  % recorrer filas
      % multiplicador
      mult = -U(i,j)/U(j,j);

      % matriz elemental
      M = eye(n);
      M(i,j) = mult;

      % matriz U
      U = M*U;

      % matriz L
      L(i,j) = - mult;
     endfor
  endfor

  % Sustitución hacia adelante
  % y = L\b;
  y = TriangularInferior(L,b);

  % Sustitución hacia atrás
  % x = U\y;
  x = TriangularSuperior(U,y);

endfunction
