lin_trend = polyfit(1:length(Dane), Dane, 1);
lin_trend_val = polyval(lin_trend,1:length(Dane));
lin_trend_r = Dane - transpose(lin_trend_val);
lin_trend_rmse = sqrt(mean((Dane - lin_trend_val).^2));

figure;

subplot(3, 1, 1);
hold on;
plot(Dane);
plot(lin_trend_val);
hold off;
title('Dane');

subplot(3, 1, 2);
plot(lin_trend_r);
title('Reszty trendu liniowego');

subplot(3, 1, 3);
plot(lin_trend_rmse);
title('Błąd średniokwadratowy');