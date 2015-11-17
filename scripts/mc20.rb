#! /usr/bin/env ruby
require 'orocos'
include Orocos

Orocos::CORBA.name_service.ip = "192.168.128.31"
Orocos.initialize

Orocos.run 'controldev::GraupnerMC20Task' => 'mc20' do

    mc20 = TaskContext.get 'mc20'

    mc20.io_port = "serial:///dev/ttyUSB0:115200"
    puts "bevor configure"
    mc20.configure
    puts "after configure"
    mc20.start
    Orocos.watch(mc20)

    

end
