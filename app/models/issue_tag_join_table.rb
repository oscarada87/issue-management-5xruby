# == Schema Information
#
# Table name: issue_tag_join_tables
#
#  id       :integer          not null, primary key
#  tag_id   :integer          not null
#  issue_id :integer          not null
#

class IssueTagJoinTable < ApplicationRecord
  belongs_to :issue
  belongs_to :tag
end
