require 'rake'

task :default => "install:all"

namespace :install do
  HOMEBIN_DIR = "Bintest"

  desc "[Default] Installs everything"
  task :all do
    Rake::Task["install:bins"].invoke
    Rake::Task["install:vcprompt"].invoke
    Rake::Task["install:sublime2"].invoke
  end

  desc "Link scripts to user's ~/bin/ directory"
  task :bins do
    Dir['*'].each do |file|
      excluded = %w[Gemfile Gemfile.lock Rakefile README.md vcprompt-installer macvim-installer sublime2-installer]
      next if excluded.include?(file) || File.directory?(file)
      
      original = File.join(ENV['HOME'], "bin", "#{file}")
      
    homebin_path = File.join(ENV['HOME'], HOMEBIN_DIR)
    
    Dir.mkdir(homebin_path) unless Dir.exists?(homebin_path)
    puts "INFO: Install directory: #{homebin_path}\n\n"
      if File.exists?(original)
        print "File ~/#{file} exists, replace? [ynq] "  # prompt user
        case STDIN.gets.chomp  # get the user's input
        when 'a'
          # ...
        when 'y'
          File.rename(original, original+"~")
          # system %Q{rm "$HOME/.#{file}"}
          puts "Backing up ~/#{file}\n\n"
          system %Q{ln -s "$PWD/#{file}" "$HOME/bin/#{file}"}
        when 'q'
          exit
        else
          puts "skipping ~/#{file}\n\n"
        end  # case
      else
        # no pre-existing file so just create the link
        puts "linking ~/#{file}\n\n"
        system %Q{ln -s "$PWD/#{file}" "$HOME/bin/#{file}"}
      end
    end  # file
  end
    
  desc "Installs vcprompt"
  task :vcprompt do
    # Run vcprompt-installer
    puts "\nAttempting to install vcprompt"
    if File.exists?("/usr/local/bin/hg")
      if File.exists?("/usr/local/bin/vcprompt")
        puts "The app vcprompt already exists in /usr/local/bin.  Exiting ..."
      else
        system %Q{sh vcprompt-installer}
      end
    else
      puts "Unable to find the mercurial install which is required by vcprompt-installer.\nPlease double check your $PATH and run the installer manually"
    end
  end
    
  desc "Creates the link for the sublime2 command line tool"
  task :sublime2 do
    puts "\nInstalling sublime2-installer"
    if File.exists?("~/bin/subl")
      puts "The app Sublime2 already exists in ~/bin.  Exiting ..."
    else
      system %Q{sh sublime2-installer}
    end
  end
end