class ComediansController < ApplicationController
  def index
    @comedians = Comedian.filter_by_age(params["age"])
  end
end
