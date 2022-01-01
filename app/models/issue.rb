# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :string
#  priority    :string
#  status      :string
#  started_at  :date
#  finished_at :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#

class Issue < ApplicationRecord
  PRIORITY_ORDERS = %w[high medium low].freeze
  enum priority: { low: 'low', medium: 'medium', high: 'high' }
  enum status: { pending: 'pending', on_going: 'on_going', done: 'done' }
  belongs_to :user
  has_many :issue_tag_join_tables
  has_many :tags, through: :issue_tag_join_tables

  scope :sort_by_priority_name_asc, -> {
    order_by = ['CASE']
    PRIORITY_ORDERS.each_with_index do |priority, index|
      order_by << "WHEN priority='#{priority}' THEN #{index}"
    end
    order_by << 'END'
    order(Arel.sql(order_by.join(' ')))
  }
  scope :sort_by_priority_name_desc, -> {
    order_by = ['CASE']
    PRIORITY_ORDERS.reverse.each_with_index do |priority, index|
      order_by << "WHEN priority='#{priority}' THEN #{index}"
    end
    order_by << 'END'
    order(Arel.sql(order_by.join(' ')))
  }

  def tag_list=(names)
    self.tags = names.split(',').map do |item|
      Tag.where(title: item.strip, user_id: user_id).first_or_create!
    end
  end

  class << self
    def ransortable_attributes(auth_object = nil)
      ransackable_attributes(auth_object) + %w(
        sort_by_priority_name_asc sort_by_priority_name_desc
      )
    end
  end
end
