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
				permiss = ''
				params = {
					encodedChatId: '322jN',
					siteDomain: 'union3.ru',
					siteUserExternalId: current_user[:id],
					siteUserFullName: current_user[:username],
					siteUserAvatarUrl: "https://union3.ru" + current_user.avatar_template.sub!('{size}', '120'),
					siteUserProfileUrl: "/u/"+current_user[:username]
				}permissions: [ 'delete', 'ban'],
				(params[:permissions] = [ 'delete', 'ban']; permiss = params[:permissions].join('')) if current_user[:username] == 'H1tomaru'
				params[:signature] = Digest::MD5.hexdigest(
					params[:siteDomain] +
					params[:siteUserExternalId].to_s +
					params[:siteUserFullName] +
					params[:siteUserAvatarUrl] +
					params[:siteUserProfileUrl] +
					permiss +
					'291c5e1b-c0a3-49ec-a38c-c180a54fe4a2'
				)
				render json: { params: params }
			end
		end

	end

end
