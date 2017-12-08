%k centers initialization
function[centers] = kmeans_initial(k,datas)

  data_len = size(datas,1);
  center_first = sum(datas)/data_len;
  %center_first_matrix = repmat(center_first,data_len,1);
  
  
  centers = center_first;
  next_index = floor(data_len/2);
  distance_centers = pdist2(centers,datas,'squaredeuclidean');
  [~,index] = sort(distance_centers);
  center_next = datas(index(next_index),:);
  centers = [centers',center_next']';
  
  
  
  for i=1:k-2
      distance_centers = pdist2(centers,datas,'squaredeuclidean');
      distance_centers_squaresum = sum(distance_centers);
      [~,index] = sort(distance_centers_squaresum);
      center_next = datas(index(next_index),:);
      centers = [centers',center_next']';
  end
  
  
  for cent_ind = 1 : size(centers)
    text(centers(cent_ind, 1), centers(cent_ind, 2), num2str(cent_ind), 'Color', 'r', 'FontSize', 25);
    hold on;
end
   hold off;
   
end
