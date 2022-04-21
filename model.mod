%{
MODELO MACROECONÓMICO SEMI-ESTRUCTURAL 1.0

    Variables del modelo: 
    
        Variables internas:
    
        (1) y — Crecimiento económico interno
        (2) cpi — Inflación doméstica
        (3) cpi_ex — Expectativas inflacionarias
        (4) i — Tasa de interés de política monetaria
        (5) r — Tasa de interés real
        (6) prem — Prima por riesgo
        (7) s — Tipo de cambio nominal
        (8) s_ex — Expectativas cambiarias
        (9) z — Tipo de cambio real
    
        Variables externas:
    
        (10) y_star — Crecimiento económico externo
        (11) cpi_star — Inflación externa
        (12) i_star — Tasa de interés externa
%}

%% (A) Declaración de 12 variables

    !transition_variables
    y, cpi, cpi_ex, i, r, prem, s, s_ex, z, 
    y_star, cpi_star, i_star

%% (B) Declaración de choques exógenos

    !transition_shocks
    e_y, e_cpi, e_cpi_ex, e_i, e_prem, e_s, e_s_ex, e_z,
    e_y_star, e_cpi_star, e_i_star 

%% (C) Declaración de 20 parámetros y 10 estados estacionarios

    !parameters

    % Crecimiento económico interno
    A1, A2, A3, A4
    
    % Inflación doméstica y expectativas inflacionarias
    B1, B2, B3, B4, B5
    
    % Tasa de interés de política monetaria
    C1, C2, C3
    
    % Tipo de cambio nominal, prima por riesgo y tipo de cambio real
    D1, D2, D3, D4, D5
    
    % Inflación, tasa de interés y crecimiento económico externos
    Z1, Z2, Z3

    % Estados estacionarios
    y_ss, cpi_ss, i_ss, r_ss, prem_ss, s_ss, z_ss
    y_star_ss, cpi_star_ss, i_star_ss

%% (D) Declaración de 12 ecuaciones

    !transition_equations
    
    % (1) Demanda agregada: Crecimiento económico interno
    (y - y_ss) = A1*(y{-1} - y_ss) + (1 - A1)*(A2*(z{-1} - z_ss) - A3*(r{-1} - r_ss) + A4*(y_star{-1} - y_star_ss)) + e_y;
    
    % (2) Curva de Phillips: Inflación interna
    (cpi - cpi_ss) = B1*(cpi_ex - cpi_ss) + (1 - B1)*(B2*(cpi_star{-1} - cpi_star_ss) + B3*(z{-1} - z_ss) + B4*(y - y_ss)) + e_cpi;
    
    % (3) Expectativas de inflación
    (cpi_ex - cpi_ss) = B5*(cpi{-1} - cpi_ss) + (1 - B5)*(cpi{1} - cpi_ss) + e_cpi_ex;
    
    % (4) Regla de Taylor: Tasa de política monetaria
    (i - i_ss) = C1*(i{-1} - i_ss) + (1 - C1)*(C2*(cpi{4} - cpi_ss) + C3*(y - y_ss)) + e_i;
    
    % (5) Ecuación de Fischer: Tasa de interés real
    (r - r_ss) = (i - i_ss) - (cpi_ex - cpi_ss);
    
    % (6) Paridad no cubierta de tasas de interés (UIP): Expectativas cambiarias
    (i - i_ss) - (i_star - i_star_ss) = (s_ex - s_ss) - (s - s_ss) + (prem - prem_ss) + e_s_ex;
    
    % (7) Tipo de cambio nominal
    (s - s_ss) = D1*(s{-1} - s_ss) - D2*(i - i_ss) - D3*(y_star - y_star_ss) + e_s;
    
    % (8) Prima por riesgo
    (prem - prem_ss) = D4*(prem{-1} - prem_ss) + e_prem;
    
    % (9) Tipo de cambio real
    (z - z_ss) = D5*(z{-1} - z_ss) + (1 - D5)*((s - s_ss) + (cpi_star - cpi_star_ss) - (cpi - cpi_ss)) + e_z;
    
    % (10) Inflación externa
    (cpi_star - cpi_star_ss) = Z1*(cpi_star{-1} - cpi_star_ss) + e_cpi_star;
    
    % (11) Tasa de interés externa
    (i_star - i_star_ss) = Z2*(i_star{-1} - i_star_ss) + e_i_star;
    
    % (12) Crecimiento económico externo
    (y_star - y_star_ss) = Z3*(y_star{-1} - y_star_ss) + e_y_star;











