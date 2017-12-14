%excerse 2
%function [job_assign, jobvalue] = greedy_balance( m, n, t )
%各相关参量初始化
m = 3;
n = 8;
t = 10 * rand(1,8);

[job_assign, job_value] = ex2_greedy_sorted_balance( m, n, t );

%显示结果
job_assign
job_value