class HomeController < ApplicationController
  skip_before_action :require_user, only: [:index]
  
  def index
    @articles = Article.all
  end
end
