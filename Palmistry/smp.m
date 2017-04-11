% a=imread('t7.jpg');
im = imclearborder(im2bw(a));
im_fill = imfill(im, 'holes');
s = regionprops(im_fill, 'Area', 'PixelList');
[~,ind] = max([s.Area]);
pix = sub2ind(size(im), s(ind).PixelList(:,2), s(ind).PixelList(:,1));
out = zeros(size(im));
out(pix) = im(pix);
imshow(out);
out=uint8(out);
out1=imfill(out);
abc(:,:,1)=out1;
abc(:,:,2)=out1;
abc(:,:,3)=out1;
out2=abc.*a;
imshow(out2);
Input=out2;
% function Output = alg_h(Input)
% To know number of row and column (total number of pixels)
[row, column, d] = size(Input);
i=0;
while(i<d)  %note that the loop is for using with RGB images
i=i+1;
% Calculate of the histogram
histo=imhist(Input(:,:,i));
% Convert Input in double
Input(:,:,i) = double (Input(:,:,i));
% Calculate probability of grey level pixel
probability=histo./(row*column);
% Accumulated probability and weights
equalizer = cumsum(probability)*256;
%Replace grey level pixels in function of equalizer
Output(:,:,i)=equalizer(Input(:,:,i)+1);
end
%Convert to 8 bits unsigned intiger data
Input = uint8(Input); Output = uint8(Output);
[y1,x]=imhist(Input(:,:,1)); [y2,x]=imhist(Input(:,:,2)); [y3,x]=imhist(Input(:,:,3));
plot(x,y1,'r', x,y2,'g', x,y3,'b');
 
figure;
[y4,x]=imhist(Output(:,:,1)); [y5,x]=imhist(Output(:,:,2)); [y6,x]=imhist(Output(:,:,3));
plot(x,y4,'r', x,y5,'g', x,y6,'b');
 
figure;subplot(1,2,1);
imshow(Input);title('Original image');
subplot(1,2,2);imshow(Output);title('After histogram equalisation');
 
% end
A = Output ;

A=imresize(A,0.40);
Agray = rgb2gray(A);
figure
imshow(A)
imageSize = size(A);
numRows = imageSize(1);
numCols = imageSize(2);

wavelengthMin = 4/sqrt(2);
wavelengthMax = hypot(numRows,numCols);
n = floor(log2(wavelengthMax/wavelengthMin));
wavelength = 2.^(0:(n-2)) * wavelengthMin;

deltaTheta = 10 ;
orientation = 0:deltaTheta:(180-deltaTheta);

g = gabor(wavelength,orientation);
gabormag = imgaborfilt(Agray,g);

for i = 1:length(g)
    sigma = 0.5*g(i).Wavelength;
    K = 3;
    gabormag(:,:,i) = imgaussfilt(gabormag(:,:,i),K*sigma); 
end

X = 1:numCols;
Y = 1:numRows;
[X,Y] = meshgrid(X,Y);
featureSet = cat(3,gabormag,X);
featureSet = cat(3,featureSet,Y);
numPoints = numRows*numCols;
X = reshape(featureSet,numRows*numCols,[]);
X = bsxfun(@minus, X, mean(X));
X = bsxfun(@rdivide,X,std(X));

coeff5 = pca(X);
feature2DImage = reshape(X*coeff5(:,1),numRows,numCols);
figure
imshow(feature2DImage,[])