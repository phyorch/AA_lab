%exercise 4
%function [centroids] = k_means(centroids,k,data_number,data,iteration)
%各相关参量的初始化
k = 3;
centroids = rand(3,3);
iteration = 6;
seed = rand(3,3);
plot3(seed(:,1),seed(:,2),seed(:,3),'O');

%生成伪随机数点分布
data = zeros(90,3);
data_rand = -0.3 + 0.6*rand(90,3);
data(1:30,:) = seed(1,:) + data_rand(1:30,:);
data(31:60,:) = seed(2,:) + data_rand(31:60,:);
data(61:90,:) = seed(3,:) + data_rand(61:90,:);

data_number = size(data,1);



%显示随机数种子和随机数团簇分布
data_view = [data',seed']';
plot3(data_view(:,1),data_view(:,2),data_view(:,3),'o',data_view(91:93,1),data_view(91:93,2),data_view(91:93,3),'+');

%显示随机数团簇与初始点分布
data_view2 = [data',centroids']';
plot3(data_view2(:,1),data_view2(:,2),data_view2(:,3),'o',data_view2(91:93,1),data_view2(91:93,2),data_view2(91:93,3),'+');

%执行k-means算法
[centroids] = ex4_k_means(centroids,k,data_number,data,iteration);

%显示结果
data_view2 = [data',centroids']';
plot3(data_view2(:,1),data_view2(:,2),data_view2(:,3),'o',data_view2(91:93,1),data_view2(91:93,2),data_view2(91:93,3),'+');