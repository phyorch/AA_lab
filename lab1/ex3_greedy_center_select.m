function [centers] = ex3_greedy_center_select(sites,k)
% --------
% INPUT  :
% --------
%sites: ��ֲ�����
%k: Ԥѡ��������
% --------
% OUTPUT :
% --------
%centers: ��ѡ��k������
% --------


%Ĭ�����ݺϷ���k<=|S|
%centers = zeros(size(sites,2));

%���ѡȡ����һ��S�е�site��Ϊ��һ��center,�˴�ȡ��һ��
centers = sites(1,:);
centers_num = 1;
sites(1,:) = [];


%����ѭ����ÿһ�ν���ǰ�ռ���о���C��center���ĵ�����
%����֮�����ҵ�����sites����centers����Сֵ���ٱȽϵõ��������ֵ������
while centers_num<k
    center_distance = pdist2(sites,centers);
    min_center_distance = min(center_distance,[],2);
    [~,max_distance_index] = max(min_center_distance);
    %����µ�center,����sites���޳�
    centers = [centers',sites(max_distance_index,:)']';
    sites(max_distance_index,:) = [];
    centers_num = centers_num+1;
end

centers
end
