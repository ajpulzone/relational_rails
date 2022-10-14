require "rails_helper"

RSpec.describe GrowZone, type: :model do
  it {should have_many :plants}
end