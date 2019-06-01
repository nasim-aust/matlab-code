close all;
clear variables;
clc;

I=imread('cameraman.png');
[row,col]=size(I);
k=ones(row,col,3);
for i= 1: row
    for j = 1:col
        
        if I(i,j)>=0 && I(i,j)<=100
           k(i,j,1)= 0;
           k(i,j,2)= 0;
           k(i,j,3)= 255;
        elseif I(i,j)>=101 && I(i,j)<=200
           k(i,j,1)= 0;
           k(i,j,2)= 255;
           k(i,j,3)= 0;
        elseif I(i,j)>=201 && I(i,j)<=255
           k(i,j,1)= 255;
           k(i,j,2)= 0;
           k(i,j,3)= 0;
                
        end    
        
    end
end

figure;imshow(I)
figure;imshow(k)
 
 
 