require 'rake'

desc "Link scripts to user's ~/bin/ directory"
task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README.md].include?(file) || File::directory?(file)
    
    original = File.join(ENV['HOME'], "bin", "#{file}")
    
    if File.exists?(original)
      print "File ~/#{file} exists, replace? [ynq] "  # prompt user
      case $stdin.gets.chomp  # get the user's input
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
end  # task
