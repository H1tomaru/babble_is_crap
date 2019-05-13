# name: MrBug-ChatBro
# version: 9.9.9
# authors: MrBug

require 'digest/md5'

after_initialize do

	Discourse::Application.routes.append do
			get '/ChatBroAuth' => 'chatbro#gogochat'
			get '/chat_history(/:page)' => 'chatbro#historywohoo'
	end

	class ::ChatbroController < ::ApplicationController

		def gogochat
			if current_user
				permiss = ''
				params = {
					encodedChatId: '82YTb',
					siteDomain: 'union3.ru',
					siteUserExternalId: current_user[:id],
					siteUserFullName: current_user[:username],
					siteUserAvatarUrl: "https://union3.ru" + current_user.avatar_template.sub('{size}', '120'),
					siteUserProfileUrl: "/u/"+current_user[:username],
				}
				(params[:permissions] = [ 'delete', 'ban']; permiss = params[:permissions].join('')) if ['H1tomaru'].include?(current_user[:username])
				(params[:permissions] = [ 'delete']; permiss = params[:permissions].join('')) if ['D13SELBOY', 'Bodwaizer'].include?(current_user[:username])

				#antibotbaby!!!
				#params[:allowSendMessages] = false if Time.now - current_user[:created_at] < 90000

				#will do later ;)
				params[:signature] = Digest::MD5.hexdigest(
					params[:siteDomain] +
					params[:siteUserExternalId].to_s +
					params[:siteUserFullName] +
					params[:siteUserAvatarUrl] +
					params[:siteUserProfileUrl] +
					permiss +
					'7e052320-d19b-43d7-bcf5-cb02d79e4a1f'
				)
				render json: { params: params }
			end
		end
		
		def historywohoo
			render json: { HiMom: "!!!" }
		end

	end

end
