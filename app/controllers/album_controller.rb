class Album < ApplicationRecord
    belongs_to :artist
  
    def new
      @album = Album.new
    end
  
    def create
      @album = Album.new(album)
      if@album.save
        redirect_to album_path(@album)
      else
        render :new
      end
    end
  end
  
  private 
  
  def album_params
    params.required(:album).permit(:title, :release_data, :artist_id)
  end
  
  private
  