class User < ApplicationRecord
  has_many :projects

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  #, :confirmable, :lockable, :timeoutable, :trackable

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  before_validation :add_at

  private 
    def add_at
      self.username = "@#{self.username.delete(' @')}"
    end
end
