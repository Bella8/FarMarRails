class UsersController < ApplicationController
  def home
  end

  def markets
    @markets_all = Market.all
  end

end
