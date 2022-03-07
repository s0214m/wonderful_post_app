class MypagesController < ApplicationController
  def index
    @articles = current_user.articles.includes(:user).page(params[:page])
  end
end
