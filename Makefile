clean: topojson
	rm -rf tmp/

topojson: geojson
	topojson \
		--id-property ISO2 \
		--properties NAME \
		--simplify-proportion .5 \
		--out TopoJSON/europe.topojson \
		GeoJSON/europe.geojson

geojson: rmGeojson
	ogr2ogr \
		-f GeoJSON \
		GeoJSON/europe.geojson \
		tmp/shp/europe.shp

rmGeojson: mkdir
	rm -f GeoJSON/europe.geojson

mkdir: shp
	mkdir -p tmp
	mkdir -p GeoJSON
	mkdir -p TopoJSON

shp:
	wget -P tmp/shp https://dl.dropboxusercontent.com/u/11360570/maps/Europe/europe.shp
	wget -P tmp/shp https://dl.dropboxusercontent.com/u/11360570/maps/Europe/europe.dbf
	wget -P tmp/shp https://dl.dropboxusercontent.com/u/11360570/maps/Europe/europe.prj
	wget -P tmp/shp https://dl.dropboxusercontent.com/u/11360570/maps/Europe/europe.qpj
	wget -P tmp/shp https://dl.dropboxusercontent.com/u/11360570/maps/Europe/europe.shx
