class Comment < ActiveRecord::Base
  
  belongs_to :icon
  belongs_to :user  
  attr_accessible :text
  validates_presence_of :text

  # and again - use *rabl* just done this way to keep it short
  def as_json(options={})
    super(include: :user)
  end

end
