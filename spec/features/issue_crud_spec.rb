require 'rails_helper'

RSpec.describe 'Issue CRUD', type: :feature do
  scenario 'create a new issue' do
    visit '/issues/new'

    fill_in 'issue_title', with: '測試1號問題'
    fill_in 'issue_content', with: '這是測試1號問題'
    fill_in 'issue_priority', with: 'low'
    fill_in 'issue_status', with: 'done'
    fill_in 'issue_started_at', with: '2021-01-02'
    fill_in 'issue_finished_at', with: '2021-02-05'

    click_button 'Create Issue'
  end
end
