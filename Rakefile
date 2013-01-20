require 'rake'

task :default => "install"

desc "[Default] Lists available installers and installs bins"
task :install do
  Rake::Task["install:list"].invoke
  Rake::Task["install:bins"].invoke
end

namespace :install do

  desc "Installs everything"
  task :all do
    Rake::Task["install:bins"].invoke
    Rake::Task["install:installers"].invoke
  end

  desc "List installers"
  task :list do
    puts "\nAvailable installers (execute manually for more info):\n\n"
    Dir.glob('installers/*') { |file| puts "* #{file}" }
    puts ""
  end

  desc "Install user scripts to the bin/ directory"
  task :bins do
    HOMEBIN_DIR = "Bin"
    EXCLUDED_FILES = %w(
      Gemfile
      Gemfile.lock
      installers
      Rakefile
      README.md
    )

    homebin_path = File.join(ENV['HOME'], HOMEBIN_DIR)
    
    Dir.mkdir(homebin_path) unless Dir.exists?(homebin_path)
    puts "INFO: Install directory: #{homebin_path}\n\n"

    # link files
    Dir['*'].each do |file|
      next if EXCLUDED_FILES.include?(file) || File.directory?(file)

      original = File.join(homebin_path, "#{file}")

      if File.exists?(original)
        print "File ~/#{file} exists, replace? [ynq] "  # prompt user
        case STDIN.gets.chomp  # get the user's input
        when 'a'
          # ...
        when 'y'
          File.rename(original, original+"~")
          puts "INFO: Backing up file: ~/#{file}"
          %x(ln -s "$PWD/#{file}" "#{homebin_path}/#{file}")
        when 'q'
          exit
        else
          puts "INFO: Skipping file: ~/#{file}"
        end
      else
        # no pre-existing file so just create the link
        puts "INFO: Linking file: ~/#{file}"
        %x(ln -s "$PWD/#{file}" "#{homebin_path}/#{file}")
      end
    end
    puts "INFO: Finished"
  end
  
  # Run this task to automatically execute the installers
  # WARNING: Recommend not using this and instead running the installers
  # manually (which will also show installer output)
  desc "Executes installers"
  task :installers do
    # TODO: report installer output in this task
    Dir.glob('installers/*') do |installer|
      puts "INFO: Executing installer: #{installer}"
      %x(sh #{installer})
    end
  end
end

