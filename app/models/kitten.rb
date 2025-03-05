class Kitten < ApplicationRecord
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(id: params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.find(id: params[:id])

    if @kitten.save
      redirect_to @kitten
    else
      flash.now[:error] = "Fix your mistakes please!"
      render :new, status: :unprocessable_entity
    end
  end
end
