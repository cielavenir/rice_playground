require 'bundler/setup'
#require 'rice'
require 'mkmf-rice'

rice_version_a = Gem.loaded_specs["rice"].version.to_s.split('.').map(&:to_i)
RICE_VERSION = rice_version_a[0]*10000 + rice_version_a[1]*100 + rice_version_a[2]
$CXXFLAGS += " -DRICE_VERSION=#{RICE_VERSION}"

$srcs = ['ext/rice_playground.cpp']
$VPATH << 'ext'
create_makefile('slz')

