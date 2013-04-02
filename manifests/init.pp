# Class: graphite
#
# This module manages graphite
#
class graphite (
  $timezone     = $::timezone,
  $amqp_enable   = false,
  $amqp_verbose  = 'True',
  $amqp_host     = 'localhost',
  $amqp_port     = '5672',
  $amqp_vhost    = '/',
  $amqp_user     = 'guest',
  $amqp_password = 'guest',
  $amqp_exchange = 'graphite',
  $amqp_metric_name_in_body = 'False'
  )
  {

  include graphite::whisper
  include graphite::carbon
  class { 'graphite::web':
    timezone => $timezone,
  }

  Class['graphite::whisper'] -> Class['graphite::carbon'] -> Class['graphite::web']

}
