# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe City do

  it { should belong_to(:country) }
  it { should belong_to(:province) }
  it { should have_many(:tracks) }

  it "should create a city" do
    blueprint_spec City
  end

  describe "Geoenabled" do
    before do
      City.create_indexes
    end

    it "should find closest one" do
      city = City.make!
      City.closest_to(city.geom).should eql(city)
    end

  end

  describe "Failure" do

    it "should have a name" do
      city = City.make :name => nil
      city.should_not be_valid
      city.should have(1).errors_on(:name)
    end

  end
#   it { should have_indices :name, :geom, :area, [:province_id, :country_id] }


#   it "should accept an area" do
#     @city = City.make(:area =>  Polygon.from_coordinates([[[0,0],[4,0],[4,4],[0,4],[0,0]],[[1,1],[3,1],[3,3],[1,3],[1,1]]]))
#     @city.area.should be_instance_of(Polygon)
#   end

#   describe "some helpers" do
#     it "should have some nice x y z" do
#       @city = City.make
#       @city.should respond_to(:x,:y,:z)
#     end
#   end

#   describe "Find by proximity" do

#     def pt(x,y);      Point.from_x_y(x,y); end

#     before(:each) do
#       @perto = City.make!(:geom => pt(10,10))
#       @medio = City.make!(:geom => pt(20,20))
#       @longe = City.make!(:geom => pt(30,30))
#       @ponto = pt(12,12)
#     end

#     it "should find the closest city" do
#       @city = City.close_to(@ponto).first
#       @city.should eql(@perto)
#     end

#     it "should find the closest city to make sure" do
#       ponto = pt(22,22)
#       @city = City.close_to(ponto).first
#       @city.should eql(@medio)
#     end

#     it "should find the closest" do
#       @poi = City.close_to(@ponto).first(2)
#       @poi.should eql([@perto,@medio])
#     end
#   end
end







# == Schema Information
#
# Table name: cities
#
#  id          :integer         not null, primary key
#  country_id  :integer         not null, indexed
#  province_id :integer         indexed
#  name        :string(50)      not null, indexed
#  gid         :integer         indexed
#  zip         :integer         indexed
#  geom        :geometry        point, 4326, indexed
#  area        :geometry        polygon, 4326, indexed
#
# Indexes
#
#  index_cities_on_area         (area)
#  index_cities_on_country_id   (country_id)
#  index_cities_on_geom         (geom)
#  index_cities_on_gid          (gid)
#  index_cities_on_name         (name)
#  index_cities_on_province_id  (province_id)
#  index_cities_on_zip          (zip)
#
