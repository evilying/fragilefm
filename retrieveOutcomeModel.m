%% integrate the data: 
% 1. the features 
% 2. the outcome: gpa, grit
function [lm_factor, selected_features] = ...
    retrieveOutcomeModel(fileId, iOutcome, ratio, matcase, name) 
    
    % open file
    outcomes = xlsread(fileId); 
    factor = outcomes(:, iOutcome); 
    meaningIndice = find(~isnan(factor)); 

    Y = factor(meaningIndice); 
    X = matcase(meaningIndice, 2: end); 
    opts = statset('UseParallel',true); 
    tic; 
    [b, fitinfo] = lasso(X, Y, 'CV', 5, 'Alpha', ratio, 'Options', opts); 
    toc

    lambdaindex = fitinfo.Index1SE; 
    fitinfo.MSE(lambdaindex); 
    coefficients = b(:, lambdaindex); 
    selected_features = find(any(coefficients, 2)); 

    X = X(:, selected_features); 
    lm_factor = fitlm(X, Y, 'linear'); 
    %% generate the file
    dataDir = './'; 
    namefile = 'importfeatures.xlsx'; 

    % open file 
    [~, featList] = xlsread(fullfile(dataDir, namefile)); 

    xlswrite([name '_selectedfeatures.xlsx'], [featList(selected_features)]); 
end