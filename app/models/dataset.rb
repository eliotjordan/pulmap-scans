class Dataset < ActiveRecord::Base
  self.table_name = 'geodata'
  default_scope { where(item_type: 'dataset') }

  validates :title, presence: true

  validates :access, 
    presence: true,
    inclusion: { in: [ 'public', 'campus', 'private' ],
    message: "%{value} is not a valid access value" }

  before_create :set_ark
  after_update :update_ark

  def item_url
    ENV['EZID_DEFAULT_RESOLVER'] + self.ark
  end

  def self.search(search)
    if search
      where('title LIKE ? or '\
        'author LIKE ? or '\
        'description LIKE ? or '\
        'image_id=? or '\
        'bib_id=? or '\
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
