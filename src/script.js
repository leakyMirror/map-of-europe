var fs = require('fs')
  , d3 = require('d3')
  , _ = require('underscore')
  , europe = require('./src/countries.js').countries

function prettyJSON(obj) {
  console.log(JSON.stringify(obj, null, 2))
}

fs.readFile('map.geojson', 'utf8', function(err, geojson) {
  var map = JSON.parse(geojson)

  fmap = map.features.filter(function(country) {
    return _.contains(europe, country.properties.ISO2)
  })

  main = { type: 'FeatureCollection', 'features': [] }
  main.features = fmap

  main = JSON.stringify(main, null, 2)

  fs.writeFile('fix.json', main)
})
