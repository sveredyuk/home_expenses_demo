require 'rails_helper'

RSpec.describe 'Home page' do
  it 'has title text' do
    visit '/'

    within 'header' do
      expect(page).to have_content 'Home expenses'
    end
  end
end
