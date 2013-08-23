class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:secret]
  before_filter :set_profile

  def home
  end

  def about
  end

  def contact
  end

  def secret
  end

  private

    def set_profile
      user = User.first
      @profile = user.profile
    end
end