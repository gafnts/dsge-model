%% Simulación de un shock de tasa de interés de política monetaria
clear;
readmodel;

% Periodos de simulación
startDate = 1;
endDate = 60;

% Shock en el primer periodo
p1.e_cpi_star(startDate) = 0;

% Asignación de shock al modelo
g1 = assign(g, p1);

% Solución del modelo dado un shock en i
g1 = solve(g1);
g1 = sstate(g1);
ss1 = get(g1, 'sstate');

% Base de datos con estados estacionarios del modelo
g_sim = sstatedb(g, startDate-4:endDate);
g_sim.e_cpi_star(startDate) = -1;

% Simulación del modelo con un shock en i
g1_sim = simulate(g, g_sim, startDate:endDate); 
g1_sim = dbextend(g_sim, g1_sim);

%% Gráficos de impulso-respuesta
plotrng = startDate-4:endDate;

figure;

list = {'y', 'cpi', 'cpi_ex', 'i', 'r', 'prem', 's', 's_ex', 'z', 'y_star', 'cpi_star', 'i_star'};

set(gcf, 'defaultaxesfontname', 'times', 'defaultaxesfontsize', 9);

for j = 1:length(list)
    subplot(4, 3, j);
    plot(plotrng, g1_sim.(list{j}), '.-b');
    grid on;
    title(list{j}, 'interpreter', 'none'); 
    ylabel('Variación porcentual', 'Fontsize', 9); 
    xlabel('Período de tiempo', 'Fontsize', 9);
end
