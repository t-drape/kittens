class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Congrats on your new cat!"
      redirect_to @kitten
    else
      flash.now[:error] = "Fix your mistakes please!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:success] = "Changes Saved successfully!"
      redirect_to @kitten
    else
      flash.now[:error] = "Fix your mistakes please!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "Successfully Removed!"
    redirect_to :root
  end

  private

  def kitten_params
    params.expect(kitten: [ :name, :age, :cuteness, :softness ])
  end
end
