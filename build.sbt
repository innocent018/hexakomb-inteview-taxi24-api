name := "hexakomb-interview"
 
version := "1.0" 
      
lazy val `hexakombinterview` = (project in file(".")).enablePlugins(PlayJava, PlayEbean)

resolvers += "scalaz-bintray" at "https://dl.bintray.com/scalaz/releases"
      
scalaVersion := "2.11.11"

libraryDependencies ++= Seq( javaJdbc , cache , javaWs )

unmanagedResourceDirectories in Test <+=  baseDirectory ( _ /"target/web/public/test" )

libraryDependencies += guice

libraryDependencies += "mysql" % "mysql-connector-java" % "8.0.11"
