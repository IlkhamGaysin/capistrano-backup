module Capistrano
  module Backup
    # Helpers
    #  - embarrassingly I just copied the structure of other Capistrano gems
    #  - In my mind it is "Wrap ugly parts of none OO code"
    #
    module Helpers
      # eval_template(from)
      #  - from - template to expand
      #  - returns text from combined template and variables
      #
      def eval_template(from)
        template = ERB.new(File.new(from).read).result(binding)
        StringIO.new(template)
      end

      # error helpers - output error messages

      def local_app_config_missing
        puts
        puts "Error - local file '#{local_app_config}' is missing, and it is required."
        puts
      end

      def backups_config_missing
        puts
        puts "Error - remote file #{backups_config}' is missing, and it's required."
        puts "Have you installed Backups Gem and configuration file?"
        puts "BCS uses the backups cookbook to install and configure the backups gem."
        puts
      end
    end
  end
end
