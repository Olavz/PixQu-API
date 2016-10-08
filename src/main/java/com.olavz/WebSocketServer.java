package com.olavz;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;

@ServerEndpoint("/echo")
public class WebSocketServer {

    private static final ArrayList<Session> peers = new ArrayList<Session>();
    private static final HashMap<String, String> peersToID = new HashMap<String, String>();
    private static final HashMap<String, String> peersToName = new HashMap<String, String>();

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

    public void updateName(String id, String name) {
        peersToName.put(id, name);
    }

    public String getConnected() {
        JsonArrayBuilder builder = Json.createArrayBuilder();
        for(Session peer : peers) {
            builder.add(
                    Json.createObjectBuilder()
                            .add("id", peersToID.get(peer.getId()))
                            .add("name", peersToName.getOrDefault(peer.getId(), "Unknown")
                    ).build());
        }
        return Json.createObjectBuilder().add("connected", builder.build()).build().toString();
    }

    @OnOpen
    public void onOpen(Session session){
        peers.add(session);
        peersToID.put(session.getId(), java.util.UUID.randomUUID().toString());

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
        // {"action":"WELCOME","author":"","data":"Please register a name."}
        //JsonObject jo = Json.createObjectBuilder().add("message", message).build();
        InputStream is = new ByteArrayInputStream(message.getBytes("UTF-8"));
        JsonObject jo = Json.createReader(is).readObject();

        if(jo.getString("action").equals("NAME")) {
            String id = peersToID.get(session.getId());
            String name = jo.getString("data");
            updateName(id, name);
        }

        //if(jo.getString("action").equals("SCREEN")) {
            for (Session peer : session.getOpenSessions()) {
                peer.getBasicRemote().sendText(jo.toString());
            }
        //}
    }

    @OnClose
    public void onClose(Session session){
        peers.remove(session);
        peersToID.remove(session.getId());
        peersToName.remove(session.getId());
    }
}