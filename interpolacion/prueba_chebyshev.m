% Script de prueba para nodos de Chebyshev
% Se utiliza la función original y Vandermonde
% para comparar con nodos equiespaciados

% Intervalo: 
int_a = -5;
int_b = 5;

% Puntos: 
x = [int_a:1:int_b];
y = exp(-x.^2);

% Función original:
x0 = [int_a:1/20:int_b];
y0 = exp(-x0.^2);

% Nodos de Chebyshev
xC = nodos_chebyshev_auto(x);
yC = exp(-xC.^2);

% Obtener coeficientes
a = interpolacion_vandermonde(x,y);
aC = interpolacion_vandermonde(xC,yC);

% Preparar gráfica del polinomio de Vandermonde
p = polyval(fliplr(a'),x0);
pC = polyval(fliplr(aC'),x0);

% Graficar
fig = figure(1);    % abre ventana de gráficos
clf;                % limpia gráficos anteriores
hold on;            % para aplicarle propiedades
set(fig, 'graphicssmoothing', 'on');    % Antialiasing

plot(x0, y0, 'b', 'LineWidth', 1);      % función original
plot(x0, p, '--r', 'LineWidth', 1);     % función interpolada con nodos equiespaciados
plot(x0, pC, 'm', 'LineWidth', 2);      % función interpolada con nodos Chebyshev

plot(x, y, 'r*', 'MarkerSize', 15, 'LineWidth', 0.3);           % nodos equidistantes
plot(xC, yC, 'ko', 'MarkerSize', 7, 'MarkerFaceColor', 'k');    % nodos de Chebyshev

set(gca, 'FontSize', 14);       % fuente de las etiquetas de los ejes
set(gca, 'LineWidth', 1.5);     % grosor de los ejes
grid on;
title('Método de interpolación de Vandermonde con nodos de Chebyshev', 'FontSize', 16);
xlabel('Eje X', 'FontSize', 14);
ylabel('Eje Y', 'FontSize', 14);
legend('Función original', 'Función interpolada', 'Función interpolada con nodos de Chebyshev', 'Nodos equidistantes', 'Nodos de Chebyshev', 'FontSize', 12, 'Location', 'north');

hold off;

% Asteriscos:   puntos originales
% Azul:         función original
% Rojo:         función interpolada
% Magenta:      función interpolada con nodos de Chebyshev
% Círculos:     nodos de Chebyshev
