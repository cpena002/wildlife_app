require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'has a dog' do
    animal = Animal.new(common_name: "Dog", latin_name: "Canine", string: "oops", kingdom: "Mammal")
    expect(animal.save).to eq true
    animal2 = Animal.find_by_common_name("Dog")
    expect(animal2.latin_name).to eq "Canine"
  end
end
