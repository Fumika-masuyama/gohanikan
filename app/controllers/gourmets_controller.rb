class GourmetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:index, :search]

  def create
    gourmet = Gourmet.new(gourmet_params)
    if gourmet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def index
    @gourmets = @q.result
  end

  def search
    @gourmets = @q.result
    render :index
  end

  def new
    @gourmet = Gourmet.new
  end

  def show
    @gourmet = Gourmet.find(params[:id])
  end

  def destroy
    @gourmet = Gourmet.find(params[:id])
    @gourmet.destroy
    redirect_to gourmets_path, notice: '投稿が削除されました'
  end
  
  def edit
    @gourmet = Gourmet.find(params[:id])
  end

  private

  def set_q
    @q = Gourmet.ransack(params[:q])
  end

  def gourmet_params
    params.require(:gourmet).permit(:name, :number, :purpose, :place, :budget, :genre, :photo)
  end

end

