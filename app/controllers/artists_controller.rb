class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
 
  def index
    @artists = Artist.all
    @albums_by_artist = {}
    
    @artists.each do |artist|
      @albums_by_artist[artist.id] = artist.albums
    end
  end
  
  def show
    @artist = Artist.find(params[:id])
    @albums = @artist.albums
  end

  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist, notice: 'Artist was successfuly created'
    else
      render :new
    end
  end
 
  def edit

  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist, notice: 'Artist successfuly updated'
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre, :bio, :profile_picture)
  end
end
