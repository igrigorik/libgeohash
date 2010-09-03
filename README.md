GeoHash
=======

FFI Ruby wrapper for [SimpleGeo's libgeohash](http://github.com/simplegeo/libgeohash).

    GeoHash.encode(42.60498046875, -5.60302734375, 5) # => 'ezs42'
    GeoHash.decode('ezs42')   # => {:lat => 42.60498046875, :lng => -5.60302734375}
    Geohash.neighbors('ezs42) # => ["ezs48", "ezs49", "ezs43", "ezs41", "ezs40", "ezefp", "ezefr", "ezefx"]

What's a GeoHash?
----------------

Geohash is a latitude/longitude geocode system invented by Gustavo Niemeyer when writing the web service at geohash.org, and put into the public domain. It is a hierarchical spatial data structure which subdivides space into buckets of grid shape.
Geohashes offer properties like arbitrary precision and the possibility of gradually removing characters from the end of the code to reduce its size (and gradually lose precision).

As a consequence of the gradual precision degradation, nearby places will often (but not always) present similar prefixes. On the other side, the longer a shared prefix is, the closer the two places are.

 - [Wikipedia article](http://en.wikipedia.org/wiki/Geohash)
 - [GeoHash site](http://geohash.org/site/tips.html)
 - [JS Demo](http://openlocation.org/geohash/geohash-js/)

Credits
-------

 - Derek Smith - libgeohash author
 - Ilya Grigorik - FFI wrapper