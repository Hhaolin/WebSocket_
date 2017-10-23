package webSocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Currency;
import java.util.List;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.PongMessage;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/socketTest/{param}")
public class WebSocket {
	//当前人数
	private static int count ;
	
	//保存姓名
	private static String username;
	
	//存储当前已连接的socket
	private static List<WebSocket> set = new ArrayList<WebSocket>();
	
	private Session session;
	
	@OnClose
	public void onClose(Session session, CloseReason closeReason) {
		// TODO Auto-generated method stub
		set.remove(this);
	}
	 
	@OnMessage
	public void onMessage(String message,@PathParam(value="param") String param) {
		// TODO Auto-generated method stub
		
		message = param+ " : "+ message;
		 for(WebSocket socket: set){
			  try {
				  socket.SendMessage(message);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  }
	}
	@OnOpen
	public void onOpen(Session session, EndpointConfig endpointConfig,@PathParam(value="param") String param) {
		// TODO Auto-generated method stub
		this.session=  session;
		this.username = param;
		set.add(this);
	}
	 
	@OnError
	public void onError(Session session, Throwable throwable) {
		// TODO Auto-generated method stub
	}
	
	//发送
	public void SendMessage(String message) throws IOException{
		
		 this.session.getBasicRemote().sendText(message);
	}
	
}
