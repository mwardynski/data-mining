rng(0,'twister');

data_length = length(Dane)
mu = 6.5e+06
sigma = 2e+06

ext_data = mu + sigma * randn(1, data_length);
ext_data = transpose(ext_data)

correlation_coefficient = corrcoef(Dane, ext_data);
disp(['Correlation Coefficient: ', num2str(correlation_coefficient(1, 2))]);

correlation_coefficient = corr(Dane, ext_data, 'Type', 'Spearman');
disp(['Spearman Rank Correlation Coefficient: ', num2str(correlation_coefficient)]);

correlation_coefficient = corr(Dane, ext_data, 'Type', 'Kendall');
disp(['Kendall Correlation Coefficient: ', num2str(correlation_coefficient)]);