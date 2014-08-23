server '107.170.254.215', user: 'ubuntu', roles: %w{web app db resque_worker}

# =========== capistrano for capistrano-resque

  set :workers, { 
    "tfe_ruby_file" => 1, 
  }
