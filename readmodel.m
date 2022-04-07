clear;
setparam;

% Carga del modelo
g = model('model.mod', 'linear', true);

% Asignación de parámetros
g = assign(g, p);

% Solución del modelo
g = solve(g);
g = sstate(g);

ss = get(g, 'sstate');
