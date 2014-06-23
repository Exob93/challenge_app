class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates_presence_of :contents
  acts_as_votable
end
