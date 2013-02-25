import akka.actor.{Actor, ActorSystem, Props}
import akka.actor.{IO, IOManager}

class EchoActor extends Actor {
  override def preStart {
    IOManager(context.system).listen("127.0.0.1", 8080)
  }

  def receive = {
    case IO.NewClient(serverSocket) => serverSocket.accept()
    case IO.Read(socket, bytes) => {

      socket.asWritable.write(bytes)
      if (bytes.utf8String.startsWith("QUIT"))
        socket.close
    }
  }
}

object EchoServer extends App {
  ActorSystem().actorOf(Props[EchoActor])
}
