class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one :address
  has_one_attached :avatar, :dependent => :destroy
  validates :avatar, attached: true, content_type: [:png, :jpg, :jpeg]
  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do 
      | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
