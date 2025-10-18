# `/opt` software environment config

# java
export JAVA_HOME='/opt/java/jdk-24.0.2'
export PATH=$JAVA_HOME/bin:$PATH 

export KOTLIN_HOME='/opt/kotlin'
export PATH=$KOTLIN_HOME/bin:$PATH

# maven
export MAVEN_HOME='/opt/maven/apache-maven-3.9.9'
export M2_HOME=$MAVEN_HOME
export PATH=$MAVEN_HOME/bin:$PATH
export MAVEN_REPOSITORY=$MAVEN_HOME/../maven-repository

