clc;
str1='lge_';
str2='.png';
str3='mask_lge_';
new3d=[;;];                             %3D myocardium volume
new_3d=[;;];                            %Open myocardium
for r=0:8
    temp=strcat(str1,int2str(r),str2);  %input image address
    temp2=strcat(str3,int2str(r),str2); %mask input address
    ROI=imread(temp);                   %open image
    mask=imread(temp2);
    
    ROI(mask == 0) = 0;                 %Extract myocardium from mask
    cntr=ROI;
    cntr(ROI~=0)=100;                   %Creating an array with only two values for finding image center
    %Find image center of area by using center of mass formula on the "cntr" array 
    row=sum(cntr,1);
    col=sum(cntr,2);
    rowr=zeros(size(row));
    colr=zeros(size(col));
    for r2=1:length(row)
        rowr(r2)=row(r2)*r2;
        colr(r2)=col(r2)*r2;
    end
    
    xc=round(sum(rowr)/(sum(row)));
    yc=round(sum(colr)/(sum(col)));
    %open each image
    img_new=circle_to_line(ROI,xc,yc);
    %use the open trapazoidal image to make 3d Structure
    new_3d=make_3d(new_3d,img_new);


end
volumeViewer(new_3d);