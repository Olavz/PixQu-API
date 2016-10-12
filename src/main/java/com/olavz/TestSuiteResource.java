package com.olavz;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;

@Path("/mock")
public class TestSuiteResource {

    /**
     * See also: http://www.restapitutorial.com/lessons/httpmethods.html
     */

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


}
