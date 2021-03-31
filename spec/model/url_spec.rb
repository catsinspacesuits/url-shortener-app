require 'rails_helper'

# RSpec.describe Url, type: :model do
#   before(:all) do
#     @url = Url.create(original_url: "https://www.google.com/search?q=panda&sxsrf=ALeKk02bMVFQGDfaExjg3liAGJ6NNUbtWA161715sA", short_url: "7fh47dP")
#   it 'checks that a url can be created' do
#     expect(@url).to be_valid
#   end
# end


RSpec.describe Url do 
  before(:all) do
    @url = Url.create(original_url: "https://www.google.com/search?q=panda&sxsrf=ALeKk02bMVFQGDfaExjg3liAGJ6NNUbtWA161715sA")
  end
  # it 'saves an original url' do 
  #   expect(@url.original_url).to eq("https://www.google.com/search?q=panda&sxsrf=ALeKk02bMVFQGDfaExjg3liAGJ6NNUbtWA161715sA")
  # end
  # it 'saves a slug' do
  #   expect(@url.short_url).to be_truthy
  # end

  # Validations
   it 'is valid with valida attributes' do
    expect(@url).to be_valid
  end

  it "is not valid without an original_url" do
    url = Url.new(original_url: nil)
    expect(url).to_not be_valid
  end

  it "is not valid without a short_url" do
    url = Url.new(short_url: nil)
    expect(url).to_not be_valid
  end

  it 'is invalid if the short_url is not unique' do
    same_url = Url.create
    expect(same_url).to be_invalid
  end

end 