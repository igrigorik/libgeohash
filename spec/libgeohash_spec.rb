require 'spec'
require 'lib/libgeohash'

describe GeoHash do
  context :encode do
    it "should encode a lng, lat to a geohash" do
      GeoHash.encode(42.60498046875, -5.60302734375, 1).should == 'e'
      GeoHash.encode(42.60498046875, -5.60302734375, 5).should == 'ezs42'
      GeoHash.encode(42.60498046875, -5.60302734375, 12).should == 'ezs427zzzzzz'
      GeoHash.encode(42.60498046875, -5.60302734375).should == 'ezs427zzzzzz'
    end

    it "should report error on bad encode" do
      lambda { GeoHash.encode }.should raise_error
      lambda { GeoHash.encode('a','b') }.should raise_error
    end
  end

  context :decode do
    it "should decode a geohash" do
      lat = 42.60498046875
      lng = -5.60302734375

      c = GeoHash.decode(GeoHash.encode(lat, lng, 5))
      c[:lat].should == lat
      c[:lng].should == lng
    end

    it "should report error on bad decode" do
      lambda { GeoHash.decode() }.should raise_error
      lambda { GeoHash.decode(5) }.should raise_error
    end
  end

  context :neighbors do
    it "should find neighbor geohashes" do
      n = ["ezs48", "ezs49", "ezs43", "ezs41", "ezs40", "ezefp", "ezefr", "ezefx"]
      GeoHash.neighbors('ezs42').should == n
    end

    it "should report error on bad neighbor input" do
      lambda { GeoHash.neighbors(1) }.should raise_error
    end
  end
end
