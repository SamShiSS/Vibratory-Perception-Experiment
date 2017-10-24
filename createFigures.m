% This MATLAB script generates plots for the study's outcome measures for a single subject

% Summary of Plots
% Figure 1: Effect of Layer/Pressure/Intensity on Response Time
% Figure 2: Effect of Tactors' Separation Distance on Response Time
% Figure 3: Effect of Layer/Pressure/Intensity on Response Accuracy
% Figure 4: Effect of Distance on Response Accuracy
% Figure 5: Response Accuracy In-depth Analysis
% Figure 6: Effect of Layer/Pressure/Intensity on Locating Error
% Figure 7: Effects of Tactors' Separation Distance on Locating Error
% Figure 8: Breakdown of Locating Errors in Anatomical Directions
% Figure 9: Locating Error in-depth Analysis

% Summary of dependent and independent variables:
% tactor configuration variables (independent): 
% a) vibration intensity (100%, 50%)
% b) distance between tactors (2cm, 4cm, 6cm, 8cm, 10cm)
% c) layer of placement (liner/skin, liner/socket, outer socket)
% d) prosthetic pressure (4kPa, 2kPa)
% outcome measures (dependent):
% a) response time
% b) response accuracy
% c) locating error

% load('data.mat');

% Figure 1: Effect of Layer/Pressure/Intensity on Response Time
% intensity levels are 2x100%(n=5), 2x50%(n=5), 1x100%(n=9), 1x50%(n=9)
% one vibration and two sequential vibrations are treated the same
% 24=3(layers)x2(pressure)x4(intensity) bar graphs of average response time
% interested in effect of intensity, pressure, layer on response time (3-way ANOVA)

fig = figure;
fig.Name = 'Effects of Tactor Configuration Variables on Response Time';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 0.9 0.5];

eshift=[-4 -3 -2 -1 1 2 3 4
        -4 -3 -2 -1 1 2 3 4
        -4 -3 -2 -1 1 2 3 4].*0.0125;

y = [linsk4.rt100x2m linsk4.rt50x2m linsk4.rt100m linsk4.rt50m linsk2.rt100x2m linsk2.rt50x2m linsk2.rt100m linsk2.rt50m
    linso4.rt100x2m linso4.rt50x2m linso4.rt100m linso4.rt50m linso2.rt100x2m linso2.rt50x2m linso2.rt100m linso2.rt50m
    outso4.rt100x2m outso4.rt50x2m outso4.rt100m outso4.rt50m outso2.rt100x2m outso2.rt50x2m outso2.rt100m outso2.rt50m];
x = [0.700 0.786 0.871 0.957 1.043 1.129 1.214 1.300
    1.700 1.786 1.871 1.957 2.043 2.129 2.214 2.300
    2.700 2.786 2.871 2.957 3.043 3.129 3.214 3.300];
s = [linsk4.rt100x2s linsk4.rt50x2s linsk4.rt100s linsk4.rt50s linsk2.rt100x2s linsk2.rt50x2s linsk2.rt100s linsk2.rt50s
    linso4.rt100x2s linso4.rt50x2s linso4.rt100s linso4.rt50s linso2.rt100x2s linso2.rt50x2s linso2.rt100s linso2.rt50s
    outso4.rt100x2s outso4.rt50x2s outso4.rt100s outso4.rt50s outso2.rt100x2s outso2.rt50x2s outso2.rt100s outso2.rt50s];
b = bar(y,0.7); hold on
b(1).FaceColor = [0 120 213]./256;
b(2).FaceColor = [0 195 227]./256;
b(3).FaceColor = [0 255 255]./256;
b(4).FaceColor = [152 245 255]./256;
b(5).FaceColor = [205 0 0]./256;
b(6).FaceColor = [255 36 0]./256;
b(7).FaceColor = [255 96 0]./256;
b(8).FaceColor = [255 183 16]./256;
errorbar(x+eshift,y,s,'.k','LineWidth',0.75); hold off

ax = gca;
ax.FontSize = 15; 
ax.XLabel.String = 'Tactors'' Prosthetic Layer';
ax.YLabel.String = 'Response Time (s)';
ax.YLim = [0 1];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner/Skin';'Liner/Socket';'Outer Socket'};
lgd = legend({'4kPa,double 100%','4kPa,double 50%','4kPa,single 100%','4kPa,single 50%','2kPa,double 100%','2kPa,double 50%','2kPa,single 100%','2kPa,single 50%'},'FontSize',10);
lgd.Position = [0.86 0.56 0.13 0.43];
title('Effect of Layer/Pressure/Intensity on Response Time','FontSize',20);

saveas(fig,'ResponseTimeA.png');

% Figure 2: Effect of Tactors' Separation Distance on Response Time
% interested in effect of tactor spacing on reaction time

fig = figure;
fig.Name = 'Effects of Tactor Configuration Variables on Response Time (Two Simultaneous Vibrations)';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 0.9 0.5];

subplot(1,3,1);   % Tactors @ liner/skin
x = [2,4,6,8,10];
y1 = linsk4.rt(5:9);
y2 = linsk4.rt(19:23);
y3 = linsk2.rt(5:9);
y4 = linsk2.rt(19:23);
scatter(x,y1,50,[0 120 213]./256,'o','filled','LineWidth',1); hold on
scatter(x,y2,50,[0 195 227]./256,'s','filled','LineWidth',1);
scatter(x,y3,50,[205 0 0]./256,'d','filled','LineWidth',1);
scatter(x,y4,50,[255 36 0]./256,'p','filled','LineWidth',1); hold off

ax = gca;
ax.FontSize = 15;
ax.XLabel.String = 'Distance Between Tactors (cm)';
ax.XLim = [0 10];
ax.XTick = 0:2:10;
ax.YLabel.String = 'Response Time (s)';
ax.YLim = [0 1.5];
lgd = legend({'4kPa,100%','4kPa,50%','2kPa,100%','2kPa,50%'},'Location','eastoutside','FontSize',11);
lgd.Position = [0.01 0.07 0.09 0.11];
title('Liner/Skin');

subplot(1,3,2);     % Tactors @ liner/socket
x = [2,4,6,8,10];
y1 = linso4.rt(5:9);
y2 = linso4.rt(19:23);
y3 = linso2.rt(5:9);
y4 = linso2.rt(19:23);
scatter(x,y1,50,[0 120 213]./256,'o','filled','LineWidth',1); hold on
scatter(x,y2,50,[0 195 227]./256,'s','filled','LineWidth',1);
scatter(x,y3,50,[205 0 0]./256,'d','filled','LineWidth',1);
scatter(x,y4,50,[255 36 0]./256,'p','filled','LineWidth',1); hold off

ax = gca;
ax.FontSize = 15;
ax.XLabel.String = 'Distance Between Tactors (cm)';
ax.XLim = [0 10];
ax.XTick = 0:2:10;
ax.YLabel.String = 'Response Time (s)';
ax.YLim = [0 1.5];
title('Liner/Socket');

subplot(1,3,3);     % Tactors @ outer socket
x = [2,4,6,8,10];
y1 = outso4.rt(5:9);
y2 = outso4.rt(19:23);
y3 = outso2.rt(5:9);
y4 = outso2.rt(19:23);
scatter(x,y1,50,[0 120 213]./256,'o','filled','LineWidth',1); hold on
scatter(x,y2,50,[0 195 227]./256,'s','filled','LineWidth',1);
scatter(x,y3,50,[205 0 0]./256,'d','filled','LineWidth',1);
scatter(x,y4,50,[255 36 0]./256,'p','filled','LineWidth',1); hold off

ax = gca;
ax.FontSize = 15;
ax.XLabel.String = 'Distance Between Tactors (cm)';
ax.XLim = [0 10];
ax.XTick = 0:2:10;
ax.YLabel.String = 'Response Time (s)';
ax.YLim = [0 1.5];
title('Outer Socket');

saveas(fig,'ResponseTimeB.png');

% Figure 3: Effect of Layer/Pressure/Intensity on Response Accuracy
fig = figure;
fig.Name = 'Effects of Tactor Configuration Variables on Response Accuracy';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 0.9 0.5];

y = [linsk4.ra100m linsk4.ra50m linsk2.ra100m linsk2.ra50m;linso4.ra100m linso4.ra50m linso2.ra100m linso2.ra50m;outso4.ra100m outso4.ra50m outso2.ra100m outso2.ra50m];
b = bar(y); hold on
b(1).FaceColor = [0 120 213]./256;
b(2).FaceColor = [0 195 227]./256;
b(3).FaceColor = [256 96 0]./256;
b(4).FaceColor = [256 183 16]./256;

ax = gca;
ax.FontSize = 15; 
ax.XLabel.String = 'Tactors'' Prosthetic Layer';
ax.YLabel.String = 'Response Accuracy (0 to 1)';
ax.YLim = [0 1];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner/Skin';'Liner/Socket';'Outer Socket'};
lgd = legend({'4kPa,100%','4kPa,50%','2kPa,100%','2kPa,50%'},'Location','southwestoutside','FontSize',11);
lgd.Position = [0.90 0.07 0.09 0.11];
title('Effect of Layer/Pressure/Intensity on Response Accuracy','FontSize',20);

saveas(fig,'ResponseAccuracyA.png');

% Figure 4: Effect of Distance on Response Accuracy
fig = figure;
fig.Name = 'Effects of Tactor Configuration Variables on Response Accuracy (Two Vibrations)';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.15 0.5 0.7 0.3];
title('Effect of Tactors'' Separation Distance on Response Accuracy (Two Vibrations)','FontSize',14);
text('String','*0 = Incorrect Response, 1 = Correct Response','FontSize',12,'Unit','normalized','Position',[0.26 0.96]);
ax=gca;
ax.XColor='w';
ax.YColor='w';

t = uitable(fig);
t.Data = transpose(horzcat((linsk4.ra(5:9)+linsk4.ra(10:14)),(linsk4.ra(19:23)+linsk4.ra(24:28)),(linsk2.ra(5:9)+linsk2.ra(10:14)),(linsk2.ra(19:23)+linsk2.ra(24:28))));
t.BackgroundColor = [0 120 213;0 195 227;256 96 0;256 183 16]./256;
t.RowName = {'4kPa,100%';'4kPa,50%';'2kPa,100%';'2kPa,50%'};
t.ColumnName = {'2cm','4cm','6cm','8cm','10cm'};
t.FontName = 'Georgia';
t.FontSize = 15;
t.FontWeight = 'bold';
t.Units = 'normalized';
t.Position(1:2) = [0.02 0.10];
t.ColumnWidth = {40 40 40 40 40};
t.Position(3:4) = t.Extent(3:4);
text('String','Tactors @ Liner/Skin','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[-0.05 0.82]);

t = uitable(fig);
t.Data = transpose(horzcat((linso4.ra(5:9)+linso4.ra(10:14)),(linso4.ra(19:23)+linso4.ra(24:28)),(linso2.ra(5:9)+linso2.ra(10:14)),(linso2.ra(19:23)+linso2.ra(24:28))));
t.BackgroundColor = [0 120 213;0 195 227;256 96 0;256 183 16]./256;
t.RowName = {'4kPa,100%';'4kPa,50%';'2kPa,100%';'2kPa,50%'};
t.ColumnName = {'2cm','4cm','6cm','8cm','10cm'};
t.FontName = 'Georgia';
t.FontSize = 15;
t.FontWeight = 'bold';
t.Units = 'normalized';
t.Position(1:2) = [0.34 0.10];
t.ColumnWidth = {40 40 40 40 40};
t.Position(3:4) = t.Extent(3:4);
text('String','Tactors @ Liner/Socket','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[0.35 0.82]);

t = uitable(fig);
t.Data = transpose(horzcat((outso4.ra(5:9)+outso4.ra(10:14)),(outso4.ra(19:23)+outso4.ra(24:28)),(outso2.ra(5:9)+outso2.ra(10:14)),(outso2.ra(19:23)+outso2.ra(24:28))));
t.BackgroundColor = [0 120 213;0 195 227;256 96 0;256 183 16]./256;
t.RowName = {'4kPa,100%';'4kPa,50%';'2kPa,100%';'2kPa,50%'};
t.ColumnName = {'2cm','4cm','6cm','8cm','10cm'};
t.FontName = 'Georgia';
t.FontSize = 15;
t.FontWeight = 'bold';
t.Units = 'normalized';
t.Position(1:2) = [0.66 0.10];
t.ColumnWidth = {40 40 40 40 40};
t.Position(3:4) = t.Extent(3:4);
text('String','Tactors @ Outer Socket','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[0.75 0.82]);

saveas(fig,'ResponseAccuracyB.png');

% Figure 5: Response Accuracy In-depth Analysis
fig = figure;
fig.Name = 'Response Accuracy Breakdown';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.15 0.5 0.75 0.35];
title('Response Accuracy In-depth Analysis','FontSize',14);
ax=gca;
ax.XColor='w';
ax.YColor='w';

t = uitable(fig);
t.Data = vertcat(sum(err,1),err);
t.RowStriping = 'on';
t.RowName = {'Total Incorrect Responses';'One->Two Simultaneous';'One->Two Sequential';'Two Simultaneous->One';'Two Simultaneous->Two Sequential';'Two Sequential->One';'Two Sequential->Two Simultaneous'};
t.ColumnName = {'Liner/Skin','Liner/Socket','Outer Socket'};
t.FontName = 'Georgia';
t.FontSize = 15;
t.FontWeight = 'bold';
t.Units = 'normalized';
t.Position(1:2) = [0.02 0.02];
t.ColumnWidth = {75 75 75};
t.Position(3:4) = t.Extent(3:4);
text('String','Breakdown of Trials with Incorrect Responses','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[0.00 0.95]);

t = uitable(fig);
t.Data = comprtra;
t.RowStriping = 'on';
t.RowName = {'All Conditions';'Liner/Skin';'Liner/Socket';'Outer Socket'};
t.ColumnName = {'Correct Responses','Incorrect Responses'};
t.FontName = 'Georgia';
t.FontSize = 15;
t.FontWeight = 'bold';
t.Units = 'normalized';
t.Position(1:2) = [0.62 0.30];
t.ColumnWidth = {110 110};
t.Position(3:4) = t.Extent(3:4);
text('String','Response Time Splits based on Accuracy','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[0.66 0.95]);

saveas(fig,'ResponseAccuracyC.png');

% Figure 6: Effect of Layer/Pressure/Intensity on Locating Error
fig = figure;
fig.Name = 'Effects of Tactor Configuration Variables on Locating Error';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 0.9 0.5];

y = [linsk4.le100m linsk4.le50m linsk2.le100m linsk2.le50m;linso4.le100m linso4.le50m linso2.le100m linso2.le50m;outso4.le100m outso4.le50m outso2.le100m outso2.le50m];
x = [0.727 0.909 1.091 1.273;1.727 1.909 2.091 2.273;2.727 2.909 3.091 3.273];
s = [linsk4.le100s linsk4.le50s linsk2.le100s linsk2.le50s;linso4.le100s linso4.le50s linso2.le100s linso2.le50s;outso4.le100s outso4.le50s outso2.le100s outso2.le50s];
b = bar(y); hold on
b(1).FaceColor = [0 120 213]./256;
b(2).FaceColor = [0 195 227]./256;
b(3).FaceColor = [256 96 0]./256;
b(4).FaceColor = [256 183 16]./256;
errorbar(x,y,s,'.k','LineWidth',0.75); hold off

ax = gca;
ax.FontSize = 15; 
ax.XLabel.String = 'Tactors'' Prosthetic Layer';
ax.YLabel.String = 'Locating Error (cm)';
ax.YLim = [0 10];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner/Skin';'Liner/Socket';'Outer Socket'};
lgd = legend({'4kPa,100%','4kPa,50%','2kPa,100%','2kPa,50%'},'Location','northwest','FontSize',11);
lgd.Position = [0.01 0.07 0.09 0.11];
title('Effect of Layer/Pressure/Intensity on Locating Error','FontSize',20);

saveas(fig,'LocatingErrorA.png');

% Figure 7: Effects of Tactors' Separation Distance on Locating Error
% Four scatter plots (50%/4kPa,50%/2kPa,100%/4kPa,100%/2kPa) with lines of best fit

fig = figure;
fig.Name = 'Effects of Tactor Configuration Variables on Response Time (Two Simultaneous Vibrations)';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 0.9 0.5];

xshift=0.03309;

y1 = [mean(linsk4.le([5 10])) mean(linsk4.le([19 24])) mean(linsk2.le([5 10])) mean(linsk4.le([19 24]))
    mean(linso4.le([5 10])) mean(linso4.le([19 24])) mean(linso2.le([5 10])) mean(linso2.le([19 24]))
    mean(outso4.le([5 10])) mean(outso4.le([19 24])) mean(outso2.le([5 10])) mean(outso2.le([19 24]))];
x1 = [0.727 0.909 1.091 1.273;1.727 1.909 2.091 2.273;2.727 2.909 3.091 3.273];
b = bar(x1,y1); hold on
b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;
 
y2 = [mean(linsk4.le([6 11])) mean(linsk4.le([20 25])) mean(linsk2.le([6 11])) mean(linsk4.le([20 25]))
    mean(linso4.le([6 11])) mean(linso4.le([20 25])) mean(linso2.le([6 11])) mean(linso2.le([20 25]))
    mean(outso4.le([6 11])) mean(outso4.le([20 25])) mean(outso2.le([6 11])) mean(outso2.le([20 25]))];
x2 = x1+xshift;
b=bar(x2,y2);
b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;
 
y3 = [mean(linsk4.le([7 12])) mean(linsk4.le([21 26])) mean(linsk2.le([7 12])) mean(linsk4.le([21 26]))
    mean(linso4.le([7 12])) mean(linso4.le([21 26])) mean(linso2.le([7 12])) mean(linso2.le([21 26]))
    mean(outso4.le([7 12])) mean(outso4.le([21 26])) mean(outso2.le([7 12])) mean(outso2.le([21 26]))];
x3 = x2+xshift;
b = bar(x3,y3);
b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;
 
y4 = [mean(linsk4.le([8 13])) mean(linsk4.le([22 27])) mean(linsk2.le([8 13])) mean(linsk4.le([22 27]))
    mean(linso4.le([8 13])) mean(linso4.le([22 27])) mean(linso2.le([8 13])) mean(linso2.le([22 27]))
    mean(outso4.le([8 13])) mean(outso4.le([22 27])) mean(outso2.le([8 13])) mean(outso2.le([22 27]))];
x4 = x3+xshift;
b = bar(x4,y4);
b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;
 
y5 = [mean(linsk4.le([9 14])) mean(linsk4.le([23 28])) mean(linsk2.le([9 14])) mean(linsk4.le([23 28]))
    mean(linso4.le([9 14])) mean(linso4.le([23 28])) mean(linso2.le([9 14])) mean(linso2.le([23 28]))
    mean(outso4.le([9 14])) mean(outso4.le([23 28])) mean(outso2.le([9 14])) mean(outso2.le([23 28]))];
x5 = x4+xshift;
b = bar(x5,y5);
b(1).FaceColor = [0 120 213]./256; b(1).BarWidth = 1;
b(2).FaceColor = [0 195 227]./256; b(2).BarWidth = 1;
b(3).FaceColor = [256 96 0]./256; b(3).BarWidth = 1;
b(4).FaceColor = [256 183 16]./256; b(4).BarWidth = 1;

ax = gca;
ax.FontSize = 15; 
ax.XLabel.String = 'Tactors'' Prosthetic Layer';
ax.YLabel.String = 'Locating Error (cm)';
ax.YLim = [0 10];
ax.XTickLabelMode = 'manual';
ax.XTick = [1 2 3];
ax.XTickLabel = {'Liner/Skin';'Liner/Socket';'Outer Socket'};
lgd = legend({'4kPa,100%','4kPa,50%','2kPa,100%','2kPa,50%'},'Location','northwest','Orientation','vertical','FontSize',11);
lgd.Position = [0.01 0.07 0.09 0.11];
title('Effects of Tactors'' Separation Distance on Locating Error','FontSize',16);

saveas(fig,'LocatingErrorB.png');

% Figure 8: Locating Error Directional Breakdown
fig = figure;
fig.Name = 'Locating Error Directional Breakdown';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.15 0.5 0.65 0.26];
title('Breakdown of Locating Errors in Anatomical Directions','FontSize',15);
ax=gca;
ax.XColor='w';
ax.YColor='w';

t = uitable(fig);
t.Data = locshiftnum;
t.RowStriping = 'on';
t.RowName = {'Lateral Shift';'Medial Shift';'Distal Shift';'Proximal Shift'};
t.ColumnName = {'Liner/Skin','Liner/Socket','Outer Socket'};
t.FontName = 'Georgia';
t.FontSize = 15;
t.FontWeight = 'bold';
t.Units = 'normalized';
t.Position(1:2) = [0.02 0.05];
t.ColumnWidth = {75 75 75};
t.Position(3:4) = t.Extent(3:4);
text('String','Number of Shifts','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[0.05 0.91]);

t = uitable(fig);
t.Data = locshiftdis;
t.RowStriping = 'on';
t.RowName = {'Lateral Shift';'Medial Shift';'Distal Shift';'Proximal Shift'};
t.ColumnName = {'Liner/Skin','Liner/Socket','Outer Socket'};
t.FontName = 'Georgia';
t.FontSize = 15;
t.FontWeight = 'bold';
t.Units = 'normalized';
t.Position(1:2) = [0.50 0.05];
t.ColumnWidth = {75 75 75};
t.Position(3:4) = t.Extent(3:4);
text('String','Average Shift Distance(cm)','FontSize',12,'FontWeight','bold','Unit','normalized','Position',[0.60 0.91]);

saveas(fig,'LocatingErrorC.png');

% Figure 9: Locating Error in-depth Analysis
fig = figure;
fig.Name = 'Locating Error in-depth Analysis';
fig.Color = 'w';
fig.Units = 'normalized';
fig.Position = [0.05 0.35 0.9 0.5];

subplot(1,2,1);
y = complera;
b = bar(y,'hist'); hold on
b(1).FaceColor = [18 173 42]./256;
b(2).FaceColor = [205 0 0]./256;

ax = gca;
ax.FontSize = 14; 
ax.XLabel.String = 'Tactors'' Prosthetic Layer';
ax.YLabel.String = 'Locating Error (cm)';
ax.YLim = [0 10];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner/Socket';'Liner/Skin';'Outer Socket'};
lgd = legend({'Correct Response','Incorrect Response'},'Location','northwest','FontSize',11);
title('Locating Errors Splits based on Response Accuracy 1','FontSize',14);

subplot(1,2,2);
y = comple;
x = [0.727 0.909 1.091 1.273;1.727 1.909 2.091 2.273;2.727 2.909 3.091 3.273];
b = bar(y);
b(1).FaceColor = [0 255 0]./256;
b(2).FaceColor = [118 238 0]./256;
b(3).FaceColor = [255 36 0]./256;
b(4).FaceColor = [256 96 0]./256;

ax = gca;
ax.FontSize = 14; 
ax.XLabel.String = 'Tactors'' Prosthetic Layer';
ax.YLabel.String = 'Locating Error (cm)';
ax.YLim = [0 10];
ax.XTickLabelMode = 'manual';
ax.XTickLabel = {'Liner/Socket';'Liner/Skin';'Outer Socket'};
lgd = legend({'One Vibraton->One Vibration','Two Vibratons->Two Vibrations','One Vibraton->Two Vibrations','Two Vibratons->One Vibration'},'Location','northwest','FontSize',10);
title('Locating Errors Splits based on Response Accuracy 2','FontSize',14);

saveas(fig,'LocatingErrorD.png');