class SongsController < ApplicationController
  def index
    @songs = Song.all.order(:status, :album, :name)
  end
end
