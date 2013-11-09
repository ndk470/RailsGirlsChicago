class ListsController < ApplicationController
def index
  @lists = List.all
end

def new
@list = List.new
end

def create
@list = List.new
@list.update_attributes(params[:list].permit(:name,:reason))
if @list.save
redirect_to("http://www.weather.com")
else
render action: "new"
end
end

def edit
@list=List.find(params[:id])
end

def update

@list=List.find(params[:id])
if @list.update_attributes(params[:list].permit(:name,:reason))
  redirect_to lists_url
else
render action: "edit"
end
end

  def show
    @list=List.find(params[:id])
      end
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_url
  end
  
end
