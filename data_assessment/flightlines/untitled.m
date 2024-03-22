%extracts the lat, lon variables from the netcdf data and plots them in 
%    polar stereographic coordinates

netcdfdir = '/Users/imck0002/Desktop/layertraacing/netcdf_data/'; %EDIT to the path that has the netcdf files

filenames={'IR2HI1B_2011001_ASB_JKB2d_GL0234a_010'};

figure
hold on

for i=1:length(filenames)
	fname = [netcdfdir filenames{i} '.nc'];
	lat=ncread(fname,'lat');
	lon=ncread(fname,'lon');
	[x,y]=ll2xy(lat,lon,-1);
	plot(x,y)
	%scatter(x,y,20,isochrone_depth,'filled') %plots plan-view isochrone depth as function of x,y coordinate
	text(x(1),y(1),num2str(i))
	lats{i}=lat;
	lons{i}=lon;
	xs{i}=x;
	ys{i}=y;

end

lawdome_lat = 66.7667;
lawdome_lon = 112.8167;

[ldx,ldy]=ll2xy(lawdome_lat,lawdome_lon,-1);
plot(ldx,ldy,'rx')

legend(filenames)

