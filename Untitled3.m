tspan = 0:1:7200;
pch4 = 0.45 * 101325;   % Partial pressure of CH4 (Pa)
par = pch4;             % Assuming partial pressure of CH4 for simplicity
pna = 0.1 * 101325;     % Partial pressure of N2 (Pa)
N = 6.023E17;           % Avogadro's number
v0 = 0.001;             % Initial volume (m^3)
T0 = 973;               % Initial temperature (K)

y1 = pch4 * v0 / (8.314 * T0);   % Initial moles of CH4
y5 = pna * v0 / (8.314 * T0);    % Initial moles of N2
yar = par * v0 / (8.314 * T0);   % Initial moles of Ar
n0 = y1 + y5 + yar;             % Total initial moles

s = [y1, 0, 0, 0, y5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
[T, Y] = ode15s(@rates, tspan, s);
plot(T,Y(:,1),'-')
g='CH\(_4\) Moles vs Time';

title(g,'interpreter','latex');
xlabel('time');
ylabel('Mol');