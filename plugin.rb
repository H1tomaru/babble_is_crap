# name: MrBug-ChatBro
# version: 9.9.9
# authors: MrBug

require 'digest/md5'

after_initialize do

	Discourse::Application.routes.append do
			get '/ChatBroAuth' => 'chatbro#gogochat'
	end

	class ::ChatbroController < ::ApplicationController

		def gogochat
			if current_user
				params = {
					encodedChatId: '322jN',
					siteDomain: 'union3.ru',
					siteUserExternalId: current_user[:id],
					siteUserFullName: current_user[:username],
					siteUserAvatarUrl: current_user.avatar_template.sub!('{size}', '120'),
					siteUserProfileUrl: "/u/"+current_user[:username]
				}
				params[:signature] = Digest::MD5.hexdigest(
					params[:siteDomain] +
					params[:siteUserExternalId].to_s +
					params[:siteUserFullName] +
					params[:siteUserAvatarUrl] +
					params[:siteUserProfileUrl] +
					'291c5e1b-c0a3-49ec-a38c-c180a54fe4a2'
				)
				render json: { params: params, current_user: current_user }
			end
		end

	end

end
