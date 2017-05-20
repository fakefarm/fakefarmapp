class PagesController < ApplicationController
  def about
    @oscars_age = oscars_birthday
  end

  private

  def oscars_birthday
    # _dw make birthday
    '8'
  end
end
