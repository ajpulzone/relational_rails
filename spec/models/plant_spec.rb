require "rails_helper"

RSpec.describe Plant, type: :model do
  it {should belong_to :grow_zone}
end