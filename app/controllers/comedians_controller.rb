class ComediansController < ApplicationController
  def index
    render locals: {facade: ComediansFacade.new(Comedian.filter_by_age(params["age"]))}
  end

  def show
    @comedian = Comedian.find(params[:id])
  end

  def new
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.new(comedian_params)
    if @comedian.save
      redirect_to '/comedians'
    else
      render :new
    end
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :city)
  end
end
