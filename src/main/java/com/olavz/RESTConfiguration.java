package com.olavz;
import com.olavz.resources.PixQuAPIResource;
import com.olavz.resources.TestSuiteResource;
import org.glassfish.jersey.server.ResourceConfig;

public class RESTConfiguration extends ResourceConfig
{
    public RESTConfiguration() {
        register(PixQuAPIResource.class);
        register(TestSuiteResource.class);
    }
}
