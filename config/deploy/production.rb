server '54.65.250.140', user:'app',roles:%w{app db web}
set :ssh_options, keys: '/Users/takemura/.ssh/id_rsa'
