class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @series = [
      {:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9] },
      {:name=>'Jane', :data=> [1, 3, 4, 3, 3, 5, 4,-46,7,8,8,9,9,0,0,9] }
    ]
  end
end
