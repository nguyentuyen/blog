class EntriesController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
    @entry = Entry.find(params[:id])
    @comments = @entry.comments.paginate(page: params[:page])
  end

  def comments
    @title = "Comments"
    @entry = Entry.find(params[:id])
    @comment = @entry.comments.build
    @comments = @entry.comments.paginate(page: params[:page])
    render 'show_comments'
  end
  
  def destroy
    @entry.destroy
    redirect_to root_url
  end

  private

    def entry_params
      params.require(:entry).permit(:title, :body)
    end

    def correct_user
      @entry = current_user.entries.find_by(id: params[:id])
      redirect_to root_url if @entry.nil?
    end
end
