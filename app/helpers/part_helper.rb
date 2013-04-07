# encoding: utf-8

module PartHelper

  def render_bookmarks( bookmarks, opts={} )

    render :partial => 'shared/bookmarks',
           :locals => { :bookmarks => bookmarks,
                        :allow_edits => (opts[:edit].present? ? true : false) }
  end

end # PartHelper
