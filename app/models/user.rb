# class User < ApplicationRecord
#   include Clearance::User
# end

class User < ActiveRecord::Base
  include Clearance::User

  validates :email, uniqueness: true
  has_many :authentications, :dependent => :destroy
  has_many :listings


  def self.create_with_auth_and_hash(authentication, auth_hash)

    @first_name =  auth_hash["extra"]["raw_info"]["name"].split(" ")[1..-1].join(" ")
    @last_name = auth_hash["extra"]["raw_info"]["name"].split(" ")[0]

      #  user = User.create!(name: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"]) to amend
      user = User.create!(first_name: @first_name, last_name: @last_name, email: auth_hash["extra"]["raw_info"]["email"], password: SecureRandom.hex(6))
       user.authentications << (authentication)
       return user
   end

   def fb_token
     x = self.authentications.where(:provider => :facebook).first
     return x.token unless x.nil?
   end

end


  # def self.create_with_auth_and_hash(authentication,auth_hash)
  #   create! do |u|
  #     #u.first_name = auth_hash["info"]["first_name"]
  #     # u.last_name = auth_hash["info"]["last_name"]
  #     # u.friendly_name = auth_hash["info"]["name"]
  #     u.email = auth_hash["extra"]["raw_info"]["email"]
  #     u.password = SecureRandom.hex(6)
  #     u.authentications<<(authentication)
  #   end
  # end
  #
  # def fb_token
  #   x = self.authentications.where(:provider => :facebook).first
  #   return x.token unless x.nil?
  # end


  # def password_optional?
  #   true
  # end

# end
