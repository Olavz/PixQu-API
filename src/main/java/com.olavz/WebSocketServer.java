package com.olavz;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;

@ServerEndpoint("/echo")
public class WebSocketServer {

    private static final ArrayList<Session> peers = new ArrayList<Session>();

    private static WebSocketServer _echoServer;

    public static WebSocketServer getGetInstance() {
        if(_echoServer == null) {
            _echoServer = new WebSocketServer();
        }
        return _echoServer;
    }

    public void messageAll(DOScreenData screenData) {
        for(Session peer : peers) {
            try {
                peer.getBasicRemote().sendText(screenData.getJSON().toString());
            } catch (IOException e) {
            }
        }
    }

    public String getConnected() {
        StringBuilder sb = new StringBuilder();
        for(Session peer : peers) {
            sb.append(peer.getId());
            sb.append(",");
        }
        return sb.toString();
    }

    @OnOpen
    public void onOpen(Session session){
        peers.add(session);
        DOScreenData screenData = new DOScreenData();
        screenData.setAction("WELCOME");
        screenData.setData("Please register a name.");

        try {
            session.getBasicRemote().sendText(screenData.getJSON().toString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException{
        JsonObject jo = Json.createObjectBuilder().add("message", message).build();

        for (Session peer : session.getOpenSessions()) {
            peer.getBasicRemote().sendText(jo.toString());
        }
    }

    @OnClose
    public void onClose(Session session){
        peers.remove(session);
    }
}