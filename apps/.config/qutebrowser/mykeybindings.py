#

config.bind('<Alt-h>', 'back')
config.bind('<Alt-l>', 'forward')

config.bind('<Alt-j>', 'tab-next')
config.bind('<Alt-k>', 'tab-prev')

config.bind('<Alt-Shift-j>', 'tab-move -')
config.bind('<Alt-Shift-k>', 'tab-move +')

config.bind('<Ctrl+Shift+t>', 'undo') # repoen last tab
config.bind('<Ctrl+Shift+w>', 'undo --window') # repoen last window


config.bind('M', 'hint links spawn mpv --hwdec=auto --ytdl-format="bestvideo[height<=1080]+bestaudio/best[height<=1080]"  {hint-url}')
config.bind('B', 'hint links spawn brave --profile=sirjager {hint-url}')
config.bind('Z', 'hint links spawn st -e --ytdl-format="bestvideo[height<=1080]+bestaudio/best[height<=1080] {hint-url}')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')


config.bind('<Ctrl+t>', 'open -t https://duckduckgo.com ;; mode-enter insert')    # Open new tab
config.bind('<Ctrl+n>', 'open -w https://duckduckgo.com ;; mode-enter insert')    # Open new window

config.bind('<Ctrl+y>', 'open -t https://youtube.com')
config.bind('<Ctrl+g>', 'open -t https://github.com/sirjager')
config.bind('<Ctrl+c>', 'open -t https://chatgpt.com')

config.bind('<Ctrl+o>c', 'open -t https://chatgpt.com')
config.bind('<Ctrl+o>g', 'cmd-set-text -s :open -t https://github.com/')
config.bind('<Ctrl-o>y', 'cmd-set-text -s :open -t https://www.youtube.com/results?search_query=')



