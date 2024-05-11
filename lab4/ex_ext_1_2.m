rng('default');

data_length = length(Dane);
mu = 6.5e+06;
sigma = 2e+06;

ext_data = mu + sigma * randn(1, data_length);
ext_data = transpose(ext_data);

pearson_correlation = corr(Dane, ext_data, 'Type', 'Pearson');
disp(['Pearson Correlation Coefficient: ', num2str(pearson_correlation)]);

spearman_correlation = corr(Dane, ext_data, 'Type', 'Spearman');
disp(['Spearman Rank Correlation Coefficient: ', num2str(spearman_correlation)]);

kendall_correlation = corr(Dane, ext_data, 'Type', 'Kendall');
disp(['Kendall Correlation Coefficient: ', num2str(kendall_correlation)]);

function prog_window = prog_window(data_1, data_2, type)
    prog_window = NaN(length(data_1));
    for i = 1:length(data_1)
        prog_window(i) =  corr(data_1(1:i), data_2(1:i), 'Type', type);;
    end
end

pearson_prog_window = prog_window(Dane, ext_data, 'Pearson');
spearman_prog_window = prog_window(Dane, ext_data, 'Spearman');
kendall_prog_window = prog_window(Dane, ext_data, 'Kendall');

figure;
    subplot(4, 1, 1);
    hold on;
    plot(1:length(data_1), data_1, 'b-', 'DisplayName', 'Original Data');
    plot(1:length(data_2), data_2, 'r-', 'DisplayName', 'Generated Data');
    hold off;
    title(['Pearson correlation: ', num2str(pearson_correlation), ', Spearman correlation: ', num2str(spearman_correlation), ', Kendall correlation: ', num2str(kendall_correlation)]);
    legend;
    subplot(4, 1, 2);
    plot(1:length(pearson_prog_window), pearson_prog_window);
    title('Progressing Window - Pearson correlation coefficient');
    subplot(4, 1, 3);
    plot(1:length(spearman_prog_window), spearman_prog_window);
    title('Progressing Window - Spearman correlation coefficient');
    subplot(4, 1, 4);
    plot(1:length(kendall_prog_window), kendall_prog_window);
    title('Progressing Window - Kendall correlation coefficient');
