%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This MATLAB code extracts the colormap of an any RGB image  %%
%% and converts that to .mif file to use as a color table      %%
%% ROM inside Quartus software                                 %%
%% Author: Ahmad Al-Astal                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RGB = imread('Snake_Game_Splash_Screen_24bitbmp_620by460.bmp');
[IND,map] = rgb2ind(RGB,256);
fid = fopen('Colormap_snake_Splash_Screen.txt','W'); % specify .txt file name
imsize = size(map);
imsize2 = size(IND);
count = 0;
if (fid)     
    % Write the RGB data
    fprintf(fid,'WIDTH = 24;\n');
    fprintf(fid,'DEPTH = %d;\n',imsize(1));
    fprintf(fid,'ADDRESS_RADIX = HEX;\n');
    fprintf(fid,'DATA_RADIX = HEX;\n');
    fprintf(fid,'CONTENT BEGIN\n\n');
    for i=1:imsize(1)
        fprintf(fid,'%X  : ',count);
        count = count + 1;
        fprintf(fid,'%.2X',floor(map(i,:)*255));
        fprintf(fid,';');
        fprintf(fid,'\n');
    end 
    fprintf(fid,'END;\n');
    fclose(fid);
end