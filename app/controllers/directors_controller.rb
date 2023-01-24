class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def index
    @directors = Director.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @directors }

      format.html
    end
  end


  def show
    @director = Director.find(params.fetch(:id))
  end


  def create
    director_params = params.require(:director).permit(:name, :dob)
    
    @director = Director.new(director_params)

    if @director.valid?
      @director.save

      redirect_to directors_url, notice: "Director created successfully."
    else
      render "new"
    end
  end


  def edit
    @director = Director.find(params.fetch(:id))
  end


  def update
    @director = Director.find(params.fetch(:id))

    director_params = params.require(:director).permit(:name, :dob)
    
    if @director.update(director_params)
      redirect_to @director, notice: "Director updated successfully."
    else
      render "edit"
    end
  end


  def destroy
    @director = Director.find(params.fetch(:id))

    @director.destroy

    redirect_to directors_url, notice: "Director deleted successfully."
  end

end