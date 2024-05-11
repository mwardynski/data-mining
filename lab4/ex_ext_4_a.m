function [moving_avg, template_boundaries, template_peaks] = find_template(data, template_window_size, template_coeff, template_max_gap)
    template_tmp_peaks = [];
    template_boundaries = [];
    template_peaks = [];
    moving_avg = NaN(size(data));
    for i = template_window_size:length(data)
        window_avg = mean(data(i-template_window_size+1:i));

        if ~isempty(template_tmp_peaks) && i > template_tmp_peaks(end)+template_max_gap
            if length(template_tmp_peaks) >= 3
                template_boundaries = [template_boundaries; [template_tmp_peaks(1), template_tmp_peaks(end)]];
                template_peaks = [template_peaks, template_tmp_peaks];
            end
            template_tmp_peaks = [];
        end

        if data(i) > template_coeff * window_avg
            template_tmp_peaks = [template_tmp_peaks, i];
        end
    
        moving_avg(i) = window_avg;
    end
    if ~isempty(template_tmp_peaks)
        if length(template_tmp_peaks) >= 3
            template_boundaries = [template_boundaries; [template_tmp_peaks(1), template_tmp_peaks(end)]];
            template_peaks = [template_peaks, template_tmp_peaks];
        end
        template_tmp_peaks = [];
    end
end

function plot_template(data, moving_avg, template_boundaries, template_peaks)
    template_existance = zeros(size(data));
    for i = 1:size(template_boundaries, 1)
        template_range = template_boundaries(i, :);
        for j = template_range(1):template_range(2)
            template_existance(j) = 1;
        end
    end
    for i = 1:length(template_peaks)
        template_existance(template_peaks(i)) = 2;
    end

    figure;
    subplot(2, 1, 1);
    plot(1:length(data), data, 'b.-', 'DisplayName', 'Original Data');
    hold on;
    plot(1:length(moving_avg), moving_avg, 'r-', 'LineWidth', 2, 'DisplayName', 'Moving Average');
    hold off;
    title('Moving Window Average');
    legend;
    grid on;
    subplot(2, 1, 2);
    plot(1:length(template_existance), template_existance)
    title('Template Existance');
end

data = ext_data;
template_window_size = 22;
template_coeff = 1.5;
template_max_gap = 25;
[moving_avg, template_boundaries, template_peaks] = find_template(data, template_window_size, template_coeff, template_max_gap);
plot_template(data, moving_avg, template_boundaries, template_peaks)

