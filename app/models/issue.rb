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

  class << self
    def ransortable_attributes(auth_object = nil)
      ransackable_attributes(auth_object) + %w(
        sort_by_priority_name_asc sort_by_priority_name_desc
      )
    end
  end
end
