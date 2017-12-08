function [job_assign, job_value] = ex2_greedy_sorted_balance( m, n, t )
% INPUT  :
% --------
% m: 机器数量
% n: 任务数量
% t: 任务时间
% --------
% OUTPUT :
% --------
% job_assign: 任务分工矩阵
% job_value: 各个机器任务分配总量
% --------
job_assign = zeros(m,1);
job_value = zeros(m,1);%当前机器所占用的时间
t = sort(t,'descend');
for i=1:n
    [min_value, min_index] = min(job_value);
    job_value(min_index) = min_value + t(i);
    temp = zeros(m,1);
    temp(min_index) = i;
    job_assign = [job_assign, temp];
end


end