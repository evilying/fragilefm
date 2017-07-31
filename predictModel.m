%% predict the data: 
% 1. the features 
% 2. the outcome: grit
function predictModel(lm, predict_matcase, selected_features, fileId) 
    
    % open file 
    X = predict_matcase(:, 2: end); 
    
    X = X(:, selected_features); 
    Y = predict(lm, X); 
    
    csvwrite(fileId, Y); 
end