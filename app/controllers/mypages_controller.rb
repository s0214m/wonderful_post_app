class MypagesController < ApplicationController
  def index
    @articles = current_user.articles.includes(:user).page(params[:page]).search(params[:search])
  end

  def search
    @articles = current_user.articles.search(params[:title]).page(params[:page])
    render :index
  end
end
