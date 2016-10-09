<%--
  Created by IntelliJ IDEA.
  User: Olavz
  Date: 08.10.2016
  Time: 02.24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PixQU - Getting started</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="application/javascript">

        $(document).ready(function () {
            $("#post_data").click(function () {

                var testdata = new Object();
                testdata.title = "Random testdata";

                var frames = new Array();
                for(var i=0; i<10; i++) {
                    frames[i] = randomFrame();
                }

                var nf = new Object();
                nf.duration = 100;
                nf.data = "";
                frames[2] = nf;

                testdata.frames = frames;

                $.ajax({
                    url: '/api/screen/test123',
                    type: 'POST',
                    data: JSON.stringify(testdata),
                    success: function(result) {
                        console.log(result);
                    }
                });

            });
        });

        function randomFrame() {
            var frame = new Object();
            frame.duration = 500;
            var data = "";
            for(var i=0; i<40; i++) {
                if(i>0) {
                    data += "\r\n";
                }
                for(var j=0; j<60; j++) {
                    data += "" + getRandomArbitrary(0, 1);
                }
            }
            frame.data = data;
            return frame;
        }

        function getRandomArbitrary(min, max) {
            return Math.round(Math.random() * (max - min) + min);
        }

    </script>

</head>
<body>
<pre>


    Use <a href="test.jsp">test.jsp</a> to simulate active client.


    Socket overview
    Show available clients: <a href="/api/socket/connected">/api/socket/connected</a>



</pre>
</body>
</html>
