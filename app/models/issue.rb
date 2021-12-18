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
#

class Issue < ApplicationRecord
  enum priority: { low: 'low', medium: 'medium', high: 'high' }
  enum status: { pending: 'pending', on_going: 'on_going', done: 'done' }
end
