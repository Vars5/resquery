class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role
  # attr_accessible :title, :body
  
  #Associations
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships
  has_many :comments
  
  #Notification
  has_many :notifications, dependent: :destroy
  
  
end
