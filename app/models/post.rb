class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  after_initialize :init

  def init
    self.views = 0
    self.likes = 0
  end
end
