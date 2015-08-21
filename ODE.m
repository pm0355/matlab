function ODE(a, b, dh, y0)

%initialize y0 for the three different ode methods
y0_Euler = y0;
y0_RK2 = y0;
y0_RK4 = y0;

index=1;
for x= a:dh:b;

%Compute the next y using one of the ode methods
y_Euler(index) = Euler(y0_Euler, x, dh);
y_RK2(index) = RK2(y0_RK2, x, dh);
y_RK4(index) = RK4(y0_RK4, x, dh);


%Update y0 for the next iteration.
y0_Euler = y_Euler(index);
y0_RK2   = y_RK2(index);
y0_RK4   = y_RK4(index);


index=index+1;
end


plot(a:dh:b, y_RK4, 'r')
hold on; xlabel('x'); ylabel('y(x)');
plot(a:dh:b, y_RK2, 'g')
plot(a:dh:b, y_Euler)

x = a:dh:b;
actual = sin(x) + y0;
plot(x, actual, '.k')
legend('Euler Method', 'Runge-Kutta 2nd order', 'Runge-Kutta 4th order', 'Analytical Solution')
end


function y = Euler(y0, x, dh)
k1 = dydx(x, y0);
y = y0 + dh.*k1;

end


% Modify the function RK2 to implement the 2nd order Runke-Kutta method 
function y = RK2(y0, x, dh)
k1 = dydx(x,y0);
k2 = dydx(x+dh,y0+k1.*dh);

y = y0 + (1/2).*dh.*(k1+k2);

end


% Modify the function RK2 to implement the 4th order Runke-Kutta method 
function y = RK4(y0, x, dh)
k1 = dydx(x,y0);
k2 = dydx(x+(1/2).*dh,y0+k1.*(1/2).*dh);
k3 = dydx(x+(1/2).*dh,y0+k2.*(1/2).*dh);
k4 = dydx(x+dh, y0+dh.*k3);

y = y0 + (1/6).*dh.*(k1+2.*k2+2.*k3+k4);

end


% Modify the function dydx for the problem assigned. 
function f = dydx(x, y)
    f = cos(x);
end

