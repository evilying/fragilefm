dataDir = '../'; 

predict_matcase = predict_data(:, 1: end-6); 

predict_matcase(:, missColloc) = []; 

%% replace NA
nanloc = find(isnan(predict_matcase)); 
predict_matcase(nanloc) = -999; 

missloc = predict_matcase < 0; 
predict_matcase(missloc) = -999; 

predict_matcase = double(predict_matcase); 
% speciDelloc = [158: 167, 306: 315, 534: 543, 784: 793, 1047: 1056];
% predict_matcase = predict_matcase(:, setdiff(1: size(predict_matcase, 2), speciDelloc)); 

ncase = size(predict_matcase, 1); 
nfeatures = size(predict_matcase, 2); 

for ifeat = 1: nfeatures
    
    colsample = predict_matcase(:, ifeat); 
    if (sum(any(colsample < 0, 2)) == 0)
        
        continue; 
    end
    colNegInd = find(any(colsample < 0, 2)); 
    colPosInd = setdiff(1: ncase, colNegInd); 
    value = mean(colsample(colPosInd)); 
    predict_matcase(colNegInd, ifeat) = repmat(value, 1, length(colNegInd)); 
end

xlswrite(fullfile(dataDir, 'clean-predict-v6.xlsx'), predict_matcase); 