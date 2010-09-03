require 'ffi'

module GeoHash
  class Library
    def self.detect_lib
      if defined?(GEOHASH_LIB)
        GEOHASH_LIB
      elsif ENV["GEOHASH_LIB"]
        ENV["GEOHASH_LIB"]
      else
        "libgeohash.so"
      end
    end
  end

  class GeoCord < FFI::Struct
    layout :latitude, :double,
      :longitude, :double,
      :north, :double,
      :east, :double,
      :south, :double,
      :west, :double
  end

  class Wrapper
    extend FFI::Library

    ffi_lib GeoHash::Library.detect_lib

    attach_function(:geohash_encode, [:double, :double, :int], :string)
    attach_function(:geohash_decode, [:string], GeoCord.by_value)
    attach_function(:geohash_neighbors, [:string], :pointer)
  end

  class << self
    def encode(lat, lng, precision = 12)
      Wrapper.geohash_encode(lat, lng, precision)
    end

    def decode(geohash)
      coord = Wrapper.geohash_decode(geohash)
      {:lat => coord[:latitude].to_f, :lng => coord[:longitude].to_f}
    end

    def neighbors(geohash)
      neighbors = Wrapper.geohash_neighbors(geohash)
      neighbors.get_array_of_string(0,8)
    end
  end
end
