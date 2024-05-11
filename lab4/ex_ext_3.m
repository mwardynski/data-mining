
p=length(Dane);
euclidean_distance = sqrt(sum((Dane - ext_data).^2)/p);
disp(['1. Euclidean Distance: ', num2str(euclidean_distance)]);

m = 4; 
minkowski_distance = (sum(abs(Dane - ext_data).^m)/p)^(1/m);
disp(['2. Minkowski Distance (m = ', num2str(m), '): ', num2str(minkowski_distance)]);

