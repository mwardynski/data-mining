poly_3_trend = polyfit(1:length(Dane), Dane, 3);
poly_3_trend_val = polyval(poly_3_trend,1:length(Dane));
poly_3_trend_r = Dane - transpose(lin_trend_val);
lin_trend_rmse = sqrt(mean((Dane - lin_trend_val).^2));

figure;

subplot(3, 1, 1);
hold on;
plot(Dane);
plot(poly_3_trend_val);
hold off;
title('Dane');

subplot(3, 1, 2);
plot(poly_3_trend_r);
title('Residua wielomianu 3. stopnia');
