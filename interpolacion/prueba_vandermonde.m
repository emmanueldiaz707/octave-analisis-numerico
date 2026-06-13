% Script de prueba para interpolación de Vandermonde 
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
a = interpolacion_vandermonde(x,y);

% Preparar gráfica del polinomio de Vandermonde
p = polyval(fliplr(a'),x0);

% Graficar
% plot(x,y,'*',x0,y0,'b',x0,p,'r');
fig = figure(1);  % abre ventana de gráficos
hold on;    % para aplicarle propiedades
set(fig, 'graphicssmoothing', 'on'); % Antialiasing
plot(x, y, '*', 'MarkerSize', 20, 'Color', [0.1 0.1 0.1]); % puntos originales
plot(x0, y0, 'b', 'LineWidth', 2); % función original
plot(x0, p, 'r', 'LineWidth', 2); % función interpolada
set(gca, 'FontSize', 14);
set(gca, 'LineWidth', 1.5);
grid on;
title('Método de interpolación de Vandermonde', 'FontSize', 16);
xlabel('Eje X', 'FontSize', 14);
ylabel('Eje Y', 'FontSize', 14);
legend('Puntos originales', 'Función original', 'Función interpolada', 'FontSize', 12, 'Location', 'north');

% Asteriscos:   puntos originales
% Azul:         función original
% Rojo:         función interpolada
