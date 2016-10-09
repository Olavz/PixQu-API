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



        });
        


    </script>

    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
        }

    </style>

</head>

<div style="padding: 10px;">
    <h1>Simple WS client</h1>
    <input id="message" type="text"> <input id="testsave" type="button" value="Send" /> <br>
</div>


</body>
</html>