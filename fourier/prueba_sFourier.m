% Script de prueba para serie de Fourier
paso = 1/11;
nmax = 5;
f = @(x) x.^3;

x = [-pi:paso:pi];
valores_n = [1:1:nmax];
tiempo_pausa = 0.5;

% Graficar:
clf; 
hold on;

plot(x,f(x),'k--', 'LineWidth', 3.5);

leyendas = {'Función original f(x)'};

for n=1:nmax-1
   pause(tiempo_pausa);
   S = sFourier(f,x,n); 
   plot(x,S,'--','LineWidth',(n^1.5)/nmax);
   leyendas{n+1} = ['n = ' num2str(n)];
endfor
S = sFourier(f,x,nmax);
pause(tiempo_pausa);
plot(x,S,'r','LineWidth',(2));
leyendas{nmax+1} = ['n = ' num2str(nmax)];

xlabel('Eje X');
ylabel('Eje Y');
set(gca, 'FontSize', 12);
title('Aproximación de Fourier', 'FontSize', 14);
legend(leyendas, 'Location', 'southeast', 'FontSize', 11);
grid on;

hold off;
