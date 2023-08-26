# spec/models/artist_spec.rb

require 'rails_helper'

RSpec.describe Artist, type: :model do
  it "is valid with valid attributes" do
    artist = Artist.new(
      name: "John Doe",
      username: "johndoe",
      genre: "Pop",
      bio: "A talented musician with a passion for creating catchy tunes."
    )
    expect(artist).to be_valid
  end

  it "is not valid without a name" do
    artist = Artist.new(name: nil)
    expect(artist).to_not be_valid
  end

  it "is not valid without a username" do
    artist = Artist.new(username: nil)
    expect(artist).to_not be_valid
  end

  it "is not valid with a duplicate username" do
    Artist.create(
      name: "Jane Smith",
      username: "janesmith",
      genre: "Rock",
      bio: "An energetic rockstar ready to rock the world!"
    )
    artist = Artist.new(username: "janesmith")
    expect(artist).to_not be_valid
  end

  it "is not valid without a genre" do
    artist = Artist.new(genre: nil)
    expect(artist).to_not be_valid
  end

  it "is not valid without a bio" do
    artist = Artist.new(bio: nil)
    expect(artist).to_not be_valid
  end

  it "is not valid with a long name" do
    artist = Artist.new(name: "a" * 101)
    expect(artist).to_not be_valid
  end

  it "is not valid with a long username" do
    artist = Artist.new(username: "a" * 51)
    expect(artist).to_not be_valid
  end

  it "is not valid with a long genre" do
    artist = Artist.new(genre: "a" * 51)
    expect(artist).to_not be_valid
  end

  it "is not valid with a long bio" do
    artist = Artist.new(bio: "a" * 1001)
    expect(artist).to_not be_valid
  end
end
