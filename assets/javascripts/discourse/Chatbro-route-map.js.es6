export default function() {
	this.route('ChatBro', { path: '/chat_history' } , function() {
		this.route('keks', { path: '/:page' });
	});
};
