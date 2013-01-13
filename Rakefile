require 'rake'

task :default => "install:all"

namespace :install do
  HOMEBIN_DIR = "Bintest"
  EXCLUDED_FILES = %w(
    Gemfile
    Gemfile.lock
    Rakefile
    README.md
  )

  desc "[Default] Installs everything"
  task :all do
    Rake::Task["install:bins"].invoke
    Rake::Task["install:vcprompt"].invoke
    Rake::Task["install:sublime2"].invoke
  end

  desc "Link scripts to user's #{HOMEBIN_DIR} directory"
  task :bins do

    homebin_path = File.join(ENV['HOME'], HOMEBIN_DIR)
    
    Dir.mkdir(homebin_path) unless Dir.exists?(homebin_path)
    puts "INFO: Install directory: #{homebin_path}\n\n"

    Dir['**/*'].each do |file|
      next if EXCLUDED_FILES.include?(file) || File.directory?(file)

      original = File.join(homebin_path, "#{file}")

      if File.exists?(original)
        print "File ~/#{file} exists, replace? [ynq] "  # prompt user
        case STDIN.gets.chomp  # get the user's input
        when 'a'
          # ...
        when 'y'
          File.rename(original, original+"~")
          # system %Q{rm "$HOME/.#{file}"}
          puts "INFO: Backing up file: ~/#{file}"
          system %Q{ln -s "$PWD/#{file}" "$HOME/#{HOMEBIN_DIR}/#{file}"}
        when 'q'
          exit
        else
          puts "INFO: Skipping file: ~/#{file}"
        end
      else
        # no pre-existing file so just create the link
        puts "INFO: Linking file: ~/#{file}"
        system %Q{ln -s "$PWD/#{file}" "$HOME/#{HOMEBIN_DIR}/#{file}"}
      end
    end  # file
    puts "INFO: Finished"
  end
    
  desc "Installs vcprompt"
  task :vcprompt do
    # Run vcprompt-installer
    puts "INFO: Installing vcprompt"
    if File.exists?("/usr/local/bin/hg")
      if File.exists?("/usr/local/bin/vcprompt")
        puts "INFO: The app vcprompt already exists in /usr/local/bin.  Exiting ..."
      else
        system %Q{sh vcprompt-installer}
      end
    else
      puts "ERROR: Unable to find the mercurial install which is required by vcprompt-installer.\nPlease double check your $PATH and run the installer manually"
    end
  end
    
  desc "Creates the link for the sublime2 command line tool"
  task :sublime2 do
    puts "INFO: Installing sublime2-installer"
    if File.exists?("$HOME/#{HOMEBIN_DIR}/subl")
      puts "INFO: The app Sublime2 already exists in #{homebin_path}.  Exiting ..."
    else
      system %Q{sh sublime2-installer}
    end
  end
end
