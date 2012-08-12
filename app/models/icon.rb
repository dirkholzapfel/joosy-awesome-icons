class Icon < ActiveRecord::Base
  
  has_many :comments
  attr_accessible :name, :description
  validates_presence_of :name, :description

  # hackish, ugly way to keep the project small! normally you would use something like *rabl* instead!
  def as_json(options={})
    super(include: { comments: { include: :user } })
  end

end
