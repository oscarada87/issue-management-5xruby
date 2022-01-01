require 'rails_helper'

RSpec.describe 'Issue CRUD', type: :feature do
  before(:example) do
    User.create(account: 'test123', password: 'test123')
  end

  scenario 'create a new issue' do
    log_in
    visit '/issues/new'

    fill_in 'issue_title', with: '測試1號問題'
    fill_in 'issue_content', with: '這是測試1號問題'
    select '低', from: 'issue_priority'
    select '等待中', from: 'issue_status'
    fill_in 'issue_started_at', with: '2021-01-02'
    fill_in 'issue_finished_at', with: '2021-02-05'
    fill_in 'issue_tag_list', with: '標籤1, 標籤2'

    click_button '新增問題'
    expect(Issue.count).to eq(1)
  end

  scenario 'create a new issue and delete' do
    log_in
    visit '/issues/new'

    fill_in 'issue_title', with: '測試1號問題'
    fill_in 'issue_content', with: '這是測試1號問題'
    select '低', from: 'issue_priority'
    select '等待中', from: 'issue_status'
    fill_in 'issue_started_at', with: '2021-01-02'
    fill_in 'issue_finished_at', with: '2021-02-05'
    fill_in 'issue_tag_list', with: '標籤1, 標籤2'

    click_button '新增問題'
    click_button '刪除'
    expect(Issue.count).to eq(0)
  end

  scenario 'create a new issue and modify' do
    log_in
    visit '/issues/new'

    fill_in 'issue_title', with: '測試1號問題'
    fill_in 'issue_content', with: '這是測試1號問題'
    select '低', from: 'issue_priority'
    select '等待中', from: 'issue_status'
    fill_in 'issue_started_at', with: '2021-01-02'
    fill_in 'issue_finished_at', with: '2021-02-05'
    fill_in 'issue_tag_list', with: '標籤1'

    click_button '新增問題'
    click_button '編輯'
    fill_in 'issue_title', with: '測試2號問題'
    select '中', from: 'issue_priority'
    click_button '更新問題'

    expect(Issue.find_by(title: '測試2號問題').priority).to eq('medium')
  end

  def log_in
    visit 'users/sign_in'
    fill_in '帳號', with: 'test123'
    fill_in '密碼', with: 'test123'
    click_button 'commit'
  end
end
