class Image < ActiveRecord::Base
  validates :title, presence: true
  validates :bibid, numericality: { only_integer: true,
    message:"not a valid bidid" }


  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
