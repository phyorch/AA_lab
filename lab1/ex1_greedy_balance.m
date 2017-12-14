function [job_assign, job_value] = ex1_greedy_balance( m, n, t )
% --------
% INPUT  :
% --------
% m: ��������
% n: ��������
% t: ����ʱ��
% --------
% OUTPUT :
% --------
% job_assign: ����ֹ�����
% job_value: �������������������
% --------

job_assign = zeros(m,1);
job_value = zeros(m,1);%��ǰ������ռ�õ�ʱ��
for i=1:n
    [min_value, min_index] = min(job_value);
    job_value(min_index) = min_value + t(i);
    temp = zeros(m,1);
    temp(min_index) = i;
    job_assign = [job_assign, temp];
end
end

     