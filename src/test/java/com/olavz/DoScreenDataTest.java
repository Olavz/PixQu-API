package com.olavz;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class DoScreenDataTest {

    private DOScreenData doScreenData;

    @Before
    public void createDOScreenDataTest() {
        doScreenData = new DOScreenData();
        doScreenData.setAction("welcomea");
        doScreenData.setAuthor("System");
        doScreenData.setData("aHello World!");
    }

    @Test
    public void getAction() throws Exception {
        // Action's will always be uppercase.
        String action = doScreenData.getAction();
        assertEquals("WELCOME", action);
    }

    @Test
    public void getAuthor() throws Exception {
        String author = doScreenData.getAuthor();
        assertEquals("System", author);
    }

    @Test
    public void getData() throws Exception {
        String data = doScreenData.getData();
        assertEquals("Hello World!", data);
    }
}
