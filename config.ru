require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run &#96;rake db:migrate&#96; to resolve the issue.'
end

run ApplicationController