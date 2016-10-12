package com.olavz;
import org.glassfish.jersey.server.ResourceConfig;

public class RESTConfiguration extends ResourceConfig
{
    public RESTConfiguration() {
        register(PixQuAPIResource.class);
        register(TestSuiteResource.class);
    }
}
