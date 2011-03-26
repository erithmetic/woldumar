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

  def javascripts
    @output = ""
    package = params[:package].to_sym
    script_map = {
      :woldumar => ['jquery', 'jquery-ui', 'rails', 'jquery.nivo.slider', 'jsddm', 'application']
    }

    if not script_map[package].nil?
      script_map[package].map! {|script| "#{Rails.root}/app/javascripts/#{params[:package]}/#{script}.js"}
      script_map[package].each {|file| @output += File.open(file, 'r').read}
    end

    response.headers['Cache-Control'] = "public, max-age=#{1.year.seconds.to_i}" unless Rails.env.development?
    response.content_type = 'text/javascript'
    render :text => @output
  end
end
