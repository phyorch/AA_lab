% --------
% INPUT  :
% --------
%data: 点分布矩阵
%data_number: 分布点数量
%k: 所选中心数量
%iteration: 迭代次数
% --------
% OUTPUT :
% --------
%centroids: 所求k个中心结果
% --------

function [centroids] = ex4_k_means(centroids,k,data_number,data,iteration)
for iter =1:iteration
    distance_value = zeros(data_number,k);
    for a=1:data_number
        for b=1:k
            distance_value(a,b) = norm(data(a,:) - centroids(b,:));
        end
    end

    data_label = zeros(data_number,1);
    
    %得到当前一轮循环当中，每一个数据点所属的中心,即分配标签
for i=1:data_number
    [~,data_label(i)] = min(distance_value(i,:));
end

%对点逐个分配标签，并且为新的centroids准备
centroids_new_sum = zeros(size(centroids));
m = size(centroids,1);
p = zeros(m,1);
for i=1:k
    for j=1:data_number
        if(data_label(j) == i)
            p(i) =p(i) + 1;
            centroids_new_sum(i,:) =  centroids_new_sum(i,:) + data(j,:);
        end
    end
end

%得到新的centroids
for i=1:k
    centroids(i,:) = centroids_new_sum(i,:) /p(i);
end
centroids

for cent_ind = 1 : size(centroids)
    text(centroids(cent_ind, 1), centroids(cent_ind, 2), num2str(cent_ind), 'Color', 'r', 'FontSize', 25);
    hold on;
end
   hold off;

fprintf('please put any key to go on \n');
pause;
end
end

