%% Data Order link: https://disc.gsfc.nasa.gov/api/jobs/results/6524e74d8866352ab9a2d82f
%% Choose your are of Interest and Time frame in the from the get data option %%
%% Download the URL links of http files as text file once data is prepared.
%% Use the code below to download data using MATLAB in a batch mode
%% Code starts from below
clear; clc; close
% Read the list of URLs from the text file
urlFile = 'subset_TROPOMAER_1_20231010_062659_.txt'; %% Change with your data url list accordingly %%
fileID = fopen(urlFile, 'r');
urls = textscan(fileID, '%s', 'Delimiter', '\n');
fclose(fileID);

% Set your EarthData username and password
username = 'pt_4630';
password = '9841343095@Daddy';
% Set the options for the web request
options = weboptions('Username', username, 'Password', password);

% Loop through each URL and download the files
for i = 1:length(urls{1})
    url = urls{1}{i};
    [~, filename] = fileparts(url); % Extract the filename from the URL
    websave(filename, url, options);
    fprintf('Downloaded: %s\n', filename);
end
