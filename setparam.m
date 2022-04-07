%% Parámetros
    
    % (1) Demanda agregada: Crecimiento económico interno
    p.A1 = .5;
    p.A2 = .05;
    p.A3 = .1;
    p.A4 = .85;
    
    % (2) Curva de Phillips: Inflación interna
    p.B1 = .1;
    p.B2 = .6;
    p.B3 = .01;
    p.B4 = .4;
    
    % (3) Expectativas de inflación
    p.B5 = .25;
    
    % (4) Regla de Taylor: Tasa de política monetaria
    p.C1 = .9;
    p.C2 = 1.5;
    p.C3 = .5;
    
    % (7) Tipo de cambio nominal
    p.D1 = .1;
    p.D2 = .05;
    p.D3 = .25;
    
    % (8) Prima por riesgo
    p.D4 = .8;
    
    % (9) Tipo de cambio real
    p.D5 = .1;
    
    % (10) Inflación externa
    p.Z1 = .75;
    
    % (11) Tasa de interés externa
    p.Z2 = .75;
    
    % (12) Crecimiento económico externo
    p.Z3 = .75;

%% Estados estacionarios

    p.y_ss = 3.5;
    p.cpi_ss = 4;
    p.i_ss = 3;
    p.r_ss = -1;
    p.prem_ss = 2; 
    p.s_ss = 0;
    p.z_ss = -2;
    p.y_star_ss = 2.5; 
    p.cpi_star_ss = 2;
    p.i_star_ss = 1;

save parameters.mat p

