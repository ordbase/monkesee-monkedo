# encoding: utf-8

module RoutesHelper

  ##############################
  ## routes for shortcuts
  
  def short_country_path( country, opts={} )
    short_country_worker_path( country.key, opts )
  end

=begin
  def short_tag_path( tag, opts={} )
    ## NB: tag needs slug NOT key (key may contain spaces)
    short_tag_worker_path( tag.slug, opts )
  end
=end

end # module RoutesHelper