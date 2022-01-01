# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  belongs_to :user
  has_many :issue_tag_join_tables
  has_many :issues, through: :issue_tag_join_tables

  scope :by_user, -> (user_id) { where(user_id: user_id) }
end
