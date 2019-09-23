%Trverses over the 2d array of image
%finds the radius(distance from center using pythagoras theorem)
%and angle for the given row and column value of an image
%creates a content map for with rad as the key and theta as the element

%Traverses over rad and sorts theta in increasing order
%uses rad and theta to get back row and column and concatenates to the new
%3d matrix
function y=circle_to_line(img,xc,yc)

my_2d=[;];
min=255;
myMap=containers.Map();
    for r=1:256
        for c=1:256
            if (img(r,c)~=0)
                rad=(round(sqrt((r-yc)^2+(c-xc)^2)));
                if min>rad
                    min=rad;
                end
                nrt(r,c)=rad;
                
                rads=char(rad);
                if c>xc
                    theta=atan((r-yc)/(xc-c));
                else
                    theta=atan((r-yc)/(c-xc));
                end
                nct(r,c)=theta;
                if isKey(myMap,rads)
                    myMap(rads)=[myMap(rads) theta];
                else
                    myMap(rads)=theta;
                end
            end
        end
    end
    k=keys(myMap);
  
    pad=0;
    for r2=min:min+length(k)
        
        temp=myMap(char(r2));
        temp2=sort(temp);
        temp4=length(temp2);
        for r3=1:length(temp)
            if c>xc
                temp4(r3)=img(round(yc+r2*cos(temp2(r3))),round(xc+r2*sin(temp2(r3))));
            else
                temp4(r3)=img(round(yc+r2*cos(temp2(r3))),round(xc-r2*sin(temp2(r3))));
            end
        end
        s=size(my_2d);
        temp6=[];
        if pad>0
            temp6=cat(2,zeros(s(1),round(pad/2)),my_2d,zeros(s(1),pad-round(pad/2)));
        elseif pad<0
            temp4=[zeros(1,round(0-(pad/2))) temp4 zeros(1,0-pad+round(pad/2))];
            temp6=my_2d;
        end
        my_2d=cat(1,temp6,temp4);
        
        if (r2+1)==min+length(k)
            y=my_2d;
            %img
            %nrt
            %nct
            %my_2d;
            %input('wait');
            return;
        end
        s=length(myMap(char(r2+1)));
        pad=s-length(temp4);
    end
    y=my_2d;
    
                