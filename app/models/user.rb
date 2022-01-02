# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  account         :string
#  password_digest :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role_id         :integer
#

class User < ApplicationRecord
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  has_secure_password :password
  has_many :issues, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :role
end
