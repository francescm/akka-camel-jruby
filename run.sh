export AKKA_HOME=/opt/akka-microkernel-1.3.1

export CAMEL_HOME=/opt/apache-camel-2.7.5

export ACTIVEMQ_HOME=/opt/apache-activemq-5.5.1

export AKKA_JARS="$AKKA_HOME/lib/scala-library.jar:\
$AKKA_HOME/lib/akka/akka-stm-1.3.1.jar:\
$AKKA_HOME/lib/akka/akka-actor-1.3.1.jar:\
$AKKA_HOME/lib/akka/akka-camel-1.3.1.jar:\
$AKKA_HOME/lib/akka/multiverse-alpha-0.6.2.jar:\
$AKKA_HOME/lib/akka/akka-typed-actor-1.3.1.jar:\
$AKKA_HOME/lib/akka/aspectwerkz-2.2.3.jar:\
$AKKA_HOME/lib/akka/akka-camel-1.3.1.jar:\
$AKKA_HOME/lib/akka/akka-spring-1.3.1.jar:\
$CAMEL_HOME/lib/camel-core-2.7.5.jar:\
$CAMEL_HOME/lib/camel-spring-2.7.5.jar:\
$CAMEL_HOME/lib/camel-jms-2.7.5.jar:\
$CAMEL_HOME/lib/commons-management-1.0.jar:\
$ACTIVEMQ_HOME/activemq-all-5.5.1.jar:\
$ACTIVEMQ_HOME/lib/optional/activemq-pool-5.5.1.jar:\
$ACTIVEMQ_HOME/lib/optional/commons-pool-1.5.4.jar:\
$AKKA_HOME/config:\
."

echo $AKKA_JARS

jruby -J-classpath $AKKA_JARS camel_actor.rb