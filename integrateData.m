%% integrate the data: 
% 1. the features 
% 2. the outcome: grit
dataDir = '../'; 

namefile = 'train.csv'; 

% open file 
outcomes = xlsread(fullfile(dataDir, namefile)); 

grit = outcomes(:, 3); 

meaningIndice = find(~isnan(grit)); 

Y = grit(meaningIndice); 

X = matcase(meaningIndice, [2: 157, 168: 305, 316: 533, 544: 783, 794: 1046, 1057: end]); 

nsamples = length(Y); 
ntrain = ceil(nsamples * 0.7); 
ntest = nsamples - ntrain; 

lm = fitlm(X, Y, 'interactions'); 

% parpool(); 
% opts = statset('UseParallel',true); 
% tic; 
% [b, fitinfo] = lasso(X, Y, 'CV', 5, 'Alpha', 0.2, 'Options', opts); 
% toc
% 
% lambdaindex = fitinfo.IndexMinMSE; 
% fitinfo.MSE(lambdaindex)
% coefficients = b(:, lambdaindex)

% read first line 
% fgetl(fileId); 
% line = fgetl(fileId); 

% parameters
nrow = 2121; 
nCols = 12949; 

