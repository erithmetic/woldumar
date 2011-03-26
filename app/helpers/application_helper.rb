require 'nav_item'

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
    
    options.delete(:id) if not options[:id].nil?
    options_js = if options.empty?
                   ""
                 else
                   "{" + Array.new(options.keys.count) do
                     pair = options.shift
                     "#{pair.first}: #{pair.last.is_a?(String) ? "'#{pair.last}'" : pair.last}"
                   end.join(", ") + "}"
                 end

    js = "$(window).load(function() { $('##{slider_id}').nivoSlider(#{options_js}); });" 
    
    yield js if block_given?
    javascript_tag js
  end

  def navs
    {
      'Home' => root_path,
      'About us' => {
        page_path('about_us') => [
          NavItem.new('History', page_path('history')),
          NavItem.new('Nature areas', page_path('nature_areas')),
          NavItem.new('News', page_path('news')),
          NavItem.new('Staff &amp; board', page_path('staff_and_board')),
          NavItem.new('Employment', page_path('employment'))
        ]
      },
      'Activities' => {
        page_path('activities') => [
          NavItem.new('Field trips', page_path('field_trips')),
          NavItem.new('Camps', page_path('camps')),
          NavItem.new('Upcoming events', upcoming_events_path),
          NavItem.new('TRAC team building', page_path('trac_team_building'))
        ]
      },
      'Services' => {
        page_path('services') => [
          NavItem.new('Bird seed', page_path('bird_seed')),
          NavItem.new('Native plants', page_path('native_plants')),
          NavItem.new('Honey', page_path('honey')),
          NavItem.new('Rentals', page_path('rental'))
        ]
      },
      'Get Involved' => {
        page_path('get_involved') => [
          NavItem.new('Donations', new_donation_path),
          NavItem.new('Membership', page_path('membership')),
          NavItem.new('Volunteer', page_path('volunteer')),
          NavItem.new('Wish list', page_path('wish_list'))
        ]
      },
      'Contact us' => {
        page_path('contact_us') => [
          NavItem.new('Hours', page_path('hours')),
          NavItem.new('Directions', page_path('directions')),
          NavItem.new('Site map', page_path('site_map'))
        ]
      }
    }
  end

  def nav_bar
    output = "<ul class=\"site_nav\">\n"
    navs.each do |top_name, top_path|
      if top_path.is_a? Hash
        output += "<li>\n" 
        output += link_to(top_name, top_path.keys.first) + "\n"
        output += "<ul>\n"
        top_path[top_path.keys.first].each do |nav_item|
          output += "<li>" + link_to(nav_item.name, nav_item.path) + "</li>\n"
        end
        output += "</ul>\n"
        output += "</li>\n"
      else
        output += "<li>" + link_to(top_name, top_path) + "</li>\n"
      end
    end
    output += "</ul>"
    output.html_safe
  end

  def date_range(start, stop)
    if start && stop
      "from #{start.strftime('%A, %B %e, %Y')} to #{stop.strftime('%A, %B %e, %Y')}"
    elsif start
      "on #{start.strftime('%A, %B %e, %Y')}"
    end
  end
end
