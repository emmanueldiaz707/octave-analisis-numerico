% Script de prueba para interpolación de Newton 
% Se lo compara con la función original

% Intervalo: 
int_a = -5;
int_b = 5;

% Puntos: 
x = [int_a:1:int_b];
y = exp(-x.^2);

% Función original:
x0 = [int_a:1/20:int_b];
y0 = exp(-x0.^2);

% Obtener coeficientes
c = interpolacion_newton(x, y);

% Preparar gráfica del polinomio de Newton
p = evaluar_newton(c,x,x0);

% Graficar
% plot(x,y,'*',x0,y0,'b',x0,p,'r');
fig = figure(1);    % abre ventana de gráficos
clf;                % limpia gráficos anteriores
hold on;            % para aplicarle propiedades
set(fig, 'graphicssmoothing', 'on');    % Antialiasing

plot(x0, y0, 'b', 'LineWidth', 2);                      % función original
plot(x0, p, 'r', 'LineWidth', 2);                       % función interpolada
plot(x, y, 'k*', 'MarkerSize', 20, 'LineWidth', 0.5);   % nodos equidistantes

set(gca, 'FontSize', 14);       % fuente de las etiquetas de los ejes
set(gca, 'LineWidth', 1.5);     % grosor de los ejes
grid on;
title('Método de interpolación de Newton', 'FontSize', 16);
xlabel('Eje X', 'FontSize', 14);
ylabel('Eje Y', 'FontSize', 14);
legend('Función original', 'Función interpolada', 'Nodos equidistantes', 'FontSize', 12, 'Location', 'north');

hold off;

% Asteriscos:   puntos originales
% Azul:         función original
% Rojo:         función interpolada
