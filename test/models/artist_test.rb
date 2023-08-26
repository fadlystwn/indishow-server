require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save the artist without title" do
    artist = Artist.new
    assert_not artist.save, "Saved the article without a title"
  end
end
