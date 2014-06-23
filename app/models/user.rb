class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :questions
  has_many :answers
  acts_as_voter
  def to_s
    "#{name} #{surname}"
  end

  after_save :if_awesome?

  private

  def if_awesome?
    unless self.awesome
      self.update(awesome: true) if self.points >= 1000
    end
  end
end
