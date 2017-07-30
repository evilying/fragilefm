clear; 

dataDir = '../'; 

namefile = '2121kids.csv'; 

% open file 
fileId = fopen(fullfile(dataDir, namefile), 'r'); 

% read first line 
% fgetl(fileId); 
% line = fgetl(fileId); 

% parameters
nrow = 2121; 
nCols = 12949; 

row = textscan(fileId, repmat('%s', 1, nCols), 'delimiter', ',', 'CollectOutput', true); 

%% start to processing the data 
for i = 1: nrow
    tic; 
    disp(['processing: ' num2str(i) 'th row']); 
    data(i, :) = str2double(row{1}(i, :)); 
    toc; 
end

fclose(fileId);
% matcase = zeros(nrow, nCols); 
% irow = 1; 
% 
% while (~feof(fileId))
% 
%     irow = irow + 1; 
%     
%     line = fgetl(fileId); 
%     matcase(irow, :) = sscanf(line, '%f'); 
% end

% xlswrite(fullfile(dataDir, 'clean.xlsx'), matcase); 