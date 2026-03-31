L = 1;
n = 10;
h = L / (n-1);
x = [0:h:L];
f = 2;

b = -2.*h^2*ones(n,1); % sin condiciones iniciales
b(1)=0; % condición inicial (índices empiezan en 1)
b(n)=0; % condición inicial

a = zeros(n); % matriz nula
a(1,1)=1; % condición inicial
a(n,n)=1; % condición inicial

v = [1 -2 1];
for i = 2:n-1
  % a(i,i-1:i+1) = v;
  for j = 1:3
    a(i,i-2+j)=v(j);
  endfor
endfor

u = a\b; % resolver sistema

uReal = @(x) -x.^2 + x;

plot(x,u,'r*',x,uReal(x),'b');
