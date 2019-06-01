I = imread('coins.png');
disp(I)
[row, col] = size(I);
K = uint8(ones(row, col));

figure; imshow(I);

counts = zeros(1, 256);
for col = 1 : col
  for row = 1 : row
    % Get the gray level.
    grayLevel = I(row, col);
    % Add 1 because graylevel zero goes into index 1 and so on.
    counts(1,grayLevel) = counts(1,grayLevel) + 1;
  end
end
sumNk=0;
for k = 1:256
    sumNk=sumNk+counts(1,k);
end
disp(sumNk);
pdf = zeros(1, 256);
for k = 1:256
    pdf(1,k)=counts(1,k)/sumNk;
    %disp(pdf(1,k))
end

cdf = zeros(1, 256);
cdf(1,1)=pdf(1,1);
for k = 2:256
    cdf(1,k)=cdf(1,k-1)+pdf(1,k);
    disp(cdf(1,k));
end
ncdf=cdf*255;
%Round OFF
Rcdf = zeros(1, 256);
for k = 1:256
    Rcdf(1,k)=ceil(ncdf(1,k));
    %disp(cdf(1,k));
end


for col = 1 : col
  for row = 1 : row
    K(row,col)=Rcdf(I(row,col));
  end
end
figure; imshow(K);

X=1:256;
figure;
%hold on;
bar(X,counts(:,1),'g');
title('Histogram');
figure;
%hold on;
plot(X,pdf,'r-o','LineWidth',2);
title('PDF');
figure;
plot(X,cdf,'k-o','LineWidth',2);
title('CDF');

hold off;


counts2 = zeros(1, 256);
for col = 1 : col
  for row = 1 : row
    % Get the gray level.
    grayLevel = K(row, col);
    % Add 1 because graylevel zero goes into index 1 and so on.
    counts2(grayLevel) = counts2(grayLevel) + 1;
  end
end

sumNk=0;
for k = 1:256
    sumNk=sumNk+counts2(k);
end
disp(sumNk);
pdf = zeros(1, 256);
for k = 1:256
    pdf(1,k)=counts2(k)/sumNk;
    %disp(pdf(1,k))
end

cdf = zeros(1, 256);
cdf(1,1)=pdf(1,1);
for k = 2:256
    cdf(1,k)=cdf(1,k-1)+pdf(1,k);
    disp(cdf(1,k));
end
figure;
%hold on;
bar(X,counts2(:,1)','g');
title('Histogram After Equalization');
figure;
plot(X,cdf,'k-o','LineWidth',2);
title('CDF After Equalization');


