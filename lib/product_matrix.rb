class ProductMatrix
  class << self
    def generate(category)
      products = Product.find :all, :conditions => { :category => category }, :order => :name
      grouped_products = products.group_by(&:name)

      max_options_count = 0
      grouped_products.each do |name, products|
        max_options_count = [max_options_count, products.length].max
      end

      matrix = []
      group.each do |name, products|
        row = { :name => name }
        row[:options] = Array.new(max_options_count)
        matrix.push row
      end
    end

    def populate
      [
        { :category => 'Birdseed', :name => 'Oil Sunflower', :option => '25 <abbrev title="pounds">lb</abbrev>', :price => 14.7 },
        { :category => 'Birdseed', :name => 'Oil Sunflower', :option => '50 <abbrev title="pounds">lb</abbrev>', :price => 28.0 },
        { :category => 'Birdseed', :name => 'Striped Sunflower', :option => '25 <abbrev title="pounds">lb</abbrev>', :price => 20.0 },
        { :category => 'Birdseed', :name => 'Striped Sunflower', :option => '50 <abbrev title="pounds">lb</abbrev>', :price => 39.0 },
        { :category => 'Birdseed', :name => 'WOLDUMIX', :option => '25 <abbrev title="pounds">lb</abbrev>', :price => 11.35 },
        { :category => 'Birdseed', :name => 'WOLDUMIX', :option => '50 <abbrev title="pounds">lb</abbrev>', :price => 21.6 },
        { :category => 'Birdseed', :name => 'Cracked Corn', :option => '20 <abbrev title="pounds">lb</abbrev>', :price => 5.5 },
        { :category => 'Birdseed', :name => 'Cracked Corn', :option => '50 <abbrev title="pounds">lb</abbrev>', :price => 11.0 },
        { :category => 'Birdseed', :name => 'Custom No Mess', :option => '10 <abbrev title="pounds">lb</abbrev>', :price => 10.00 },
        { :category => 'Birdseed', :name => 'Custom No Mess', :option => '20 <abbrev title="pounds">lb</abbrev>', :price => 19.00 },
        { :category => 'Birdseed', :name => 'Custom No Mess', :option => '40 <abbrev title="pounds">lb</abbrev>', :price => 37.00 },
        { :category => 'Birdseed', :name => 'Thistle', :option => '10 <abbrev title="pounds">lb</abbrev>', :price => 15.4 },
        { :category => 'Birdseed', :name => 'Thistle', :option => '20 <abbrev title="pounds">lb</abbrev>', :price => 21.8 },
        { :category => 'Birdseed', :name => 'Thistle', :option => '50 <abbrev title="pounds">lb</abbrev>', :price => 50.0 },
        { :category => 'Birdseed', :name => 'Sunflower Chips (med)', :option => '10 <abbrev title="pounds">lb</abbrev>', :price => 13.5 },
        { :category => 'Birdseed', :name => 'Sunflower Chips (med)', :option => '20 <abbrev title="pounds">lb</abbrev>', :price => 24.15 },
        { :category => 'Birdseed', :name => 'Sunflower Chips (med)', :option => '50 <abbrev title="pounds">lb</abbrev>', :price => 63.0 },
        { :category => 'Birdseed', :name => 'Safflower', :option => '10 <abbrev title="pounds">lb</abbrev>', :price => 10.5 },
        { :category => 'Birdseed', :name => 'Safflower', :option => '20 <abbrev title="pounds">lb</abbrev>', :price => 20.0 },
        { :category => 'Birdseed', :name => 'Safflower', :option => '50 <abbrev title="pounds">lb</abbrev>', :price => 45.0 },

        { :category => 'Wildflowers', :name => 'Anemone canadensis - Canada anemone', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Aquilegia canadensis - Columbine', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Aralia racemosa - Spikenard', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Arisaema triphyllum - Jack-in-the-pulpit', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Asclepias tuberosa - Butterfly Weed', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Chelone glabra - Turtlehead', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Coreopsis lanceolata - Sand Coreopsis', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Echinacea purpurea - Purple Coneflower', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Geranium maculatum - Wild Geranium', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Geum triflorum - Prairie Smoke', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Heracleum maximum - Cow Parsnip', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Iris virginica - Southern Blue Flag Iris', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Liatris aspera - Rough Blazing Star -', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Liatris spicata - Marsh Blazing Star -', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Lobelia siphilitica - Blue Lobelia -', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Monarda fistulosa - Bee-Balm', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Monarda punctata - Horsemint', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Penstemon digitalis - Beardtongue', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Ratibida pinnata - Yellow Coneflower', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Rudbeckia hirta - Black-Eyed Susan', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Senna hebecarpa - Wild Senna', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Silphium perfoliatum - Cup plant', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Stylophorum diphyllum - Wood Poppy', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Thalictrum dioicum - Early Meadow Rue', :price => 3.00 },
        { :category => 'Wildflowers', :name => 'Tradescantia ohiensis - Spiderwort', :price => 3.00 },

        { :category => 'Honey', :name => 'Woldumar Prairie Honey', :price => 7.5 }
      ].each do |product|
        Product.create! product
      end
    end
  end
end
