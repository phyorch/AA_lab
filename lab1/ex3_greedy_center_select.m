function [centers] = ex3_greedy_center_select(sites,k)
% --------
% INPUT  :
% --------
%sites: 点分布矩阵
%k: 预选中心数量
% --------
% OUTPUT :
% --------
%centers: 所选的k个中心
% --------


%默认数据合法，k<=|S|
%centers = zeros(size(sites,2));

%随机选取任意一个S中的site作为第一个center,此处取第一个
centers = sites(1,:);
centers_num = 1;
sites(1,:) = [];


%进入循环，每一次将当前空间点中距离C各center最大的点纳入
%简言之，先找到所有sites到各centers的最小值，再比较得到他们最大值的索引
while centers_num<k
    center_distance = pdist2(sites,centers);
    min_center_distance = min(center_distance,[],2);
    [~,max_distance_index] = max(min_center_distance);
    %添加新的center,并从sites中剔除
    centers = [centers',sites(max_distance_index,:)']';
    sites(max_distance_index,:) = [];
    centers_num = centers_num+1;
end

centers
end
