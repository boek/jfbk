class UrlController < ApplicationController
	def index
	end

	def create
		sleep 2
		hash = Url.shortify params[:url]

		respond_to do |format|
			format.js { render :json => "#{request.protocol + request.host_with_port}/#{hash}" }
		end
	end

	def redirect
		redirect_to Url.longify params[:hash]
	end
end
