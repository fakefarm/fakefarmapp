class VersesController < ApplicationController
  before_action :set_verse, only: [:show, :edit, :update, :destroy]

  def index
    @verse = Verse.new
    @bible = Bible.new(Verse.last)
    @bible.get
  end

  def show
    @bible = Bible.new(@verse)
    @bible.get
  end

  def new
    @verse = Verse.new
  end

  def edit
  end

  def create
    @verse = Verse.new(verse_params)
    respond_to do |format|
      if @verse.save
        format.html { redirect_to verses_path, notice: 'Verse was successfully created.' }
        format.json { render :show, status: :created, location: @verse }
      else
        format.html { render verses_path }
        format.json { render json: @verse.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @verse.update(verse_params)
        format.html { redirect_to @verse, notice: 'Verse was successfully updated.' }
        format.json { render :show, status: :ok, location: @verse }
      else
        format.html { render :edit }
        format.json { render json: @verse.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @verse.destroy
    respond_to do |format|
      format.html { redirect_to verses_url, notice: 'Verse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_verse
      @verse = Verse.find(params[:id])
    end

    def verse_params
      params.require(:verse).permit(:book, :chapter, :verse, :translation)
    end
end
