% Problema de conducción de calor en una barra (evolutivo)

L = 1;          % Longitud de la barra      0<x<L
T = 0.2;         % Tiempo que transcurre     0<t<T

h = 0.2;        % paso x
k = 0.02;       % paso t

n = L/h;        % cant puntos x
l = T/k;        % cant puntos t 

x = [0:h:L];  
t = [0:k:T];     

R = k/(h^2); 

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



