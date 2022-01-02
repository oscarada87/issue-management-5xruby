require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:example) do
    Role.create(name: 'user')
    Role.create(name: 'admin')
  end

  scenario 'sign up' do

    visit '/'
    click_button '註冊'

    fill_in '帳號', with: 'test12345'
    fill_in '密碼', with: 'test12345'
    fill_in '暱稱', with: 'test_account'
    click_button 'commit'
    expect(User.count).to eq(1)
  end

  scenario 'login / sign out' do
    User.create(account: 'test123', password: 'test123', role: Role.find_by(name: 'user'))
    visit 'users/sign_in'
    fill_in '帳號', with: 'test123'
    fill_in '密碼', with: 'test123'
    click_button 'commit'
    expect(page).to have_content('登出')
    click_button '登出'
    expect(page).to have_content('登入')
    expect(page).to have_content('註冊')
  end
end
