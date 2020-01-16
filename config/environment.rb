ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
 task :up => :'db:connect' do
      if ActiveRecord.version >= Gem::Version.new('6.0.0')
        context = ActiveRecord::Migration.new.migration_context
        migrations = context.migrations
        schema_migration = context.schema_migration
      elsif ActiveRecord.version >= Gem::Version.new('5.2')
        migrations = ActiveRecord::Migration.new.migration_context.migrations
        schema_migration = nil
      else
        migrations = ActiveRecord::Migrator.migrations('db/migrate')
        schema_migration = nil
      end
      ActiveRecord::Migrator.new(:up, migrations, schema_migration).migrate
    end