class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  

  # Checking if registered user
  def has_role?(requested_role)
    @role == requested_role 
  end

  def self.assign_role
    @role = "registered"
  end

end
