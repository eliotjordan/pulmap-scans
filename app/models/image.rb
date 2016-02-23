class Image < ActiveRecord::Base
  self.table_name = 'geodata'
  default_scope { where(item_type: 'scan') }

  validates :title, presence: true

  validates :access, 
    presence: true,
    inclusion: { in: [ 'public', 'campus', 'private' ],
    message: "%{value} is not a valid access value" }

  before_create :set_ark
  after_update :update_ark

  def default_desc
    "This map was scanned with a Chroma Tx 40 Plus Wide Format scanner and " \
    "WIDEimage 2.8 software at 400 DPI in 24-bit color. The image was then " \
    "reduced to 256 colors."
  end

  def item_url
    ENV['EZID_DEFAULT_RESOLVER'] + self.ark
  end

  def self.search(search, search_type)
    if search
      case search_type
      when 'keyword'
       where('title LIKE ? or '\
        'author LIKE ? or '\
        'description LIKE ? or '\
        'publisher LIKE ? or ' \
        'pub_info LIKE ?',
        "%#{search}%",
        "%#{search}%",
        "%#{search}%",
        "%#{search}%",
        "%#{search}%")
      when 'ark'
        where('ark=? ',
          "#{search}")
      when 'bib_id'
        where('bib_id=? ',
          "#{search.to_i}")
      when 'image_id'
        where('image_id=? ',
          "#{search.to_i}")
      end
    else
      all
    end
  end

  def set_ark

    # mint ark with EZID
    identifier = Ezid::Identifier.create()

    # set ARK target
    noid = identifier.id.split('/')[-1]
    identifier.target = self.target_base + noid
    identifier.save

    # set ark property to noid value
    self.ark = noid
  end

  # updates ark target if copyright status changes
  def update_ark
    if self.copyright_changed?
      identifier = Ezid::Identifier.find(full_ark)
      noid = identifier.id.split('/')[-1]
      identifier.target = self.target_base + noid
      identifier.save
    end
  end

  def full_ark
    if Rails.env.production?
      ENV['EZID_DEFAULT_SHOULDER'] + self.ark
    else
      ENV['EZID_DEFAULT_SHOULDER'][0..-4] + self.ark
    end
  end

  # base target url for ark
  def target_base
    if self.copyright == false
      ENV['EZID_TARGET_BASE']
    else
      "http://map.princeton.edu/offline/copyright.html#"
    end
  end
end
