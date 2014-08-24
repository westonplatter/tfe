server '162.243.153.106', user: 'ubuntu', roles: %w{web app db resque_worker}

# =========== capistrano for capistrano-resque

  set :workers, { 
    "tfe_ruby_file" => 1, 
    "tfe_ruby_keyword" => 8
  }
