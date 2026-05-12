function [u,x,t] = calorEvolutivoBarra(L,T,N,M,alpha,beta,f,g)
  % Este método utiliza la derivada hacia adelante
  % L:      longitud de la barra
  % T:      tiempo máximo
  % N:      particiones x
  % M:      particiones t
  % alpha:  temperatura en x=0
  % beta:   temperatura en x=L
  % f:      función fuente
  % g:      condición inicial

  % Ejemplos de uso:
  % calorEvolutivoBarra(1, 0.2,  5,  10, 0, 0, @(x) 2, @(x) 4*x - 4*x.^2);
  % calorEvolutivoBarra(1, 0.2, 20, 200, 0, 0, @(x) 2, @(x) 4*x - 4*x.^2); 
  
  % Discretización
  h = L/N;
  k = T/M;
  x = [0:h:L];
  t = [0:k:T];
  r = k/(h^2);

  % Vector inicial
  if isscalar(g(x)) % validar si g es función o constante
    u_actual = g * ones(N-1,1);
  else
    u_actual =  g(x(2:N))';
  endif;

  % Matriz A 
  A = zeros(N-1);
  v = [r, 1-2*r, r];
  for i = 2:N-2
    A(i,i-1:i+1) = v;
  endfor
  A(1,1:2) = v(2:3);
  A(N-1,N-2:N-1) = v(1:2);
 
  % Vector b
  if isscalar(f(x)) % validar tamaño de f
    b = k * f(x) * ones(1,N-1); % f constante 
  else
    b = k * f(x(2:N)); % f función
  endif
  b(1) = b(1) + r*alpha;
  b(N-1) = b(N-1) + r*beta; % b(end) = beta;
  b = b(:); % Asegurarse que b sea vector columna

  u = zeros(M+1,N+1); % filas=tiempo, columnas=espacio
  u(:,1) = alpha;
  u(:,N+1) = beta;

  u(1, 2:N) = u_actual';
  
  for j = 1:M
    u_siguiente = A*u_actual + b;
    u(j+1 , 2:N) = u_siguiente';
    u_actual = u_siguiente;
  endfor

  % Gráfico
  surf(x, t, u); 
  xlabel('Posición x'); 
  ylabel('Tiempo t'); 
  zlabel('Temperatura u');
end