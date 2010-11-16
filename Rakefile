require 'rake'

desc "Link scripts to user's ~/bin/ directory"
task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README.md vcprompt-installer macvim-installer].include?(file) || File.directory?(file)
    
    original = File.join(ENV['HOME'], "bin", "#{file}")
    
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
  
  # TODO DRY up installer code by creating a method that executes all the installers
  #      scripts that exist in an installer/ sub-directory (like rails)
  
  # Run vcprompt-installer
  puts "Attempting to install vcprompt"
  if File.exists?("/usr/local/bin/hg")
    if File.exists?("/usr/local/bin/vcprompt")
      puts "The app vcprompt already exists in /usr/local/bin.  Exiting ..."
    else
      system %Q{./vcprompt-installer}
    end
  else
    puts "Unable to find the mercurial install which is required by vcprompt-installer.\nPlease double check your $PATH and run the installer manually"
  end
  
  # Run macvim-installer
  puts "Attempting to install MacVim"
  if File.exists?("/usr/local/bin/mvim")
    puts "The app MacVim already exists in /usr/local/bin.  Exiting ..."
  else
    system %Q{./macvim-installer}
  end
end  # task
