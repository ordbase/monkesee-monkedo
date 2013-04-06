
class User < ActiveRecord::Base


  before_save :on_before_save
  
  def on_before_save
    if email.blank?
      self.key = 'xxx'
    else
      # NB: remove whitespace and (.-+_) and downcase
      self.key = email.gsub( /[\s\.\-+_]/, '' ).downcase
    end
  end

end # class User
