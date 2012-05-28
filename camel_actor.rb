require 'java'
java_import java.lang.System
java_import "org.slf4j.LoggerFactory"
java_import 'akka.actor.ActorRegistry'
java_import 'akka.actor.Actors'
java_import 'akka.camel.Message'
java_import 'akka.camel.UntypedConsumerActor'

java_import 'org.apache.camel.spi.Registry'
java_import 'org.apache.camel.spring.spi.ApplicationContextRegistry'
 
java_import 'org.springframework.context.ApplicationContext'
java_import 'org.springframework.context.support.ClassPathXmlApplicationContext'
 
java_import 'akka.camel.CamelContextManager'
 
# create a custom Camel registry backed up by a Spring application context
context = ClassPathXmlApplicationContext.new("camel-context.xml");

logger = LoggerFactory.getLogger("akka")
logger.info("Hello from akka.")

module Akka
  include_package 'akka.actor'
end

module AkkaCamel
  include_package 'akka.camel'
end


class JmsConsumer < AkkaCamel::UntypedConsumerActor 
  def self.create(*args)
    self.new(*args)
  end

  def getEndpointUri
    return "local-activemq:queue:akka.to"
  end

  def onReceive(msg) 
    body = msg.body
    puts "!!! body: #{body}"
    headers = msg.headers
    headers.keys.foreach do |key|
      puts "!!! header key: #{key}, #{headers[key]}"
    end

  end
end


camel_actor = Akka::Actors.actorOf(JmsConsumer).start

trap("INT") { 
  logger.info "CTRL + C"
  sleep 1
  Akka::Actors.registry.shutdown_all
  context.destroy
}



