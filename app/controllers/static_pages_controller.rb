class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @entry  = current_user.entries.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def news
  end

  def help
  end

  def about
  end


end
