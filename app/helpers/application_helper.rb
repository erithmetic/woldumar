module ApplicationHelper
  def slider_image_tags
    image_tags = Dir.glob("#{Rails.root}/public/images/slider/*").map do |filename|
      <<-EOF
<img src="/#{filename.split(/\//)[-3..-1].join("/")}" alt="">
      EOF
    end

    yield image_tags if block_given?
    raw(image_tags.join(""))
  end
  
  def slider_javascript_tag(options = {})
    slider_id = options[:id].is_a?(String) ? options[:id] : "slider"
    js = "$(window).load(function() { $('##{slider_id}').nivoSlider(); });" 
    
    yield js if block_given?
    javascript_tag js
  end
end
