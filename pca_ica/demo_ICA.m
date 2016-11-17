%
% Name:         demo_ICA.m
%               
% Description:  Demonstrates the performance of ICA by decomposing
%               correlated multivariate Gaussian samples into
%               uncorrelated and maximally independent data streams
%               
%               When d == r, the ICA reconstruction is *exact*. Thus
%               ICA effectively transforms the input data into
%               uncorrelated, independent components while preserving
%               information
%               
% Author:       Brian Moore
%               brimoor@umich.edu
%               
% Date:         April 26, 2015
%


% Knobs
n = 281;    % # samples
d = 64;      % Sample dimension
r = 16;      % # independent components
Z=data;
% Generate Gaussian data


% Perform ICA
[Zica A T mu] = myICA(Z,r);
Zr = T \ pinv(A) * Zica;

% Plot indpendent components
figure;
for i = 1:r
    subplot(r,1,i);
    plot(Zica(i,:),'b');
    grid on;
    ylabel(sprintf('Zica(%i,:)',i));
end
subplot(r,1,1);
title('Independent Components');

% Plot r-dimensional approximations
figure;
for i = 1:d
    subplot(d,1,i);
    hold on;
    p1 = plot(Z(i,:),'--r');
    p2 = plot(Zr(i,:),'-.b');
    grid on;
    ylabel(sprintf('Z(%i,:)',i));
end
subplot(d,1,1);
title(sprintf('%iD ICA approximation of %iD data',r,d));
legend([p1 p2],'Z','Zr');z