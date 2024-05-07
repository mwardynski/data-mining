inc_abs = diff(Dane);
inc_rel = inc_abs ./ Dane(1:end-1)*100;
% inc_ln = log(Dane(2:end) ./ Dane(1:end-1));
inc_ln = log(Dane);
mean_global = mean(Dane);
std_dev = std(Dane) ;

figure;

subplot(4, 1, 1);
hold on;
plot(Dane);
plot([1, length(Dane)], [mean_global, mean_global], 'r--');
plot([1, length(Dane)], [mean_global+std_dev, mean_global+std_dev], 'g--');
plot([1, length(Dane)], [mean_global-std_dev, mean_global-std_dev], 'g--');
legend('Dane', 'Średnia', 'std dev');
hold off;
title('Dane');

subplot(4, 1, 2);
plot(inc_abs);
title('Przyrost bezwzgledny');

subplot(4, 1, 3);
plot(inc_rel);
title('Przyrost wzgledny');

subplot(4, 1, 4);
plot(inc_ln);
title('Przyrost logarytmiczny');


