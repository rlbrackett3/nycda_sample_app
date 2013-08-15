class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:secret]

  def home

  end

  def about

  end

  def contact

  end

  def secret

  end
end