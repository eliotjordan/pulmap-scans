class Image < ActiveRecord::Base
  validates :title, presence: true
  validates :bibid, :allow_blank => true, numericality: { only_integer: true,
    message:"not a valid bidid" }
  before_create :set_ark

  def set_ark
    # base url for image viewer
    target_base = ENV['EZID_TARGET_BASE']

    # mint ark with EZID
    identifier = Ezid::Identifier.create()

    # set ARK target
    noid = identifier.id.split('/')[-1]
    identifier.target = target_base + noid
    identifier.save

    # set ark property to noid value
    self.ark = noid
  end

  def item_url
    ENV['EZID_DEFAULT_RESOLVER'] + self.ark
  end

  def self.search(search)
    if search
      where('title LIKE ? or '\
        'author LIKE ? or '\
        'description LIKE ? or '\
        'id=? or '\
        'bibid=? or '\
        'ark=? ',
        "%#{search}%",
        "%#{search}%",
        "%#{search}%",
        "#{search.to_i}",
        "#{search.to_i}", 
        "#{search}")
    else
      all
    end
  end
end
