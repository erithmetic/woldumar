class AssetsController < ApplicationController
  def index
    @output = ""
    package = params[:package].to_sym
    
    css_packages = {
      :screen => ['reset', 'layout', 'typography', 'home', 'pic_rotator', 'jdd'],
      :print => [],
      :ie => []
    }
    js_packages = {
      :woldumar => ['jquery', 'pic_rotator', 'jquery-ui', 'rails', 'jsddm', 'application']
    }

    case params[:type]
    when :css
      if not css_packages[package].nil?
        sass_options = {:syntax => :scss, :style => Rails.env.development? ? :compact : :compressed}
        css_packages[package].map! {|sheet| "#{Rails.root}/app/stylesheets/#{params[:package]}/#{sheet}.scss"}
        css_packages[package].each {|file| @output += Sass::Engine.new(File.open(file, 'r').read, sass_options).render}
      end

      response.content_type = 'text/css'
    when :js
      if not js_packages[package].nil?
        js_packages[package].map! {|script| "#{Rails.root}/app/javascripts/#{params[:package]}/#{script}.js"}
        js_packages[package].each {|file| @output += File.open(file, 'r').read}
      end

      response.content_type = 'text/javascript'
    end

    response.headers['Cache-Control'] = "public, max-age=#{1.year.seconds.to_i}" unless Rails.env.development?
    render :text => @output
  end
end
