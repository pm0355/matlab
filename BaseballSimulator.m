function BaseballSimulator(v0, theta, omega, phi)
% plot y and z comp, 
%Convert initial velocity in mph to m/s
v0 = v0*0.447;
%Convert inclination angle to radians
theta = theta * pi/180;
%Convert rounds per min to radians
omega= 2*omega*pi/60;
%Convert angular velocity to radians
phi = phi*pi/180;

%Set initial conditions
x0=0;
y0=0;
z0=0;
vx0=v0*cos(theta);
vy0=0;
vz0=v0*sin(theta);
y0 = [x0 y0 z0 vx0 vy0 vz0];

%Time of flight from the mound to the plate.
T = 18.288/vx0;
[time y] = ode45(@dvdt, [0 T], y0, [], omega);


%plot elevation vs distance to home plat
plot(y(:,1)*3.281, y(:,3)*3.281 )
hold on;

%modify code to plot the sideways motion (y-component) of the ball

end


function yp = dvdt(t, y, omega)
g=-10;

xdot = y(4);
ydot = y(5);
zdot = y(6);

v = sqrt(xdot^2 + ydot^2 + zdot^2);

vxdot =    -DragForce(v) .*v .*xdot;
vydot =    -DragForce(v) .*v .*ydot;
vzdot = g  -DragForce(v) .*v .*zdot;



yp = [xdot ydot zdot vxdot vydot vzdot];
yp=yp';

end


function F = DragForce(v)
vd = 35;
delta = 5;
F = 0.0039 + 0.0058 ./ (1+exp( (v-vd/delta )));
end


