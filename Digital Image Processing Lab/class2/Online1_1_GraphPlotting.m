function [] = Online1_1_GraphPlotting(x,y1,y2,y3,y4)

hold on;
plot(x,y1,'r-o','LineWidth',2);
plot(x,y2,'k-o','LineWidth',2);
plot(x,y3,'y-o','LineWidth',2);
plot(x,y4,'c-o','LineWidth',2);
xlabel('X');
ylabel('Y1, Y2, Y3 and Y4');
title('Sine and Cosine function');
legend('sin(x)','x*sin(x)','cos(x)','sin(x)*cos(2.*x)');

box on;
legend('boxoff');
hold off;
end