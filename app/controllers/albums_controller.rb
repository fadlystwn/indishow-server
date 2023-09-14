class AlbumsController < ApplicationController
    before_action :set_artist, only: [:index, :new, :create]
    before_action :set_album, only: [:show, :edit, :update, :destroy]

    def index
      @albums = @artist.albums
    end

    def show
      @album = Album.find(params[:id])
    end

    def new
      @album = @artist.albums.new
    end

    def create
      @album = @artist.albums.new(album_params)
      if @album.save
        redirect_to artist_albums_path(@artist), notice: 'Album was successfully created!'
      else
        render :new
      end
    end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :release_date)
  end
end
