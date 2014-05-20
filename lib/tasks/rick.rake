require_relative '../../lib/rick_utils'
include RickUtils

namespace :rick do
  desc "TODO"
  task load_scripts: :environment do
    load_scripts
  end

  task regenerate: :environment do
    generate_ipsum_file
  end

end
