%%%%%%Calculate the area around 100km of DHAKA University AERONET Site%%%%%
%%aa1 is the clean ssa data, where all NAN were removed%%
%%Now we compute all the data in TROPOMI that is around 100 km of the AERONET station
%%Lat lon from aeronet%%
dhakalat=23.72839;
dhakalon=90.39819;
%%Convert degree to radian%% (AERONET COORDINATE)
dhakalatrad=deg2rad(dhakalat);
dhakalonrad=deg2rad(dhakalon);
%%Convert degree to radian%% (TROPOMI COORDINATE)
lonrad= deg2rad(aa1(:,2));
latrad= deg2rad(aa1(:,3));
%%%%Lets calculate the distance between each point of tropomi with the AEORNET data using equation below%%%
%dist = arccos(sin(lat1) *sin(lat2) + cos(lat1) *cos(lat2) * cos(lon1 -lon2)) · ER(km)
aa1(:,5) = deg2rad(aa1(:,2));
aa1(:,6) = deg2rad(aa1(:,3));
dhakalatrad=deg2rad(dhakalat);
dhakalonrad=deg2rad(dhakalon);
aa1(:,7)=sin(aa1(:,6)).*sin(dhakalatrad);
aa1(:,8)=cos(aa1(:,6)).*cos(dhakalatrad);
aa1(:,9)=cos(aa1(:,5) - dhakalonrad);
aa1(:,10)=acos(aa1(:,7)+aa1(:,8).*aa1(:,9)).*6371;
%% Subset only those data that are within 100km from AERONET station
idx = aa1(:,10) <= 100;
aa2=aa1(idx,:);
