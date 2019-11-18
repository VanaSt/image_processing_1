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

% ---------- SELECT AND OPEN THE FIRST IMAGE ----------
% uigetfile function shows a typical "Open" window. Extension filters can
% also be defined

OpenFilename=uigetfile({
    '*.jpg;*.jpeg;*.tif;*.tiff;*.png;*.bmp;*.pcx' 'Image files'
    '*.*' 'All files (*.*)'
    });
if OpenFilename==0
    return; % finish the program if nothing is selected
end

A=OpenFilename;
A=any_image_to_grayscale_func(OpenFilename);


% ---------- SELECT AND OPEN THE SECOND IMAGE ----------
% uigetfile function shows a typical "Open" window. Extension filters can
% also be defined
OpenFilename=uigetfile({
    '*.jpg;*.jpeg;*.tif;*.tiff;*.png;*.bmp;*.pcx' 'Image files'
    '*.*' 'All files (*.*)'
    });
if OpenFilename==0
    return; % finish the program if nothing is selected
end

B=OpenFilename;
B=any_image_to_grayscale_func(OpenFilename);


% Get size of existing image A.
[rowsA colsA numberOfColorChannelsA] = size(A);
% Get size of existing image B.
[rowsB colsB numberOfColorChannelsB] = size(B);
% See if lateral sizes match.
if rowsB ~= rowsA || colsA ~= colsB
% Size of B does not match A, so resize B to match A's size.
B = imresize(B, [rowsA colsA]);
end


% append the images horizontally
ImAddHoriz=[A B];
figure;
image(ImAddHoriz);
% set orthonormal axes
axis image;
% remove the x- and y- axis auto numbering
set(gca,'xtick',[],'ytick',[]);
% apply the gray colormap
colormap(gray(256));

% append the images vertically
ImAddVert=[A;B];
figure;
image(ImAddVert);
% set orthonormal axes
axis image;
% remove the x- and y- axis auto numbering
set(gca,'xtick',[],'ytick',[]);
% apply the gray colormap
colormap(gray(256));