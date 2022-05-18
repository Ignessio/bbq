lock '~> 3.17.0'

set :application, 'bbq'
set :repo_url, 'git@github.com:Ignessio/bbq'
set :deploy_to, '/home/deploy/www/bbq'
set :keep_releases, 5

append :linked_files, 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads'

Rake::Task["deploy:assets:backup_manifest"].clear_actions
