Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }, 

let g:LanguageClient_serverCommands = {
			\ 'cpp': ['cquery', '--log-file=/tmp/cq.log', '--init', '{"cacheDirectory": "/tmp/cquery"}'],
			\ 'c': ['cquery', '--log-file=/tmp/cq.log', '--init', '{"cacheDirectory": "/tmp/cquery"}'],
			\ 'php': ['php-language-server.php']
			\ }

let g:LanguageClient_autoStart = 1
