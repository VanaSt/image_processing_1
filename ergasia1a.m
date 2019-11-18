% clean Command window
clc;
% clear all variables from memory
clear;
% close any open figures
close all;
% use a compact format in Command Window
format compact;
% disable paging in Command Window
more off;
% load the "image" package
s=ver; % get the version of Octave (or Matlab)
if any(strcmpi({s.Name}','Octave')) % check if we are in Octave (not Matlab)
  pkg load image; % load the package if we are in Octave
end

% ---------- SELECT AND OPEN AN IMAGE ----------
% uigetfile function shows a typical "Open" window. Extension filters can
% also be defined
OpenFilename=uigetfile({
    '*.jpg;*.jpeg;*.tif;*.tiff;*.png;*.bmp;*.pcx' 'Image files'
    '*.*' 'All files (*.*)'
    });
if OpenFilename==0
    return; % finish the program if nothing is selected
end

% ---------- CONVERT TO GRAYSCALE ----------
% use the given function
I=any_image_to_grayscale_func(OpenFilename);


B0=uint8(fix(double(I)/1));
B0=any_image_to_grayscale_func(OpenFilename);
% ---------- SHOW ----------
figure,imshow(B0);
% set orthonormal axes
axis image;
% remove the x- and y- axis auto numbering
set(gca,'xtick',[],'ytick',[]);
% apply the gray colormap
colormap(gray(256));
% add title
title('256 graylevels');

B1=uint8(fix(double(I)/4));
B1=any_image_to_grayscale_func(OpenFilename);
% ---------- SHOW ----------
figure,imshow(B1);
% set orthonormal axes
axis image;
% remove the x- and y- axis auto numbering
set(gca,'xtick',[],'ytick',[]);
% apply the gray colormap
colormap(gray(64));
% add title
title('64 graylevels');

B2=uint8(fix(double(I)/32));
B2=any_image_to_grayscale_func(OpenFilename);
% ---------- SHOW ----------
figure,imshow(B2);
% set orthonormal axes
axis image;
% remove the x- and y- axis auto numbering
set(gca,'xtick',[],'ytick',[]);
% apply the gray colormap
colormap(gray(8));
% add title
title('8 graylevels');

B3=uint8(fix(double(I)/64));
B3=any_image_to_grayscale_func(OpenFilename);
% ---------- SHOW ----------
figure,imshow(B3);
% set orthonormal axes
axis image;
% remove the x- and y- axis auto numbering
set(gca,'xtick',[],'ytick',[]);
% apply the gray colormap
colormap(gray(4));
% add title
title('4 graylevels');

B4=uint8(fix(double(I)/128));
B4=any_image_to_grayscale_func(OpenFilename);
% ---------- SHOW ----------
figure,imshow(B4);
% set orthonormal axes
axis image;
% remove the x- and y- axis auto numbering
set(gca,'xtick',[],'ytick',[]);
% apply the gray colormap
colormap(gray(2));
% add title
title('2 graylevels');