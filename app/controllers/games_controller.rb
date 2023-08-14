require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @user_answer = params[:answer]
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@user_answer}"
    word_serialized = URI.open(url).read
    @word = JSON.parse(word_serialized)
  end
end
