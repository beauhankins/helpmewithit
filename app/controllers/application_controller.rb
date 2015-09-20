class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }


  module ApplicationHelper
	  def title(text)
	    content_for :title, text
	  end

	  def meta_tag(tag, text)
	    content_tag :"meta_#{tag}", text
	  end

	  def yield_meta_tag(tag, default_text='')
	    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
	  end
	end

end
