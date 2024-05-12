
p=length(Dane);
euclidean_distance = sqrt(sum((Dane - ext_data).^2)/p);
disp(['Euclidean Distance: ', num2str(euclidean_distance)]);

m = 3; 
minkowski_distance = (sum(abs(Dane - ext_data).^m)/p)^(1/m);
disp(['Minkowski Distance (m = ', num2str(m), '): ', num2str(minkowski_distance)]);

data_1 = Dane;
data_2 = ext_data;

euclidean_distance_exp_window = NaN(length(data_1));
for i = 1:length(data_1)
    p = length(data_1(1:i));
    euclidean_distance_tmp = sqrt(sum((data_1(1:i) - data_2(1:i)).^2)/p);
    euclidean_distance_exp_window(i) =  euclidean_distance_tmp;
end

minkowski_distance_exp_window = NaN(length(data_1));
for i = 1:length(Dane)
    p = length(data_1(1:i));
    minkowski_distance_tmp = sqrt(sum((data_1(1:i) - data_2(1:i)).^2)/p);
    minkowski_distance_exp_window(i) =  minkowski_distance_tmp;
end

figure;
    subplot(3, 1, 1);
    hold on;
    plot(1:length(data_1), data_1, 'b-', 'DisplayName', 'Original Data');
    plot(1:length(data_2), data_2, 'r-', 'DisplayName', 'Generated Data');
    hold off;
    title(['Euclidean Distance: ', num2str(euclidean_distance), ', Minkowski Distance (m = ', num2str(m), '): ', num2str(minkowski_distance)]);
    legend;
    subplot(3, 1, 2);
    plot(1:length(euclidean_distance_exp_window), euclidean_distance_exp_window);
    title('Expanding Window - Euclidean');
    subplot(3, 1, 3);
    plot(1:length(minkowski_distance_exp_window), minkowski_distance_exp_window);
    title(['Expanding Window - Minkowski (m = ', num2str(m), ')']);


