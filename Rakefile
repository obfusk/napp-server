bin                   = "#{ Dir.pwd }/bin"
man                   = "#{ Dir.pwd }/pp/manifests"
mod                   = "#{ Dir.pwd }/pp/modules"

ENV['FACTER_pp_bin']  = bin
pp_args               = "--modulepath #{mod} -v"

stows                 = Dir['stow/*'].map { |x| File.basename x }
st_args               = '-vv -d stow'

desc 'Stow'
task :stow do
  raise 'no $PKG' if (ENV['PKG'] || '').empty?
  sh "stow #{st_args} #{ENV['PKG']}"
end

desc 'Stow noop'
task 'stow:noop' do
  raise 'no $PKG' if (ENV['PKG'] || '').empty?
  sh "stow -n #{st_args} #{ENV['PKG']}"
end

desc 'Stow all'
task 'stow:all' do
  sh "stow #{st_args} #{stows*' '}"
end

desc 'Stow noop all'
task 'stow:noop:all' do
  sh "stow -n #{st_args} #{stows*' '}"
end

desc 'Apply'
task :apply do
  sh "puppet apply #{pp_args} #{man}/site.pp"
end

desc 'Apply file'
task 'apply:file' do
  raise 'no $FILE' if (ENV['FILE'] || '').empty?
  sh "puppet apply #{pp_args} #{ENV['FILE']}"
end

desc 'Noop'
task :noop do
  sh "puppet apply --noop #{pp_args} #{man}/site.pp"
end

desc 'Noop file'
task 'noop:file' do
  raise 'no $FILE' if (ENV['FILE'] || '').empty?
  sh "puppet apply --noop #{pp_args} #{ENV['FILE']}"
end

desc 'Check'
task :check do
  sh "find -L pp/ -name '*.pp' | xargs -n 1 -t puppet parser validate"
end

desc 'Sync'
task :sync do
  raise 'no $TO' if (ENV['TO'] || '').empty?
  sh "rsync -av --progress --delete --exclude=.git ./ #{ENV['TO']}/"
end
