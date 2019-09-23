clc;
str1='lge_';
str2='.png';
str3='mask_lge_';
new3d=[;;];
new_3d=[;;];
prev_img=[;];
for r=0:8
    temp=strcat(str1,int2str(r),str2);
    temp2=strcat(str3,int2str(r),str2);
    ROI=imread(temp);
    mask=imread(temp2);
    
    ROI(mask == 0) = 0;
    cntr=ROI;
    cntr(ROI~=0)=100;
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
    y=find_r_min_max(cntr,xc,yc);
    img_new=circle_to_line(ROI,xc,yc);
    
    new_3d=make_3d(new_3d,img_new,prev_img);
    prev_img=img_new;

end
volumeViewer(new_3d);