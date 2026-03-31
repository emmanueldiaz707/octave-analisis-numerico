% Problema de conducción de calor en una barra en estado estacionario

L = 1;          % Longitud de la barra: [0,L]
n = 10;         % Cantidad de puntos discretos
h = L / (n-1);  % Paso (distancia entre puntos)
x = [0:h:L];    % Vector de posiciones de los puntos


f = 2;          % Fuente constante de calor

% Armando sistema de ecuaciones

% Vector b
b = -2.*h^2*ones(n,1);  % sin condiciones iniciales
b(1)=0;                 % condición inicial (borde=0)
b(n)=0;                 % condición inicial (borde=0)

% Matriz A
a = zeros(n);           % matriz nula
a(1,1)=1;               % condición inicial
a(n,n)=1;               % condición inicial
v = [1 -2 1];
for i = 2:n-1
  for j = 1:3           % También puede ser  a(i,i-1:i+1) = v;
    a(i,i-2+j)=v(j);
  endfor
endfor

% Resolver sistema Au = b, donde u es la temperatura en los puntos
u = a\b; % Solución numérica

% Solución analítica
uReal = @(x) -x.^2 + x;

% Graficar solución numérica y analítica
plot(x,u,'r*',x,uReal(x),'b');
