#
# User created zones
class Zone
  include Mongoid::Document

  field :gid,    type: Integer  # geonames id
  field :slug,   type: String
  field :name,   type: String,  localize: true
  field :i18n,   type: String,  localize: true
  field :abbr,   type: String
  field :kind,   type: String

  has_many :members, class_name: "Zone::Member", dependent: :destroy

  scope :ordered, order_by(name: 1)

  # validates :name, presence: true# , uniqueness: true

  def to_s
    name
  end

  def self.icon
    "globe"
  end

  # Zone::Member
  class Member
    include Mongoid::Document

    belongs_to :zone
    belongs_to :member, polymorphic: true
  end

  def self.icon
    "globe"
  end
end
