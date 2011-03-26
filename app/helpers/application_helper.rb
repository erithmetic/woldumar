module ApplicationHelper
  def slider_image_tags
    image_tags = Dir.glob("#{Rails.root}/public/images/slider/*").map do |filename|
      <<-EOF
<img src="/#{filename.split(/\//)[-3..-1].join("/")}" alt="">
      EOF
    end.join("")

    raw image_tags
  end
  
  def slider_javascript_tag(slider_id)
    javascript_tag "$(window).load(function() { $('##{slider_id}').nivoSlider(); });" 
  end
end
