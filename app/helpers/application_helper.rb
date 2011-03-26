require 'nav_item'

module ApplicationHelper
  def cached_stylesheet_tag(package, options = {})
    last_modified_date = Dir.glob("#{Rails.root}/app/stylesheets/#{package}").map {|file| File.mtime(file).to_i}.max
    full_stylesheet_path = stylesheet_path(package) + "?" + last_modified_date.to_s
  
    yield full_stylesheet_path if block_given?
    stylesheet_link_tag full_stylesheet_path, options
  end
  
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
          NavItem.new('History', page_path('about_us/history')),
          NavItem.new('Nature areas', page_path('about_us/nature_areas')),
          NavItem.new('News', page_path('about_us/news')),
          NavItem.new('Staff &amp; board', page_path('about_us/staff_and_board')),
          NavItem.new('Employment', page_path('about_us/employment'))
        ]
      },
      'Activities' => {
        page_path('activities') => [
          NavItem.new('Field trips', page_path('activites/field_trips')),
          NavItem.new('Camps', page_path('activites/camps')),
          NavItem.new('Upcoming events', upcoming_events_path),
          NavItem.new('TRAC team building', page_path('activites/trac_team_building'))
        ]
      },
      'Services' => {
        page_path('services') => [
          NavItem.new('Bird seed', page_path('services/bird_seed')),
          NavItem.new('Native plants', page_path('services/native_plants')),
          NavItem.new('Honey', page_path('services/honey')),
          NavItem.new('Rentals', page_path('services/rental'))
        ]
      },
      'Get Involved' => {
        page_path('get_involved') => [
          NavItem.new('Donations', new_donation_path),
          NavItem.new('Membership', page_path('get_involved/membership')),
          NavItem.new('Volunteer', page_path('get_involved/volunteer')),
          NavItem.new('Wish list', page_path('get_involved/wish_list'))
        ]
      },
      'Contact us' => {
        page_path('contact_us') => [
          NavItem.new('Hours', page_path('contact_us/hours')),
          NavItem.new('Directions', page_path('contact_us/directions')),
          NavItem.new('Site map', page_path('contact_us/site_map'))
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
