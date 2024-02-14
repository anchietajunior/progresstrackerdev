class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_authenticated, only: %i[home]

  def home; end
end
