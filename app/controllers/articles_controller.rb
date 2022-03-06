class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
    @articles = Article.all
  end

  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "記事を作成しました" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "記事を更新しました" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "記事を削除しました" }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end
end
