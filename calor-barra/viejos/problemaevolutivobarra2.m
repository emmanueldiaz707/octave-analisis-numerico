% Problema de conducción de calor en una barra (evolutivo)

L = 1;          % Longitud de la barra      0<x<L
T = 0.2;        % Tiempo que transcurre     0<t<T

h = 0.2;        % paso x
k = 0.02;       % paso t

% n = L/h;        % cant puntos x
n = lenght(x) - 2;
l = T/k;        % cant puntos t 

# Mallado
x = [0:h:L];  
t = [0:k:T];     

R = k/(h^2); 

% Condición inicial: u(x,0) = 4x - 4x^2
u = zeros(h,k);


% Vector b
b = 2.*k*ones(n,1);
b(1)=0;
b(n)=0;


% Matriz A
A = zeros(n);
A(1,1) = 2*R+1;
A(1,2) = -R;
A(n,n-1) = -R;
A(n,n) = 2*R+1;
v = [-R, 2*R+1, -R];
for i = 2:n-1
    A(i,i-1:i+1) = v;
endfor

x
t
R
A
b


% https://chatgpt.com/c/69fa8297-b01c-8328-8e28-6064dfb078c2
% https://gemini.google.com/u/0/app/8c1b0ad701071af7?hl=es