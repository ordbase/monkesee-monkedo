# encoding: utf-8

module PartHelper

  def render_bookmarks( bookmarks, opts={} )

    render partial: 'shared/bookmarks',
           locals: { bookmarks: bookmarks,
                     allow_edits: (opts[:edit].present? ? true : false) }
  end

  def render_tags( tags )
    render partial: 'shared/tags', locals: { tags: tags }
  end

  def render_brewery_tags( brewery )
    # NB: will include "pseudo" tags such as production/capacity in hl and others
    render partial: 'shared/brewery_tags', locals: { brewery: brewery }
  end

  def render_beers( beers )
    render partial: 'shared/beers', locals: { beers: beers }
  end


  def render_breweries_for_region( region )
    render partial: 'shared/breweries_for_region', locals: { region: region }
  end

  def render_breweries_for_country( country )
    render partial: 'shared/breweries_for_country', locals: { country: country }
  end


end # PartHelper
