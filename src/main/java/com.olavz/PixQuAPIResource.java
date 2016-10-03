package com.olavz;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

@Path("/")
public class PixQuAPIResource {
    private WebSocketServer wss = WebSocketServer.getGetInstance();

    @GET
    public Response ping() {
        DOScreenData screenData = new DOScreenData();
        screenData.setAction("PING");
        screenData.setData("test");
        screenData.setAuthor("test");
        wss.messageAll(screenData);

        return Response.ok("Ping!").build();
    }

    @GET
    @Path("/connected")
    public Response getConnected() {
        return Response.ok("Connected.. " + wss.getConnected()).build();
    }

    @POST
    @Path("/screen/{screenId}")
    public Response postDataToScreen(@PathParam("screenId") String screenId, InputStream is) throws IOException {
        // TODO: Check if screenId is available

        // Read posted data
        BufferedReader streamReader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
        StringBuilder responseStrBuilder = new StringBuilder();

        String inputStr;
        while ((inputStr = streamReader.readLine()) != null)
            responseStrBuilder.append(inputStr);

        // TODO:  Post data to screenId, not all.
        DOScreenData screenData = new DOScreenData();
        screenData.setAction("SCREEN");
        screenData.setData(responseStrBuilder.toString());
        wss.messageAll(screenData);

        return Response.ok().build();
    }


}
