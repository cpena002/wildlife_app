require 'rails_helper'

RSpec.feature "Wildlives", type: :feature do
  context 'I can go to the landing page' do
    Steps 'To get the landing page' do
      Given 'That I am on the landing page' do
        visit '/'
      end
      And 'I can access the new animal form' do
        click_on 'New Animal'
      end
      Then 'I am taken to the form' do
        expect(page).to have_content "New Animal"
      end
      Then 'Fill in the new animal form' do
        fill_in "Common name", with: "Dog"
        fill_in "Latin name", with: "Canine"
        fill_in "String", with: "oops"
        fill_in "Kingdom", with: "Mammal"
      end
      And 'I can create the new animal' do
        click_on "Create Animal"
      end
    end #Steps
  end #context
  context 'I can list all animals on database' do
    Steps 'to list all animals' do
      Given 'That I am on the lading page' do

        visit '/'
        click_on "New Animal"
        fill_in "Common name", with: "Dog"
        fill_in "Latin name", with: "Canine"
        fill_in "String", with: "oops"
        fill_in "Kingdom", with: "Mammal"
        save_and_open_page
        click_on "Create Animal"
      end#Given
      Then 'I can list all animals in database' do
        click_on "Back"
        expect(page).to have_content "Dog"
      end
    end#Steps
  end#E End of Context
end #RSpec
