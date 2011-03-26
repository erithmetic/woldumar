# This file contains all the asset expansions for the project.

# Stylesheet expansions - add new stylesheets here according to group. Should explain itself.
ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :screen => ['screen', 'nivo-slider']
ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :print => ['print']
ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :ie => ['ie']

# JavaScript expansions - order is semi-crucial
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => ['jquery', 'jquery-ui', 'rails', 'jquery.nivo.slider', 'jsddm']
