function [moving_avg, template_starts] = find_template(data, template_avg_size, template)
    template_starts = [];
    moving_avg = NaN(size(data));
    moving_avg(template_avg_size+1:end) = movmean(data, [template_avg_size, 0], "Endpoints","discard");
    signs = sign(data(template_avg_size+1:end) - moving_avg(template_avg_size+1:end));
    
    for i = 1:length(signs)-length(template)
        if transpose(signs(i:i+length(template)-1)) == template
            template_starts = [template_starts, i+template_avg_size+1];
        end
    end
end

function plot_template(data, moving_avg, template_starts, template)
    template_existance = zeros(size(data));
    for i = 1:length(template_starts)
        template_start = template_starts(i);
        template_end = template_start+length(template)-1;
        template_existance(template_start:template_end) = template;
        disp(['template window: [', num2str(template_start), ', ', num2str(template_end), ']'])
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
template_avg_size = 22;
template = [-1, 1, -1, 1];
[moving_avg, template_starts] = find_template(data, template_avg_size, template);
plot_template(data, moving_avg, template_starts, template)

