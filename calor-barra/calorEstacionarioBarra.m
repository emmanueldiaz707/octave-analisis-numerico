function [u,x] = calorEstacionarioBarra(L,N,alpha,beta,f)
  % L:     longitud de la barra
  % N:     cantidad de particiones
  % alpha: temperatura en x=0
  % beta:  temperatura en x=L
  % f:     función fuente
  
  % Ejemplo de uso:
  % [temp,pos] = calorEstacionarioBarra(1,20,0,0,@(x) 2);
  % plot(pos,temp); ó plot(pos,temp,'r*');
  
  % Discretización
  h = L/N;
  x = [0:h:L];
  
  % Vector b
  if isscalar(f(x)) % validar tamaño de f
    b = -h^2 * f(x) * ones(1,N+1); % f constante 
  else
    b = -h^2 * f(x); % f función
  endif
  b(1) = alpha;
  b(N+1) = beta; % b(end) = beta;
  b = b(:); % Asegurarse que b sea vector columna
  
  % Matriz A
  A = zeros(N+1);
  aux = [1 -2 1];
  for i=2:N
    A(i, i-1:i+1) = aux;
  endfor
  A(1,1) = 1;
  A(N+1, N+1) = 1; 
  
  % Resolver sistema
  u = A\b;
end