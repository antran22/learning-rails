class StaticPagesController < ApplicationController
  allow_unauthenticated_access

  def home
  end

  def test_flashes
    flash[:notice] = "some notice"
    flash[:alert] = "some alert"
    flash[:error] = "some error"
  end
end
