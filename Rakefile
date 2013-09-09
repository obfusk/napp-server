bin = "#{ Dir.pwd }/bin"
man = "#{ Dir.pwd }/pp/manifests"
mod = "#{ Dir.pwd }/pp/modules"

ENV['FACTER_pp_bin'] = bin
args = "--modulepath #{mod} -v"

stows = Dir['stow/*'].map { |x| File.basename x }

desc 'Stow'
task :stow do
  raise 'no $PKG' if (ENV['PKG'] || '').empty?
  sh "stow -d -v stow #{ENV['PKG']}"
end

desc 'Stow'
task 'stow:noop' do
  raise 'no $PKG' if (ENV['PKG'] || '').empty?
  sh "stow -n -d -v stow #{ENV['PKG']}"
end

desc 'Stow'
task 'stow:all' do
  sh "stow -d -v stow #{stows}"
end

desc 'Stow'
task 'stow:noop:all' do
  sh "stow -n -d -v stow #{stows}"
end

desc 'Apply'
task :apply do
  sh "puppet apply #{args} #{man}/site.pp"
end

desc 'Apply file'
task 'apply:file' do
  raise 'no $FILE' if (ENV['FILE'] || '').empty?
  sh "puppet apply #{args} #{ENV['FILE']}"
end

desc 'Noop'
task :noop do
  sh "puppet apply --noop #{args} #{man}/site.pp"
end

desc 'Noop file'
task 'noop:file' do
  raise 'no $FILE' if (ENV['FILE'] || '').empty?
  sh "puppet apply --noop #{args} #{ENV['FILE']}"
end

desc 'Check'
task :check do
  sh "find -name '*.pp' | xargs -n 1 -t puppet parser validate"
end

desc 'Sync'
task :sync do
  raise 'no $TO' if (ENV['TO'] || '').empty?
  sh "rsync -av --progress --delete --exclude=.git ./ #{ENV['TO'}/"
end
