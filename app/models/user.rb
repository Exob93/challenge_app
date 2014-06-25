class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :questions
  has_many :answers
  acts_as_voter
  def to_s
    unless name.present? && surname.present?
      email
    else
      "#{name} #{surname}"
    end
  end
  has_attached_file :avatar, :styles => { :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  after_save :if_awesome?

  private

  def if_awesome?
    unless self.awesome
      self.update(awesome: true) if self.points >= 1000
    end
  end
end
