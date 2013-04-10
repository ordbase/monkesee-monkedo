# encoding: utf-8

module PartHelper

  def render_bookmarks( bookmarks, opts={} )

    render :partial => 'shared/bookmarks',
           :locals => { :bookmarks => bookmarks,
                        :allow_edits => (opts[:edit].present? ? true : false) }
  end
  
  def render_tags( tags )
    render :partial => 'shared/tags', :locals => { :tags => tags }
  end

  def render_beers( beers )
    render :partial => 'shared/beers', :locals => { :beers => beers }
  end


end # PartHelper
