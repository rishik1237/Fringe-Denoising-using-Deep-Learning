    % % Created by : G Rajshekhar
% % Created on : 18/3/2009
% % Last Modified : 10/4/2009

% % The function phasepattern takes half of image size as input and
% % returns an intensity fringe pattern correspinding to the index specified in input
% % argument.

% % pixlen = half of image size in pixels
% % ind = index to select a particular fringe pattern. For e.g. ind value
% % of 5 selects the pattern pat5 and so on.
% % pattern = output intensity fringe pattern
% % 

function [ph,pattern,x_deriv,y_deriv] = phasePattern(ind,pixlen_x,pixlen_y,rowShift,colShift)

x = (1:2*pixlen_x);
m = 2*pixlen_x;

if(nargin < 3)
    pixlen_y = pixlen_x;
y = (1:2*pixlen_x);
n = 2*pixlen_x;
else
   y = (1:2*pixlen_y);
   n = 2*pixlen_y;
end


[X,Y] = meshgrid(x,y);

if (ind == 1)
    ph = (30*(exp(-((X - pixlen_x).^2 + Y.^2)/10^4)- exp(-((X - pixlen_x).^2 + (Y- 2*pixlen_y).^2)/10^4))).';
pattern = 10*cos(ph);
  
elseif (ind == 2)
ph = 30*(exp(-0.5*((X-pixlen_x/2).^2 + (Y-pixlen_y/2).^2)/30^2) + exp(-0.5*((X-pixlen_x/2).^2 + (Y-3*pixlen_y/2).^2)/30^2) + exp(-0.5*((X-pixlen_x).^2 + (Y-pixlen_y).^2)/30^2) + exp(-0.5*((X-3*pixlen_x/2).^2 + (Y-pixlen_y/2).^2)/30^2) + exp(-0.5*((X-3*pixlen_x/2).^2 + (Y-3*pixlen_y/2).^2)/30^2) );
pattern = 1 + cos(ph);

elseif (ind == 3)
ph = 2*pi*36*(((X-round(0.5*m))/m).^2 + ((Y - round(0.5*n))/n).^2);
pattern = 20*cos(ph);
x_deriv = 2*pi*36*2*(X-pixlen_x)/m^2;
y_deriv = 2*pi*36*2*(Y-pixlen_y)/n^2;
elseif (ind == 5)
    % %  Circular mask
%   mask=ones(2*pixlen);
% for k=1:2*pixlen_y
%     for l=1:2*pixlen_x
%         if(((k-pixlen_y)^2+(l-pixlen_x)^2>pixlen_x^2))
%             mask(k,l)=0;
%         end
%     end
% end

ph = (0.188*(Y - pixlen_y).*log(((X - pixlen_x).^2 + (Y - pixlen_y).^2)/246.^2)).';
%pattern = 220*abs(sin(0.5*ph)).*mask ;

elseif (ind == 6)
 ph = 3*peaks(2*pixlen_x);
pattern = cos(ph);

  
elseif (ind == 7)
 ph = 2*pi*sqrt((X-pixlen_x).^2 + (Y - pixlen_y).^2)/30;
pattern = cos(ph);

  elseif (ind == 8)
    ph = ((X-pixlen_x).^2 + (Y - pixlen_y).^2)/100;
pattern = cos(ph);



  elseif (ind == 9)
  ph = (30*(exp(-((X - pixlen_x - rowShift).^2 + (Y-pixlen_y- colShift).^2)/10^4)));
pattern = cos(ph);

elseif (ind == 10)
 ph = 2*pi*36*(((X-120-round(0.5*m))/m).^2 + ((Y-10 - round(0.5*n))/n).^2);
pattern = 20*cos(ph);
x_deriv = 2*pi*36*2*(X-10-round(0.5*m))/m^2;
y_deriv = 2*pi*36*2*(Y-70 - round(0.5*n))/n^2;

elseif (ind == 11)
  ph = (30*(exp(-15*((X - pixlen_x - rowShift ).^2 + (Y-pixlen_y-50 - colShift).^2)/n^2)- exp(-15*((X - pixlen_x - rowShift).^2 + (Y- pixlen_y+50 - colShift).^2)/m^2))).';
pattern = 10*cos(ph);   

elseif (ind == 12)
%     ph = 50*repmat(sin(2*pi*0.5*(1:n).'/n),1,m);
    ph = 15*(1+sin(2*pi*0.5*(1:n)/n)).'*(1+sin(2*pi*0.5*(1:m)/m));
    pattern = 5*cos(ph);
    x_deriv = 15*pi*(1+sin(pi*(1:n)/n)).'*cos(pi*(1:m)/m)/m;
    y_deriv = 15*pi*cos(pi*(1:n).'/n)*(1+sin(pi*(1:m)/m))/n;
    
elseif (ind == 13)
    scale_par=10^5;
    ph = 100*(exp(-((X - pixlen_x).^2 + (Y-pixlen_y).^2)/scale_par)) ;
    x_deriv= -ph.*(2*(X - pixlen_x)/scale_par);
    y_deriv= -ph.*(2*(Y - pixlen_y)/scale_par);
pattern = 10*cos(ph);   
elseif (ind == 132)
    ph = 100*(exp(-((X - pixlen_x-50).^2 + (Y-pixlen_y-50).^2)/(10^5))) ;
pattern = 10*cos(ph);  

elseif (ind == 14)
    ph = 30*((Y-pixlen_y)/pixlen_y).^3;
pattern = 10*cos(ph);
elseif (ind == 142)
    ph = 15*(((Y-pixlen_y)/pixlen_y).^3 + ((X-pixlen_x)/pixlen_x).^3);
pattern = 10*cos(ph);
elseif(ind==143)
    ph = 4*(Y-pixlen_y)/pixlen_y + 200*((Y-pixlen_y)/pixlen_y).^2 - 200*((Y-pixlen_y)/pixlen_y).^3 ;
 
elseif (ind == 15)
   ph = 2*pi*36*(((X-round(0.5*m))/m).^3 + ((Y - round(0.5*n))/n).^3);
elseif (ind == 16)
   ph = 2*pi*36*(((X-10-round(0.5*m))/m).^3 + ((Y-50- round(0.5*n))/n).^3);
else
    disp('Error! You have not selected proper ind  ')
  
end


    





