% Problema de conducción de calor en una barra en estado estacionario

L = 1;          % Longitud de la barra: [0,L]
n = 10;         % Cantidad de puntos discretos
h = L / (n-1);  % Paso (distancia entre puntos)
x = [0:h:L];    % Vector de posiciones de los puntos


f = @(x) -sin (x);          % Fuente constante de calor

% Armando sistema de ecuaciones

% Vector b
b = zeros(n,1);
for i = 2:n-1
  b(i) = h^2 * f(x(i));
endfor
%b(2:n-1) = -f*(h^2);
b(1)=0; b(n)=0;         % Temperatura inicial de los extremos

% Matriz A
a = zeros(n,n);           % matriz nula
a(1,1)=1;  a(n,n)=1;    % condición inicial
v = [1 -2 1];
for i = 2:n-1
  a(i,i-1:i+1) = v;
endfor

% Resolver sistema Au = b, donde u es la temperatura en los puntos
u = a\b; % Solución numérica

% Solución analítica
uReal = @(x) sin(x)-sin(1)*x;

% Graficar solución numérica y analítica
plot(x,u,'r*',x,uReal(x),'b');
