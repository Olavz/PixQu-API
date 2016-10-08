<!DOCTYPE html>

<html>
<head>
    <title>document</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">

        var websocket;
        var charts = [];
        $(document).ready(function () {
            var wsUri = "ws://" + document.location.hostname + ":" + document.location.port + "/echo";
            console.log(wsUri);
            websocket = new WebSocket(wsUri);
            websocket.onopen = function (evt) {
                onOpen(evt)
            };
            websocket.onmessage = function (evt) {
                onMessage(evt)
            };
            websocket.onerror = function (evt) {
                onError(evt)
            };


            function onOpen(evt) {
                console.log(evt);
            }

            function onMessage(evt) {
                console.log(evt.data);
            }

            function onError(evt) {
            }

            $("#testsave").click(function() {
                // {"action":"WELCOME","author":"","data":"Please register a name."}
                var name = $("#message").val();
                var obj = new Object();
                obj.action = "NAME";
                obj.author = "";
                obj.data = name;
                websocket.send(JSON.stringify(obj));
            });

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

    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
        }

    </style>

</head>

<div style="padding: 10px;">
    <input id="message" type="text"> <input id="testsave" type="button" value="Send" /> <br>

    <br>
    <input type="button" id="post_data" value="Post data">
</div>


</body>
</html>