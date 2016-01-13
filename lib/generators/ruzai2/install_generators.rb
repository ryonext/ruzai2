module Ruzai2
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install
      template "ruzai_lists.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%d")}_ruzai_lists.rb"
    end
  end
end
