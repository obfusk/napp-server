require 'tmpdir'

# --

def w_testdir(&b)                                               # {{{1
  if (ENV['TESTDIR'] || '').empty?
    Dir.mktempdir do |dir|
      ENV['FACTER_TESTDIR'] = dir
      b[]
    end
  else
    ENV['FACTER_TESTDIR'] = ENV['TESTDIR']
    b[]
  end
end                                                             # }}}1

# --

bin                   = "#{ Dir.pwd }/bin"
man                   = "#{ Dir.pwd }/pp/manifests"
mod                   = "#{ Dir.pwd }/pp/modules"

ENV['FACTER_pp_bin']  = bin
pp_args               = "--modulepath #{mod} -v"

stows                 = Dir['stow/*'].map { |x| File.basename x }
st_args               = '-vv -d stow'

cuke                  = ENV['CUKE']

# --

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

# --

desc 'Apply site.pp'
task :apply do
  sh "puppet apply #{pp_args} #{man}/site.pp"
end

desc 'Apply test.pp'
task 'apply:test' do
  w_testdir do
    sh "puppet apply #{pp_args} #{man}/test.pp"
  end
end

desc 'Apply file'
task 'apply:file' do
  raise 'no $FILE' if (ENV['FILE'] || '').empty?
  sh "puppet apply #{pp_args} #{ENV['FILE']}"
end

desc 'Noop site.pp'
task :noop do
  sh "puppet apply --noop #{pp_args} #{man}/site.pp"
end

desc 'Noop test.pp'
task 'noop:test' do
  w_testdir do
    sh "puppet apply --noop #{pp_args} #{man}/test.pp"
  end
end

desc 'Noop file'
task 'noop:file' do
  raise 'no $FILE' if (ENV['FILE'] || '').empty?
  sh "puppet apply --noop #{pp_args} #{ENV['FILE']}"
end

# --

desc 'Run cucumber'
task :cuke do
  w_testdir do
    sh "cucumber -fprogress #{cuke}"
  end
end

desc 'Run cucumber strictly'
task 'cuke:strict' do
  w_testdir do
    sh "cucumber -fprogress -S #{cuke}"
  end
end

desc 'Run cucumber verbosely'
task 'cuke:verbose' do
  w_testdir do
    sh "cucumber #{cuke}"
  end
end

desc 'Run cucumber verbosely, view w/ less'
task 'cuke:less' do
  w_testdir do
    sh "cucumber -c #{cuke} | less -R"
  end
end

desc 'Cucumber step defs'
task 'cuke:steps' do
  sh 'cucumber -c -fstepdefs | less -R'
end

# --

desc 'Check'
task :check do
  sh "find -L pp/ -name '*.pp' | xargs -n 1 -t puppet parser validate"
end

# --

desc 'Sync'
task :sync do
  raise 'no $TO' if (ENV['TO'] || '').empty?
  sh "rsync -av --progress --delete --exclude=.git ./ #{ENV['TO']}/"
end
