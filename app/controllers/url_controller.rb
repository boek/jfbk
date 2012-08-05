class UrlController < ApplicationController
	def index
		@url = Url.new
	end

	def create
		url = Url.new(:long_url => params[:url][:long_url])
		url.save
		url.hash_url = url.id.to_s(36)
		url.save

		flash[:notice] = "<a href='#{request.protocol + request.host_with_port}/#{url.hash_url}'>#{request.protocol + request.host_with_port}/#{url.hash_url}</a>"

		redirect_to root_path
	end

	def redirect
		@url = Url.where(:hash_url => params[:hash]).first
		@url.count = @url.count.next
		@url.save

		redirect_to @url.long_url
	end
end
