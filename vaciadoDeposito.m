function vaciadoDeposito(S, S0, hi)

%%%% constantes %%%%

% gravedad 
g  = 9.81; % m/s^2

% altura incial
if !exist("hi")
  hi = 1; % m
end

% radio y area de vaciado
r0 = 0.03;    % m
if !exist("S0")
  S0 = pi*r0^2; % m^2
end

% velocidad de bajada del liquido
v1 = 0.01;   % m/s


%%%% solucion %%%%

% superficie superior en funcion de la altura
if !exist("S")
  S = @(h) pi * r0^2 * sqrt(1 + 2*g*h / v1^2); % m^2
end

% ecuacion diferencial dh/dt
dhdt = @(t,h) -sqrt(2*g*h ./ (S(h).^2/S0^2 - 1));

% opciones de la ode (para dejar de integrar cuando h=0)
options = odeset('Events', @myEvents, 'RelTol', 1e-8);

% resolvemos la ecuacion diferencial
[T,H] = ode45(dhdt, [0,10000], hi, options);


%%%% graficas %%%%

% forma de la clepsidra
figure(1)
hv = linspace(0, hi, 100)'; % vector de puntos de la altura
rv = zeros(size(hv));       % radio en cada punto
for k = 1:length(hv), rv(k) = sqrt(S(hv(k))/pi); end   
plot([rv,-rv],[hv,hv],'k','linewidth',3)
xlabel('r(h) [m]')
ylabel('h [m]')
axis equal
grid

% altura en funcion del tiempo
figure(2)
plot(T, H, 'k', 'linewidth',2)
xlabel('t [s]')
ylabel('h [m]')
grid

% comprobamos la altura y el tiempo final
fprintf("hf = %6.3f m\n", H(end))
fprintf("tf = %6.3f s\n", T(end))
end

% funcion evento para la ode45
function [position,isterminal,direction] = myEvents(t,y)
position = y-eps;   % The value that we want to be zero
isterminal = 1;     % Halt integration 
direction = 0;      % The zero can be approached from either direction
end