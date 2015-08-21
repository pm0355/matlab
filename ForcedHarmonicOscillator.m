function ForcedHarmonicOscillator()

xspan = 0:pi/100:pi/2;
y0(1) = 0; 
y0(2) = 0;

[x y] = ode45(@dzdx, xspan, y0);


%You must modify the 'answer' variable so that your
%analytic solution matches the numerical solution
answer =  ((-1+i.*sqrt(3))/2).*exp(x.*((-1/2)+i.*(sqrt(3))/2))+(-(1+i.*sqrt(3))/2).*exp(x.*((-1/2)-i.*(sqrt(3))/2))+exp(x);
plot(x, y(:,1));
hold on; 
plot(x, answer, 'ro')
legend('numerical solution', 'analytical solution')
end

function zp = dzdx(x, z)

zp(1) = z(2);
zp(2) = -zp(1)-z(1) +3.*exp(x);

zp=zp';
end

%Modify the forcing function to give the solution to problem
function f = forcing(x)
f=0;
end
