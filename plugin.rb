# name: MrBug-ChatBro
# version: 9.9.9
# authors: MrBug

after_initialize do

	Discourse::Application.routes.append do
			get '/ChatBroAuth' => 'chatbro#gogochat'
	end

	class ::ChatbroController < ::ApplicationController

		def gogochat
			params = {
				encodedChatId: '322jN',
				siteDomain: 'union3.ru',
				siteUserExternalId: "2",
				siteUserFullName: "MrBug",
				siteUserAvatarUrl: "https://union3.ru/user_avatar/union3.ru/mrbug/120/16_1.png",
				siteUserProfileUrl: "/u/mrbug",
				signature: "72f6835de8000c3e7692b1b694ec26e2"
			}
			render json: { params: params }
		end

	end

end
