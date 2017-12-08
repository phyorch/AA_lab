% --------
% INPUT  :
% --------
%data: ��ֲ�����
%data_number: �ֲ�������
%k: ��ѡ��������
%iteration: ��������
% --------
% OUTPUT :
% --------
%centroids: ����k�����Ľ��
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
    
    %�õ���ǰһ��ѭ�����У�ÿһ�����ݵ�����������,�������ǩ
for i=1:data_number
    [~,data_label(i)] = min(distance_value(i,:));
end

%�Ե���������ǩ������Ϊ�µ�centroids׼��
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

%�õ��µ�centroids
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

