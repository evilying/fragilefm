dataDir = '../'; 

% namefile = 'data.xlsx'; 
% predict_matcase = xlsread(fullfile(dataDir, namefile)); 

predict_matcase = data; 

nthreshold = floor(size(predict_matcase, 1) * 0.3); 

nanColloc = find(all(isnan(predict_matcase))); 

missloc = find(predict_matcase < 0); 
predict_matcase(missloc) = -999; 
nanloc = find(isnan(predict_matcase));
predict_matcase(nanloc) = -999; 

missColloc = find(sum(predict_matcase < 0) > nthreshold); 

% predict_matcase(:, nanColloc) = []; 
predict_matcase(:, missColloc) = []; 

predict_matcase = double(predict_matcase); 
speciDelloc = [158: 167, 306: 315, 534: 543, 784: 793, 1047: 1056];
predict_matcase = predict_matcase(:, setdiff(1: size(predict_matcase, 2), speciDelloc)); 

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

xlswrite(fullfile(dataDir, 'clean-v6.xlsx'), predict_matcase); 