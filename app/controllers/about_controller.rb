class AboutController < ApplicationController
  skip_before_action :require_user, only: [:index]
  def index
  end
end
