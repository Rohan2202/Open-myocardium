%Gets the 3d image and the next 2D image 
%compares and pads zero accordingly to the two image
%concatenates the two images
function new_3d=make_3d(img,next_img)
    s1=size(next_img);
    s2=size(img);
    s=size(img);
    
    try
    s_i=s(3);
    catch 
    s_i=0;
    end
    pad1=s1(1)-s2(1);
    pad2=s1(2)-s2(2);
    if and(s2(1)==0,s2(2)==0)
        new_3d=next_img;
        return
    elseif s_i==0
        if pad1>0
            temp6=img;
            pad_left=round(pad1/2);
            pad_right=pad1-round(pad1/2);
            if pad_left>0
                temp6=cat(1,zeros(pad_left,s2(2)),temp6);
            end
            if pad_right>0
                temp6=cat(1,temp6,zeros(pad_right,s2(2)));
            end
            img=temp6;
        elseif pad1<0
            temp6=next_img;
            pad_left=0-round(pad1/2);
            pad_right=0-pad1+round(pad1/2);
            if pad_left>0
                temp6=cat(1,zeros(pad_left,s1(2)),temp6);
                
            end
            if pad_right>0
                temp6=cat(1,temp6,zeros(pad_right,s1(2)));
               
            end
            next_img=temp6;
        end
     
        if pad2>0
            temp6=img;
            pad_up=round(pad2/2);
            pad_down=pad2-round(pad2/2);
            if pad_up>0
                
                temp6=cat(2,zeros(s2(1),pad_up),temp6);
               
            end
            if pad_down>0
               
                temp6=cat(2,temp6,zeros(s2(1),pad_down));
              
            end
            img=temp6;
        
        elseif pad2<0
            temp6=next_img;
            pad_up=0-round(pad2/2);
            pad_down=0-pad2+round(pad2/2);
            if pad_up>0
                temp6=cat(2,zeros(s1(1),pad_up),temp6);
            end
            if pad_down>0
                temp6=cat(2,temp6,zeros(s1(1),pad_down));
            end
            next_img=temp6;
        end
        new_3d=cat(3,img,next_img);
    else
        if pad1>0
            temp6=img;
            pad_left=round(pad1/2);
            pad_right=pad1-round(pad1/2);
            if pad_left>0
                temp6=cat(1,zeros(pad_left,s2(2),s_i),temp6);
   
            end
            if pad_right>0
                temp6=cat(1,temp6,zeros(pad_right,s2(2),s_i));
            end
            img=temp6;
        elseif pad1<0
            temp6=next_img;
            pad_left=0-round(pad1/2);
            pad_right=0-pad1+round(pad1/2);
            if pad_left>0
                s3=size(temp6);
         
                temp6=cat(1,zeros(pad_left,s3(2)),temp6);
                
            end
            if pad_right>0
                s3=size(temp6);
                temp6=cat(1,temp6,zeros(pad_right,s3(2)));
               
            end
            next_img=temp6;
        end
     
        if pad2>0
            temp6=img;
            pad_up=round(pad2/2);
            pad_down=pad2-round(pad2/2);
            if pad_up>0
                s3=size(temp6);
                temp6=cat(2,zeros(s3(1),pad_up,s_i),temp6);
               
            end
            if pad_down>0
                s3=size(temp6);
                temp6=cat(2,temp6,zeros(s3(1),pad_down,s_i));
              
            end
            img=temp6;
        
        elseif pad2<0
            temp6=next_img;
            pad_up=0-round(pad2/2);
            pad_down=0-pad2+round(pad2/2);
            if pad_up>0
             
                s3=size(temp6);
                temp6=cat(2,zeros(s3(1),pad_up),temp6);
        
            end
            if pad_down>0
                s3=size(temp6);
                temp6=cat(2,temp6,zeros(s3(1),pad_down));
            end
            next_img=temp6;
        end
        new_3d=cat(3,img,next_img);
    end