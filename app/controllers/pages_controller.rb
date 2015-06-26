class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @pages = Page.all
    respond_with(@pages)
  end

  def welcome
    @restaurants = Restaurant.all
  end

  def show
    @page = Page.find_by_permalink(params[:permalink])
    respond_with(@page)
  end

  def new
    @page = Page.new
    respond_with(@page)
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    @page.save
    respond_with(@page)
  end

  def update
    @page.update(page_params)
    respond_with(@page)
  end

  def destroy
    @page.destroy
    respond_with(@page)
  end

  def search
    @restaurants = PgSearch.multisearch(params[:search])
  end

  def show_restaurant
    @restaurant = Restaurant.find_by_permalink(params[:permalink])
    
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:name, :description, :photo)
    end
end
