clear;clc;close all;
tic;            
CoreNum=4;      
if matlabpool('size')<=0
    matlabpool('open','local',CoreNum);
else
    disp('Already initialized');
end

imagePath = '/home/coldmoon/Datasets/ISLVRC_2012/train/'; 
savePath = '/home/coldmoon/Datasets/ISLVRC_2012/train_256/'
class_id = dir(imagePath);
nClass = length(class_id);
file_list=[];
nImages = 0;
try 
   file_list = load('/home/coldmoon/Datasets/ISLVRC_2012/train_list.mat');
   file_list = file_list.file_list;
catch
    disp('generating file list');
    parfor i = 3:nClass
        path = strcat(imagePath,class_id(i).name, '/');
        imgs = dir(path);
        imgs = rmfield(imgs, {'date', 'bytes', 'isdir', 'datenum'});
        imgs = {imgs.name}.';
        imgs = strcat(path,imgs);
        % nImages = nImages + length(imgs) - 2;
        file_list = [file_list;imgs(3:end)];
    end
end


nImages = length(file_list);
for i=1:nImages
    if rem(i,1000) == 0
        disp(i);
    end
    A = imreadjpeg(file_list{i});
    if size(A,1) == 256 && size(A, 2) == 256
        disp('alread resized...');
    else
        B = imresize(A,[256 256]);
        imwrite(B,file_list{i}); 
    end
end
matlabpool close    
toc; 