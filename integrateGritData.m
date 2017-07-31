%% integrate the data: 
% 1. the features 
% 2. the outcome: grit
dataDir = '../'; 

namefile = 'train.csv'; 

% open file 
fileId = fullfile(dataDir, namefile); 

[lm_gpa, gpa_selected] = retrieveOutcomeModel(fileId, 2, matcase, 'gpa'); 
[lm_grit, grit_selected] = retrieveOutcomeModel(fileId, 3, matcase, 'grit'); 
[lm_hardship, hardship_selected] = ...
    retrieveOutcomeModel(fileId, 4, matcase, 'materialHardship'); 
[lm_eviction, eviction_selected, evition_error] = retrieveLDAModel(fileId, 5, matcase, 'linear', 'eviction'); 
[lm_layoff, layoff_selected, layoff_error] = retrieveLDAModel(fileId, 6, matcase, 'linear', 'layoff'); 
[lm_job, job_selected, job_error] = retrieveLDAModel(fileId, 7, matcase, 'linear', 'jobTraining'); 

predictModel(lm_gpa, predict_matcase, gpa_selected, fullfile(dataDir, 'gpa_prediction.csv')); 
predictModel(lm_grit, predict_matcase, grit_selected, fullfile(dataDir, 'grit_prediction.csv')); 
predictModel(lm_hardship, predict_matcase, hardship_selected, fullfile(dataDir, 'hardship_prediction.csv')); 
predictModel(lm_eviction, predict_matcase, eviction_selected, fullfile(dataDir, 'eviction_prediction.csv')); 
predictModel(lm_layoff, predict_matcase, layoff_selected, fullfile(dataDir, 'layoff_prediction.csv')); 
predictModel(lm_job, predict_matcase, job_selected, fullfile(dataDir, 'job_prediction.csv')); 