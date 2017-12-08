%exercise 3
%function [centers] = greedy_algorithm(sites,k)
%各相关参量初始化
rng(0);
sites = [mvnrnd([2 -2], [2 1.5; 1.5, 2], 500); mvnrnd([-2 2], [2 1.5; 1.5, 2], 500)];
k = 8;
%sites = rand(40,2);
sites_number = size(sites,1) - 1;
%显示sites分布
plot(sites(:,1),sites(:,2),'o');


[centers] = ex3_greedy_center_select(sites,k);

%显示centers和sites的分布
sites_centers = [sites',centers']';
%plot(sites_centers(:,1),sites_centers(:,2),'o',sites_centers(sites_number-k+1:sites_number,1),...
%sites_centers(sites_number-k+1:sites_number,2),'+');
for cent_ind = 1 : size(centers)
    text(centers(cent_ind, 1), centers(cent_ind, 2), num2str(cent_ind), 'Color', 'r', 'FontSize', 25);
    hold on;
end
   hold off;