class AssetsController < ApplicationController
  def stylesheets
    @output = ""
    sheet_path = "#{Rails.root}/app/stylesheets/#{params[:package]}"
    sheet_list = Dir.glob(sheet_path + "/*.scss")
    if sheet_list.delete(sheet_path + "/reset.scss")
      sheet_list.insert 0, sheet_path + "/reset.scss"
    end
    
    sass_options = {:syntax => :scss}
    sass_options[:style] = :compressed unless Rails.env.development?
    sheet_list.each do |file|
      @output += Sass::Engine.new(File.open(file, 'r').read, sass_options).render
    end

    response.headers['Cache-Control'] = "public, max-age=#{1.year.seconds.to_i}" unless Rails.env.development?
    response.content_type = 'text/css'
    render :text => @output
  end
end
