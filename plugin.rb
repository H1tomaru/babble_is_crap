# name: MrBug-ChatBro
# version: 9.9.9
# authors: MrBug

after_initialize do

	Discourse::Application.routes.append do
			get '/chatbroauth' => 'chatbro#gogochat'
	end

	class ::ChatbroController < ::ApplicationController

		def gogochat
			render json: { testing: true }
		end

	end

end
