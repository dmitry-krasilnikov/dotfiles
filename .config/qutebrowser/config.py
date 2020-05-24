c.scrolling.smooth = True

config.unbind('J', mode='normal')
config.unbind('K', mode='normal')
config.bind('J', 'tab-prev', mode='normal')
config.bind('K', 'tab-next', mode='normal')

qute_pass = 'spawn --userscript qute-pass -u "login: (.+)" -U secret'
config.bind('<z><l>', qute_pass)
config.bind('<z><u><l>', qute_pass + ' --username-only')
config.bind('<z><p><l>', qute_pass + ' --password-only')
config.bind('<z><o><l>', qute_pass + ' --otp-only')

config.set('url.searchengines', {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'go': 'https://www.google.com/search?q={}',
    'dd': 'https://duckduckgo.com/?q={}',
    'ec': 'https://www.ecosia.org/search?q={}',
})

config.source('qutewal.py')
