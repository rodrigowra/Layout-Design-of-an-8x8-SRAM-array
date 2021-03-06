data = importdata('SNM_Read.csv'); % Change filename appropriately
vin = data(:,1);
vout = data(:,2);

vin1 = vin
vout1 = vout
vin2 = vout1
vout2 = vin1
% figure()
% plot(vin, vout);
% hold on; grid on;
%plot(vin1, vout1);

% P = InterX([vin';vout'],[vout';vin']); 
% plot(vin,vout,vout,vin,P(1,:),P(2,:),'ro')

maxdiagonal = 0;
distance = 0;

for loopvar = 1:length(vin1)
    %Creating 45 deg lines from each point
    x = linspace(vin2(loopvar)-0.5,vin2(loopvar)+0.5,length(vin2));
    y = linspace(vout2(loopvar)-0.5,vout2(loopvar)+0.5,length(vout2));
    plot(x,y);
    hold on
    
    P = InterX([x;y],[vin1';vout1']);
    plot(x,y,vin1,vout1,vin2,vout2,P(1,:),P(2,:),'ro')
    
    try
        %mypts = [x1 x2; y1 y2]
        mypts = [vin2(loopvar) P(1); vout2(loopvar) P(2)];
        distance = dist(mypts);
        distance = distance(2)
    catch
    end
    
    
    if(distance>maxdiagonal)
        maxdiagonal = distance;
        myx = vin2(loopvar);
        myy = vout2(loopvar);
    end
end
    
figure()
plot(vin1, vout1);
hold on; grid on;
plot(vin2, vout2);

x2 = myx + maxdiagonal*cosd(225)
y2 = myy + maxdiagonal*sind(225)
% x = linspace(myx,myx-0.5,length(vout));
% y = linspace(myy,myy-0.5,length(vin));
y = linspace(myx,x2,length(vout));
x = linspace(myy,y2,length(vin));
plot(x,y);
plot(x,x2);
plot(y2,y);
plot(x,myx);
plot(myy,y);
