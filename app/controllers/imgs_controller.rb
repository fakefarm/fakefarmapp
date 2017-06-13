class ImgsController < ApplicationController
  before_action :set_img, only: [:show, :edit, :update, :destroy]
  before_action :skip_authorization

  def index
    @imgs = Img.all
  end

  def show
  end

  def new
    @img = Img.new
  end

  def edit
  end

  def create
    @img = Img.new(img_params)

    respond_to do |format|
      if @img.save
        format.html { redirect_to @img, notice: 'Img was successfully created.' }
        format.json { render :show, status: :created, location: @img }
      else
        format.html { render :new }
        format.json { render json: @img.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @img.update(img_params)
        format.html { redirect_to @img, notice: 'Img was successfully updated.' }
        format.json { render :show, status: :ok, location: @img }
      else
        format.html { render :edit }
        format.json { render json: @img.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @img.destroy
    respond_to do |format|
      format.html { redirect_to imgs_url, notice: 'Img was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_img
      @img = Img.find(params[:id])
    end

    def img_params
      params.require(:img).permit(:image)
    end
end
