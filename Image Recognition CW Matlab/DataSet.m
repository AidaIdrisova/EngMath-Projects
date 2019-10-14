function[T] = DataSet(filename)
f = imread(filename); 

% Fourier transform
z = fft2(double(f));
q = fftshift(z);

%Fourier space image
figure;
imagesc(log(abs(q) + 1)); 
colorbar;
title(filename)

Sizes=size(q);
%Data Set creation
T = []; 
l = 1;
me = mean(mean(abs(q))*9); %excluding half of points for more clear determination
for i = 1:Sizes(1)
    for ii = 1:Sizes(2)
        if abs(q(i,ii) > me)
            T(l,1) = i;
            T(l,2) = ii;
            l = l + 1;
        end
    end
end
disp(size(T))