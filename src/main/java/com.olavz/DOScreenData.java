package com.olavz;

import javax.json.Json;
import javax.json.JsonObject;

/**
 * Created by Olavz on 02.10.2016.
 */
public class DOScreenData {

    /**
     * Actions:
     *      PING        Ping to check that data is still flowing
     *      WELCOME     First message to indicate the client was connected
     *      NAME        Client register session with a name.
     *      SCREEN      Data to be processed by the screen.
     */

    private String action = "";
    private String author = "";
    private String data = "";

    public JsonObject getJSON() {
        JsonObject jo = Json.createObjectBuilder()
                .add("action", action)
                .add("author", author)
                .add("data", data)
                .build();

        return jo;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

}
