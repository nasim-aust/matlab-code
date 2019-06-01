close all;
clear variables;
clc;

x=(pi):(pi/40):(2*pi);
[y1,y2,y3,y4]=Online1_1_GraphPlottingCalc(x);
Online1_1_GraphPlotting(x,y1,y2,y3,y4);
