function a = interpolacion_v_grafico(x,y)
    a = interpolacion_vandermonde(x,y);

    % Hecho con Gemini: 
    x_curva = linspace(min(x), max(x), 100);
    y_curva = polyval(flipud(a), x_curva);
    figure; % Abre una ventana nueva
    plot(x_curva, y_curva, 'b-', 'LineWidth', 2); % Grafica la curva azul
    hold on;
    plot(x, y, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Grafica los puntos rojos

    % Toques finales de ingeniería (prolijidad)
    grid on;
    xlabel('Eje X');
    ylabel('Eje Y');
    title('Interpolación Polinómica');
    legend('Polinomio ajustado', 'Puntos originales');
    hold off;
endfunction