# --                                                            ; {{{1
#
# File        : manifests/site.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-09-13
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

import 'common.pp'

# node 'vm-pp' {
#   include java7::maven
#   lein { '/opt/bin/lein': }
#   nodejs { '/opt/pkg/node':
#     bin => '/opt/bin/node',
#     npm => '/opt/bin/npm',
#   }
#   python::venv { '/opt/src/venv': bin => '/opt/bin/venv' }
# }

# vim: set tw=70 sw=2 sts=2 et fdm=marker :
