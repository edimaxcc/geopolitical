class Region
  include Mongoid::Document

  field :gid,    type: Integer  # geonames id
  field :slug,   type: String
  field :name,   type: String,  localize: true
  field :abbr,   type: String

  belongs_to :country

  has_many :cities, :dependent => :destroy

  scope :ordered, order_by(name: 1)

  validates :country, presence: true
  validates :name, presence: true

  validates_uniqueness_of :name, :abbr,  :scope => :country_id

end