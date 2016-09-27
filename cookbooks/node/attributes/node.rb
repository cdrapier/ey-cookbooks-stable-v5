fallback_nodejs_version = case attribute['dna']['engineyard']['environment']
  ['components'].map(&:values).flatten.find(/^nodejs_/).first
                           when 'nodejs_6'
                             '6.4.0'
                           when 'nodejs_5'
                             '5.11.0'
                           else
                             '4.4.5'
                           end

default['nodejs']['version'] = node.engineyard.environment.metadata(
'nodejs_version', fallback_nodejs_version
)

default['nodejs']['available_versions'] = [
  '0.12.6',  # net-libs/nodejs-0.12.6
  '0.12.7',  # net-libs/nodejs-0.12.7
  '0.12.10',  # net-libs/nodejs-0.12.10
  '4.4.0', # net-libs/nodejs-4.4.0
  '4.4.1', # net-libs/nodejs-4.4.1
  '4.4.5', # net-libs/nodejs-4.4.5
  '5.9.1', # net-libs/nodejs-5.9.1
  '5.10.1', # net-libs/nodejs-5.10.1
  '5.11.0', # net-libs/nodejs-5.11.0
  '6.4.0' # net-libs/nodejs-6.4.0
]

if (node.engineyard.metadata('openssl_ebuild_version','1.0.1') =~ /1\.0\.1/)
  default['nodejs']['available_versions'].concat ([
    '0.12.6',  # net-libs/nodejs-0.12.6
    '0.12.7',  # net-libs/nodejs-0.12.7
    '0.12.10',  # net-libs/nodejs-0.12.10
    '4.4.0', # net-libs/nodejs-4.4.0
    '4.4.1', # net-libs/nodejs-4.4.1
    '4.4.5', # net-libs/nodejs-4.4.5
    '5.9.1', # net-libs/nodejs-5.9.1
    '5.10.1', # net-libs/nodejs-5.10.1
    '5.11.0', # net-libs/nodejs-5.11.0
    '6.4.0' # net-libs/nodejs-6.4.0

  ])
end

#Note Libuv is required for newer nodejs versions
default['nodejs']['libuv']['version'] = '1.9.1'

# Note: see cookbooks/node/recipes/common.rb to set the package for any new versions

default['coffeescript']['version'] = node.engineyard.metadata('coffeescript_version','1.9.3')
