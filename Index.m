%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This MATLAB code extract the pixel index of an any RGB      %%
%% image and converts that to .mif file to use as a color      %%
%% index table ROM inside Quartus software                     %%
%% Author: Ahmad Al-Astal                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RGB = imread('Control.png');
[IND,map] = rgb2ind(RGB,256);
fid = fopen('DATA_Control.txt','W'); % specify .txt file name
imsize = size(IND);
count = 0;
if (fid)     
    % Write the RGB data
    fprintf(fid,'WIDTH = 8;\n');
    fprintf(fid,'DEPTH = %d;\n',imsize(1)*imsize(2));
    fprintf(fid,'ADDRESS_RADIX = HEX;\n');
    fprintf(fid,'DATA_RADIX = DECIMAL;\n'); % Don't forget to change HEX to DECIMAL when needed or vice versa
    fprintf(fid,'CONTENT BEGIN\n\n');
    for i=1:imsize(1)
        for j=1:imsize(2)
             fprintf(fid,'%X  : ',count);
             count = count + 1;
             fprintf(fid,'%d',IND(i,j));
             fprintf(fid,';');
             fprintf(fid,'\n');
        end
    end 
    fprintf(fid,'END;\n');
    fclose(fid);
end