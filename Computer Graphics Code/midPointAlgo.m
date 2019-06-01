
function midpointAlgo()
%midpPointLine(5, 8, 9, 21);
midpPointLine(5, 8, -9, -11);
end

function midpPointLine(x0, y0, x1, y1)

%% checking for which octant
oct = whichOctant(x0, y0, x1, y1);

%% Necessary modifications for octant 2 and 6

if (oct == 2)
    [x0, y0] = swap(x0, y0);
    [x1, y1] = swap(x1, y1);
    
elseif (oct == 6)
    x1 = -x1;
    y1 = -y1;
    x0 = -x0;
    y0 = -y0;
    [x0, y0] = swap(x0, y0);
    [x1, y1] = swap(x1, y1);
end

%% Initialization

x = x0;
y = y0;

dx = x1-x0;
disp(dx);
dy = y1-y0;
disp(dy);
d = 2*dy-dx;
disp(d);
dE = 2*dy;
dNE = 2*(dy-dx);
disp(dNE);

%% Plotting according to octant
[xp, yp] = linePoints(oct, x, y);
plot(xp, yp, 'ok');
%%
hold on;
disp('d  x  y');
disp('--------')
disp(num2str([d xp yp]));

while (x<x1)
    if d<=0
        d = d+dE;
    else
        y = y+1;
        d = d+dNE;
    end
    x=x+1;
    [xp, yp] = linePoints(oct, x, y);
    plot(xp, yp, 'ok');
    hold on;
    disp(num2str([d xp yp]));
end

grid on;
axis equal;
end

%% Swap (x,y)
function [a, b] = swap(a, b)
temp=a;
a=b;
b=temp;
end


%% Which octant?
function oct = whichOctant(x0, y0, x1, y1)
oct = -1;

m = (y1-y0)/(x1-x0);

if (m>=0 && m<=1 && x0<x1)
    oct = 1;
elseif (m>1 && y0<y1)
    oct = 2;
elseif (m<-1 && y0<y1)
    oct = 3;
elseif (m<=0 && m>=-1 && x1<x0)
    oct = 4;
elseif (m>0 && m<=1 && x1<x0)
    oct = 5;
elseif (m>1 && y1<y0)
    oct = 6;
elseif (m<-1 && y1<y0)
    oct = 7;
elseif (m<0 && m>=-1 && x0<x1)
    oct = 8;
else
    oct = 1;
end

end


%% Plot accordingly
function [xp, yp] = linePoints(oct, x, y)

if (oct == 2)
    xp=y;
    yp=x;
elseif (oct== 3)
    xp=y;
    yp=-x;
elseif (oct== 4)
    xp=-x;
    yp=y;
    plot(-x, y, 'ok');
elseif (oct== 5)
    xp=-x;
    yp=-y;
elseif (oct== 6)
    xp=-y;
    yp=-x;
elseif (oct== 7)
    xp=-y;
    yp=x;
elseif (oct== 8)
    xp=x;
    yp=-y;
else
    xp=x;
    yp=y;
end

end
