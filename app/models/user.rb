# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  account            :string
#  encrypted_password :string
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ApplicationRecord
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password :password
end
