%Mandelbrot.m

%This program computes and plots the Mandelbrot set, using a simple minded
%and incredibly slow procedure
clear;
im = complex(0.0,1.0);
z0 = complex(0,0);
MaxIteration = 30;

%Image to be computed in the region -1.8 <x <.9,
%                                   -1.0 < y <1.0
xMin = -1.8;
xMax = .9
yMin = -1;
yMax = 1;
axis([xMin xMax yMin yMax])

dx = (xMax -xMin)/200;
dy = (yMax - yMin)/160;
fprintf('Please Wait...\n');

%Cycle over all the pixels on the screen to be included in the plot. Each
%pixel represents a particular cmplex number, c. Then determine, for this
%particular c, if |z| -> inf as the iteration proceeds.

hold on
for x = xMin:dx:xMax
    for y = yMin:dy:yMax
        c = x +im*y;
        z= z0;
        counter = 0;
        while(abs(z)< 2.0 & counter <= MaxIteration)
            if(counter <= MaxIteration)
                z = z*z +c;
                counter = counter +1;
            end
        end
        %If |z| is still < 2 , and if counter = MaxIteration, call the
        %point "c" a member of the Mandelbrot set and plot it 
        if(counter >= MaxIteration)
            plot(x,y,'k.')
        end
    end
end
