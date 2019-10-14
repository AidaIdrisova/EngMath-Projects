%%Data Sets for T,S and V%%
T = DataSet('T1.gif');
S = DataSet('S1.gif');
V = DataSet('V1.gif');

%%%%DATA TO CLASS%%%%
O = DataSet('T2.gif');

%Nearest Neighbour classifier
%%the closest point from O to V, where dv is distance from point from O to the closest V point
[~,dv] = dsearchn(V,O); 
[~,ds] = dsearchn(S,O);
[~,dt] = dsearchn(T,O);

%Comparing the distances to the closest points in different classes for
%every point of O, so class determination of every point, s,t,v shows the
%number of points of each classes
v = 0;s = 0;t = 0;
for i = 1:length(dt)
    if dv(i) < ds(i) && dv(i) < dt(i)
        v = v + 1;
    elseif ds(i) < dv(i) && ds(i)< dt(i)
        s = s + 1;
    elseif dt(i) < ds(i) && dt(i) < dv(i)
        t = t + 1;
    end
end

%%%Compare s,t and v and result%%
if t >= s && t >= v
    disp('t');
elseif s >= t && s >= v
    disp('s');
elseif v >= t && v >= s
    disp('v');
end

%%Decision boundaries creation%%
dist = [];
%Creation of grid - 640x400 points and for each class determination using
%nearest neighbour algorithm
Sizes=max(T);
for y = 1:Sizes(1)
    for x = 1:Sizes(2)
        Z = [x y];
        [~,dv] = dsearchn(V,Z);
        [~,ds] = dsearchn(S,Z);
        [~,dt] = dsearchn(T,Z);
        if dv <= ds && dv <= dt
             dist(x,y) = 3;
        end
        if ds<=dv && ds<=dt
            dist(x,y) = 2;
        end
        if dt <= ds && dt<=dv
            dist(x,y) = 1;
        end
    end
end

%Graph of desicion regions creation
figure
rangex = [0.1 399.9];
rangey = [0.1 639.9];
imagesc(rangex,rangey,dist)
colormap(summer)
hold on;

% plot the class training data.
scatter(S(:,1),S(:,2),1, 'c');
scatter(V(:,1),V(:,2),1, 'g');
scatter(T(:,1),T(:,2),1, 'y');
 legend('S','V','T')
 
%  %A and B determination actually just changing line 60 to the file we need
%  
%  %k Nearest neighbour classifier
sizes = size(O);
sizes = sizes(1);
s = 0;
t = 0;
v = 0;
% 
% %%%HOW MANY POINTS IS CLOSER THAN 3 APPART, SS, TT ,VV shows number of
% %%%points closer for one point of o and s t v shows
% %%%the number of points classified to each character%%%
% for i = 1:sizes
%     k = O(i,:);
%     if k(1) == 0
%         break;
%     end    
%     [IDX,D] = knnsearch(O(i,:),S);
%     SS = sum(D<2);
%     [IDX,D] = knnsearch(O(i,:),T);
%     TT = sum(D<2);
%     [IDX,D] = knnsearch(O(i,:),V);
%     VV = sum(D<2);
%     if TT >= SS && TT >= VV
%         t = t + 1;
%     elseif SS >= TT && SS >= VV
%         s = s + 1;
%     elseif VV >= TT && VV >= SS
%         v = v + 1;
%     end
% end
% 
% %%%Compare numbers%%
% if t >= s && s >= v
%     disp('t');
% elseif s >= t && s >= v
%     disp('s');
% elseif v >= t && v >= s
%     disp('v');
% end


% %%Decision boundaries creation for k nearest neighbours%%%
dist = [];

%Creation of grid - (640x400)x5(for more clear boundaries) points and for each class determination using
%nearest neighbour algorithm
for x = 1:3200
    for y = 1:2000
        k = [y/5 x/5];   
        [IDX,D] = knnsearch(S,k);
         SS = sum(D < 5);
        [IDX,D] = knnsearch(T,k);
         TT = sum(D < 5);
         [IDX,D] = knnsearch(V,k);
         VV = sum(D<5);
         if TT >= SS && TT >= VV
             dist(x,y) = 1;
         elseif SS >= TT && SS >= VV
             dist(x,y) = 2;
         elseif VV >= TT && VV >= SS
             dist(x,y) = 3;
         end
    end
end

figure
rangex = [0.1 399.9];
rangey = [0.1 639.9];
imagesc(rangex,rangey,dist)
colormap(summer)
hold on;
% plot the class training data.
scatter(S(:,1),S(:,2),1, 'c');
scatter(V(:,1),V(:,2),1, 'g');
scatter(T(:,1),T(:,2),1, 'y');
 legend('S','V','T')