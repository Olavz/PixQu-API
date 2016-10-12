package com.olavz.resources;

import javax.json.Json;
import javax.json.JsonObject;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;

@Path("/mock")
public class TestSuiteResource {

    @GET
    @Path("manyPurposeResource")
    public Response mockGet() {
        return Response.ok("Hello, I will only work with GET requests.").build();
    }

    @POST
    @Path("manyPurposeResource")
    public Response mockPost() {
        return Response.ok("Hello, I will only work with POST requests.").build();
    }

    @PUT
    @Path("manyPurposeResource")
    public Response mockPut() {
        return Response.ok("Hello, I will only work with PUT requests.").build();
    }

    @DELETE
    @Path("manyPurposeResource")
    public Response mockDelete() {
        return Response.ok("Hello, I will only work with DELETE requests.").build();
    }

    @GET
    @Path("produceStatus/{httpStatus}")
    public Response mockGet(@PathParam("httpStatus") int httpStatus) {
        return Response.status(httpStatus).entity("I am still a valid page, producing http status: " + httpStatus).build();
    }

    @POST
    @Path("consume")
    @Consumes("application/json")
    public Response mockConsumeJson() {
        JsonObject jo = Json.createObjectBuilder().add("type", "JSON").build();
        return Response.ok(jo.toString()).build();
    }

    @POST
    @Path("consume")
    @Consumes({"application/xml"})
    public Response mockConsumeXML() {
        JsonObject jo = Json.createObjectBuilder().add("type", "XML").build();
        return Response.ok(jo.toString()).build();
    }

}
