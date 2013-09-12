# --                                                            ; {{{1
#
# File        : features/support/env.rb
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-09-12
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

require 'aruba/obfusk'

Before do
  process_VERBOSE
end

Before('@slow') do
  @aruba_timeout_seconds = 60
end

Before('@glacial') do
  @aruba_timeout_seconds = 600
end

Before('@cosmic') do
  @aruba_timeout_seconds = 3600
end

Before('@testdir') do
  raise 'no $FACTER_TESTDIR' if (ENV['FACTER_TESTDIR']||'').empty?
end

# vim: set tw=70 sw=2 sts=2 et fdm=marker :
