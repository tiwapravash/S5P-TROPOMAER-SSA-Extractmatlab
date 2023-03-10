%%%%%%Extracting the TROPMI datasets into CSV%%%%%%%%%%%%
clc
close all
clear all
%%load all the netcdf files in the directory
files=dir(['*.','nc']);
%%Create a null array
aa1=[];
for ii=1:size(files,1)
filename = files(ii).name;
date1=ncread(filename,'/GEODATA/delta_time'); %Read time offset from reference time, this is the orbital time of satelltie
date1 = date1*0.001;
date1=double(date1);
date2=repmat(date1,1,450);
date3 = reshape(date2,[3245*450,1]);
date = datetime(date3, 'ConvertFrom','epochtime','Epoch','30-April-2018 00:00:00','Format', 'dd-MMM-yyyy HH:mm:SS');
date=posixtime(date); %%%  number of seconds elapsed since January 1, 1970 00:00:00 UTC
lat = ncread(filename,'/GEODATA/latitude'); %%Read latitude
lon = ncread(filename,'/GEODATA/longitude'); %% Read longitude
ssa = ncread(filename,'/SCIDATA/FinalAerosolSingleScattAlb'); %Read Scidata Final SSA%%
flag = ncread(filename,'/SCIDATA/FinalAlgorithmFlags'); %%Read the Flags for data QA
idx = find(flag~=1);
ssa(idx)= NaN; %%All data with corresponding flag value other than 1 are discarded
ssa=double(ssa);
lat=double(lat);
lat=transpose(lat);
lon=double(lon);
lon=transpose(lon);
ssa2=squeeze(ssa(2,:,:)); %388
ssa2=transpose(ssa2);
Lon=reshape(lon,[3245*450,1]);
Lat=reshape(lat,[3245*450,1]);
SSA2=reshape(ssa2,[3245*450,1]);
ssa_trop=[date,Lon,Lat,SSA2];
ssa_trop1 = array2table( ssa_trop ); 
ssaclean=ssa_trop1(~any(ismissing(ssa_trop1),2),:);
%bb1=table2array(ssaclean);
aa1=[aa1;table2array(ssaclean)];
end
