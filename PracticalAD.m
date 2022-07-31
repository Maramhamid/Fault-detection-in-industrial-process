clear all
close all
clc
%% Loading the data

load d00te1.mat;
load d03te1.mat;
load d05te1.mat;
load d07te1.mat;

%% Plot all the data set 

%dataset 0
figure
plot(d00te1)
title('Dataset 0 (under normal conditions)')
xlabel('Time')
ylabel('variables')
%dataset 3
figure
plot(d03te1)
xlabel('Time')
ylabel('variables')
title('Dataset 3 (with some fault)')
%dataset 5
figure
plot(d05te1)
xlabel('Time')
ylabel('variables')
title('Dataset 5 (with some fault) ')
%dataset 7
figure
plot(d07te1)
xlabel('Time')
ylabel('variables')
title('Dataset 7 (with some fault) ')

%% Plot of all the systems after flatting all the data.
process0=d00te1';
process00 = process0(:);
process_3=d03te1';
process33 = process_3(:);
process_5=d05te1';
process55 = process_5(:);
process_7=d07te1';
process77 = process_7(:);
figure
subplot(2,2,1)
plot(process00)
xlabel('Time')
ylabel('Observations')
title('Sys  0')

subplot(2,2,2)
plot(process33)
xlabel('Time')
ylabel('Observations')
title('Sys  3')

subplot(2,2,3)
plot(process55)
xlabel('Time')
ylabel('Observations')
title('Sys  5')

subplot(2,2,4)
plot(process77)
xlabel('Time')
ylabel('Observations')
title('Sys  7')

%% plot some variables on system 0 and 3 to find which variabels can 
% cause the fault visually.

figure
subplot(1,2,1)
plot(d00te1(:,[2 3 7 13 16 19 ]))
xlabel('Time')
ylabel('Variables')
legend('var 2','var 3','var 7','var 13','var 16','var 19')
title('Sys  0 ')
subplot(1,2,2)
plot(d03te1(:,[2 3 7 13 16 19]))
xlabel('Time')
ylabel('Variables')
legend('var 2','var 3','var 7','var 13','var 16','var 19')
title('Sys  3 ')

figure
subplot(1,2,1)
plot(d00te1(:,[27 29 31 33 43 44 50]))
xlabel('Time')
ylabel('Variables')
legend('var 27','var 29','var31','var 33','var 43','var 44','var 50')
title('Sys  0 ')
subplot(1,2,2)
plot(d03te1(:,[27 29 31 33 43 44 50]))
xlabel('Time')
ylabel('Variables')
legend('var 27','var 29','var31','var 33','var 43','var 44','var 50')
title('Sys  3 ')

%%  plot some variables on system 0 and 5 to find which variabels can 
% cause the fault visually.
figure
subplot(1,2,1)
plot(d00te1(:,[2 3 7 13 16 19]))
xlabel('Time')
ylabel('Variables')
legend('var 2','var 3','var 7','var 13','var 16','var 19')
title('Sys  0 ')
subplot(1,2,2)
plot(d05te1(:,[2 3 7 13 16 19]))
xlabel('Time')
ylabel('Variables')
legend('var 2','var 3','var 7','var 13','var 16','var 19')
title('Sys  5 ')

figure
subplot(1,2,1)
plot(d00te1(:,[27 29 31 33 43 44 50]))
xlabel('Time')
ylabel('Variables')
legend('var 27','var 29','var31','var 33','var 43','var 44','var 50')
title('Sys  0 ')
subplot(1,2,2)
plot(d05te1(:,[27 29 31 33 43 44 50]))
xlabel('Time')
ylabel('Variables')
legend('var 27','var 29','var31','var 33','var 43','var 44','var 50')
title('Sys  5 ')

%%  plot some variables on system 0 and 7 to find which variabels can 
% cause the fault visually.
figure
subplot(1,2,1)
plot(d00te1(:,[2 3 7 13 16 19 ]))
xlabel('Time')
ylabel('Variables')
legend('var 2','var 3','var 7','var 13','var 16','var 19')
title('Sys  0 ')
subplot(1,2,2)
plot(d07te1(:,[2 3 7 13 16 19]))
xlabel('Time')
ylabel('Variables')
legend('var 2','var 3','var 7','var 13','var 16','var 19')
title('Sys  7 ')

figure
subplot(1,2,1)
plot(d00te1(:,[27 29 31 33 43 44 50]))
xlabel('Time')
ylabel('Variables')
legend('var 27','var 29','var31','var 33','var 43','var 44','var 50')
title('Sys  0 ')
subplot(1,2,2)
plot(d07te1(:,[27 29 31 33 43 44 50]))
xlabel('Time')
ylabel('Variables')
legend('var 27','var 29','var31','var 33','var 43','var 44','var 50')
title('Sys  7 ')

%% Moving average method 
% Moving avarage for all the data set by taking 13 windows with mean 0 
%and variance 1

process = maverage(d00te1,13,0,1);
process3 = maverage(d03te1,13,0,1);
process5 = maverage(d05te1,13,0,1);
process7 = maverage(d07te1,13,0,1);

%% Plot the results before and after doing moving average for our dataset.

%Dataset 0
figure
subplot(1,2,1)
plot(d00te1)
xlabel('Time')
ylabel('Variables')
title('Dataset 0 before moving avarage')
subplot(1,2,2)
plot(process)
xlabel('Time')
ylabel('Variables')
title('Dataset 0 after moving avarage')

%Dataset 3
figure
subplot(1,2,1)
plot(d03te1 )
xlabel('Time')
ylabel('Variables')
title('Dataset 3 before moving avarage')
subplot(1,2,2)
plot(process3)
xlabel('Time')
ylabel('Variables')
title('Dataset 3 after moving avarage')

%Dataset 5
figure
subplot(1,2,1)
plot(d05te1 )
xlabel('Time')
ylabel('Variables')
title('Dataset 5 before moving avarage')
subplot(1,2,2)
plot(process5)
xlabel('Time')
ylabel('Variables')
title('Dataset 5 after moving avarage')

%Dataset 7
figure
subplot(1,2,1)
plot(d07te1)
xlabel('Time')
ylabel('Variables')
title('Dataset 7 before moving avarage')
subplot(1,2,2)
plot(process7)
xlabel('Time')
ylabel('Variables')
title('Dataset 7 after moving avarage')

%% PCA method after moving avarage.

[COEFF, SCORE, LATENT, TSQUARED, EXPLAINED] = pca(process);
r2=cumsum(EXPLAINED);

[COEFF3, SCORE3, LATENT3, TSQUARED3, EXPLAINED3] = pca(process3);
r23=cumsum(EXPLAINED3);

[COEFF5, SCORE5, LATENT5, TSQUARED5, EXPLAINED5] = pca(process5);
r25=cumsum(EXPLAINED5);

[COEFF7, SCORE7, LATENT7, TSQUARED7, EXPLAINED7] = pca(process7);
r27=cumsum(EXPLAINED7);

%%
figure
subplot(3,1,1)
plot(SCORE(:,1),SCORE(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
hold on
plot(SCORE3(:,1),SCORE3(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
title('PCA Score of first two principal components in System 0 and 3 ')

subplot(3,1,2)
plot(SCORE(:,1),SCORE(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
hold on
plot(SCORE5(:,1),SCORE5(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
title('PCA Score of first two principal components in System 0 and 5 ')

subplot(3,1,3)
plot(SCORE(:,1),SCORE(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
hold on
plot(SCORE7(:,1),SCORE7(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
title('PCA Score of first two principal components in System 0 and 7 ')


%%
figure
b = string(1:52);
subplot(3,1,1)
biplot(COEFF(:,1:2),'VarLabels',b)
hold on
biplot(COEFF3(:,1:2), 'Color', 'r','VarLabels',b)
% legend('Sys 0', 'Sys 3')
title('PCA COEFF of first two principal components in System 0 and 3 ')

subplot(3,1,2)
biplot(COEFF(:,1:2), 'Color', 'b','VarLabels',b)
hold on
biplot(COEFF5(:,1:2), 'Color', 'r','VarLabels',b);
% legend('Sys 0', 'Sys 5')
title('PCA COEFF of first two principal components in System 0 and 5 ')

subplot(3,1,3)
biplot(COEFF(:,1:2),'VarLabels',b)
hold on
biplot(COEFF7(:,1:2),'Color', 'r','VarLabels',b)
% legend('Sys 0', 'Sys 7')
title('PCA COEFF of first two principal components in System 0 and 7 ')

%% biplot 

%Dataset 0

figure
biplot(COEFF(:,1:2), 'scores',SCORE(:,1:2))
title('System 0 after PCA')

%Dataset 3
figure
biplot(COEFF3(:,1:2), 'scores',SCORE3(:,1:2))
title('System 3 after PCA')

%Dataset 5
figure
biplot(COEFF5(:,1:2), 'scores',SCORE5(:,1:2))
title('System 5 after PCA')

%Dataset 7
figure
biplot(COEFF7(:,1:2), 'scores',SCORE7(:,1:2))
title('System 7 after PCA')

%% Plot T_square for all the dataset

%Dataset 3
figure
plot(TSQUARED)
xlabel('Time')
ylabel('T^2 PCA')
hold on
plot(TSQUARED3)
legend('Sys 0','Sys 3')
title('Comparison between systems 0 and 3 after PCA')

%Dataset 5
figure
plot(TSQUARED)
xlabel('Time')
ylabel('T^2 PCA')
hold on
plot(TSQUARED5)
legend('Sys 0','Sys 5')
title('Comparison between systems 0 and 5 after PCA')

%Dataset 7
figure
plot(TSQUARED)
xlabel('Time')
ylabel('T^2 PCA')
hold on
plot(TSQUARED7)
legend('Sys 0','Sys 7')
title('Comparison between systems 0 and 7 after PCA')


%% Calculate the distance between system 0 and the other systems, from 
% coefficient of PCA.

Dist_0_3=sqrt((COEFF(:,1)-COEFF3(:,1)).^2+(COEFF(:,2)-COEFF3(:,2)).^2);
[S3,Ind3]=sort(Dist_0_3,'descend');

Dist_0_5=sqrt((COEFF(:,1)-COEFF5(:,1)).^2+(COEFF(:,2)-COEFF5(:,2)).^2);
[S5,Ind5]=sort(Dist_0_5,'descend');

Dist_0_7=sqrt((COEFF(:,1)-COEFF7(:,1)).^2+(COEFF(:,2)-COEFF7(:,2)).^2);
[S7,Ind7]=sort(Dist_0_7,'descend');


%% Auto correlation 

%Dataset 0
[acf,tlags,bounds] = autocorr(TSQUARED,'NumMA',2);
figure
autocorr(TSQUARED)

%Dataset 3
[acf3,tlags3,bounds3] = autocorr(TSQUARED3,'NumMA',2);
figure
autocorr(TSQUARED3)

%Dataset 5
[acf5,tlags5,bounds5] = autocorr(TSQUARED5,'NumMA',2);
figure
autocorr(TSQUARED5)

%Dataset 7
[acf7,tlags7,bounds7] = autocorr(TSQUARED7,'NumMA',2);
figure
autocorr(TSQUARED7)

%% DPCA method
%flip the data such that it become from the recent observation to the
% oldest observation. then find the lag matrix for the flip matrix.

%Dataset 0
f_process=flip(d00te1); 
lags = [0 -1 -2 -3 -4 -5 -6 -7]; % 7 lags
flag= lagmatrix(f_process,lags); 
len=length(f_process)-length(lags)+1; %to remove the 7 last rows from the matrix
flagd= flag(1:len,:);

%Dataset 3
f_process3=flip(d03te1); 
flag3= lagmatrix(f_process3,lags); 
flagd3= flag3(1:len,:);

%Dataset 5
f_process5=flip(d05te1); 
flag5= lagmatrix(f_process5,lags); 
flagd5= flag5(1:len,:);

%Dataset 7
f_process7=flip(d07te1); 
flag7= lagmatrix(f_process7,lags); 
flagd7= flag7(1:len,:);

%% PCA after the lags (DPCA)

%Dataset 0
[COEFF1, SCORE1, LATENT1, TSQUARED1, EXPLAINED1] = pca(flagd);
r21=cumsum(EXPLAINED1);

%Dataset 3
[COEFF13, SCORE13, LATENT13, TSQUARED13, EXPLAINED13] = pca(flagd3);
r21_3=cumsum(EXPLAINED13);

%Dataset 5
[COEFF15, SCORE15, LATENT15, TSQUARED15, EXPLAINED15] = pca(flagd5);
r21_5=cumsum(EXPLAINED15);

%Dataset 7
[COEFF17, SCORE17, LATENT17, TSQUARED17, EXPLAINED17] = pca(flagd7);
r21=cumsum(EXPLAINED17);

%% Plot comparasion between the score of system 0 and the other systems.

figure
subplot(3,1,1)
plot(SCORE1(:,1),SCORE1(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
hold on
plot(SCORE13(:,1),SCORE13(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
title('DPCA Score of first two principal components in System 0 and 3 ')

subplot(3,1,2)
plot(SCORE1(:,1),SCORE1(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
hold on
plot(SCORE15(:,1),SCORE15(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
title('DPCA Score of first two principal components in System 0 and 5 ')

subplot(3,1,3)
plot(SCORE1(:,1),SCORE1(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
hold on
plot(SCORE17(:,1),SCORE17(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
title('DPCA Score of first two principal components in System 0 and 7 ')

%%
figure
b = string(1:416);
subplot(3,1,1)
biplot(COEFF1(:,1:2),'VarLabels',b)
hold on
biplot(COEFF13(:,1:2), 'Color', 'r','VarLabels',b)
% legend('Sys 0', 'Sys 3')
title('DPCA COEFF of first two principal components in System 0 and 3 ')

subplot(3,1,2)
biplot(COEFF1(:,1:2), 'Color', 'b','VarLabels',b)
hold on
biplot(COEFF15(:,1:2), 'Color', 'r','VarLabels',b);
% legend('Sys 0', 'Sys 5')
title('DPCA COEFF of first two principal components in System 0 and 5 ')

subplot(3,1,3)
biplot(COEFF1(:,1:2),'VarLabels',b)
hold on
biplot(COEFF17(:,1:2),'Color', 'r','VarLabels',b)
% legend('Sys 0', 'Sys 7')
title('DPCA COEFF of first two principal components in System 0 and 7 ')


%% T squared for the all systems.

%Dataset 3
figure
plot(TSQUARED1)
xlabel('Time')
ylabel('T^2 DPCA')
hold on
plot(TSQUARED13)
legend('Sys 0','Sys 3')
title('Comparison between systems 0 and 3 after DPCA')

%Dataset 5
figure
plot(TSQUARED1)
xlabel('Time')
ylabel('T^2 DPCA')
hold on
plot(TSQUARED15)
legend('Sys 0','Sys 5')
title('Comparison between systems 0 and 5 after DPCA')

%%Dataset 7
figure
plot(TSQUARED1)
xlabel('Time')
ylabel('T^2 DPCA')
hold on
plot(TSQUARED17)
legend('Sys 0','Sys 7')
title('Comparison between systems 0 and 7 after DPCA')

%% Biplot

%Dataset 0
figure
biplot(COEFF1(:,1:2), 'scores',SCORE1(:,1:2))
title('System 0 after DPCA')

%Dataset 3
figure
biplot(COEFF13(:,1:2), 'scores',SCORE13(:,1:2))
title('System 3 after DPCA')

%Dataset 5
figure
biplot(COEFF15(:,1:2), 'scores',SCORE15(:,1:2))
title('System 5 after DPCA')

%Dataset 7
figure
biplot(COEFF17(:,1:2), 'scores',SCORE17(:,1:2))
title('System 7 after DPCA')
%%
figure
plot(SCORE1(:,1),SCORE1(:,2),'.')
hold on
plot(SCORE13(:,1),SCORE13(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
title('DPCA Score of first two principal components in System 0 and 3 ')
figure
plot(SCORE1(:,1),SCORE1(:,2),'.')
hold on
plot(SCORE15(:,1),SCORE15(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
title('DPCA Score of first two principal components in System 0 and 5 ')
figure
plot(SCORE1(:,1),SCORE1(:,2),'.')
hold on
plot(SCORE17(:,1),SCORE17(:,2),'.')
xlabel('Component 1')
ylabel('Component 2')
title('DPCA Score of first two principal components in System 0 and 7 ')

%% The distances

Dist1_0_3=sqrt((COEFF1(:,1)-COEFF13(:,1)).^2+(COEFF1(:,2)-COEFF13(:,2)).^2);
[S13,Ind13]=sort(Dist1_0_3,'descend');

Dist1_0_5=sqrt((COEFF1(:,1)-COEFF15(:,1)).^2+(COEFF1(:,2)-COEFF15(:,2)).^2);
[S15,Ind15]=sort(Dist1_0_5,'descend');

Dist1_0_7=sqrt((COEFF1(:,1)-COEFF17(:,1)).^2+(COEFF1(:,2)-COEFF17(:,2)).^2);
[S17,Ind17]=sort(Dist1_0_7,'descend');


%% Auto correlation for all the dataset

%Dataset 0
figure
[acf1,tlags1,bounds1] = autocorr(TSQUARED1,'NumMA',2);
autocorr(TSQUARED1)

%Dataset 3
figure
[acf13,tlags13,bounds13] = autocorr(TSQUARED13,'NumMA',2);
autocorr(TSQUARED13)

%Dataset 5
figure
[acf15,tlags15,bounds15] = autocorr(TSQUARED15,'NumMA',2);
autocorr(TSQUARED15)

%Dataset 7
figure
[acf17,tlags17,bounds17] = autocorr(TSQUARED17,'NumMA',2);
autocorr(TSQUARED17)

%%
% 
%  [RESIDUALS,RECONSTRUCTED] = pcares(flagd,22);
%  Q = diag(RESIDUALS*RESIDUALS') ;
% %%
% figure
% plot(Q)
% figure
% [acfQ,Qlags,boundsQ] = autocorr(Q,'NumMA',2);
% autocorr(Q)
