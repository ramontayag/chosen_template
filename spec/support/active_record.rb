require 'active_support/core_ext/hash/indifferent_access'

database_yml = File.join(ROOT_DIR, 'db', 'config.yml')
db_config = YAML.load_file(database_yml).with_indifferent_access
ActiveRecord::Base.establish_connection(db_config[:test])
