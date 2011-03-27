require 'spec_helper'
require 'product_matrix'

describe ProductMatrix do
  describe '.generate' do
    before :each do
      ProductMatrix.populate
    end
    it 'generates a birdseed matrix' do
      matrix = ProductMatrix.generate('Birdseed')
      puts matrix.inspect
      matrix.each { |row| row[:options].length.should == 3 }
      matrix.first[:name].should == 'Cracked Corn'
      matrix.length.should == 8
    end
    it 'generates a wildflower matrix' do
      matrix = ProductMatrix.generate('Wildflowers')
      matrix.each { |row| row[:options].price.should == 3.00 }
      matrix.first[:name].should =~ /Anemone/
      matrix.length.should == 25
    end
  end
end

