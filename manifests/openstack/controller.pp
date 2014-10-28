###############################################################################
##                                                                           ##
## The MIT License (MIT)                                                     ##
##                                                                           ##
## Copyright (c) 2014 AT&T Inc.                                              ##
##                                                                           ##
## Permission is hereby granted, free of charge, to any person obtaining     ##
## a copy of this software and associated documentation files                ##
## (the "Software"), to deal in the Software without restriction, including  ##
## without limitation the rights to use, copy, modify, merge, publish,       ##
## distribute, sublicense, and/or sell copies of the Software, and to permit ##
## persons to whom the Software is furnished to do so, subject to the        ##
## conditions as detailed in the file LICENSE.                               ##
##                                                                           ##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS   ##
## OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF                ##
## MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.    ##
## IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY      ##
## CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT ##
## OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR  ##
## THE USE OR OTHER DEALINGS IN THE SOFTWARE.                                ##
##                                                                           ##
###############################################################################
#
# ==Class: role::openstack::controller
#
class role::openstack::controller {
  include profile::base
  include profile::cloud
  include profile::openstack::setup
  include profile::openstack::api
  include profile::openstack::horizon
  include profile::openstack::controller
  #include profile::openstack::volumes
  include profile::openstack::proxy
  include profile::openstack::network
  include profile::openstack::firewall
  include profile::tempest::users
  include profile::openstack::glanceimages
  include profile::openstack::savanna
  include profile::openstack::ceilometer::controller

  #Class['profile::openstack::volumes']
  #  -> Class['profile::openstack::controller']
  Class['profile::openstack::controller']
    -> Class['profile::openstack::glanceimages']

  include rabbitmq
  Class['rabbitmq::install'] -> Class['haproxy']

}
