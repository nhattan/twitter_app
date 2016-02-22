set :stage, :production
set :rails_env, :production

role :app, %w{deploy@188.166.242.82}
role :web, %w{deploy@188.166.242.82}
role :db,  %w{deploy@188.166.242.82}

server '188.166.242.82', user: 'deploy', roles: %w{app web db}
