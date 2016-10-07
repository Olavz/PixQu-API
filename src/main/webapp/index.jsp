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
            var wsUri = "ws://" + document.location.hostname + ":" + document.location.port + document.location.pathname + "echo";
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
                chatlogField.innerHTML += evt.data + "\n";

            }

            function onMessage(evt) {
                console.log(evt.data);
            }

            function onError(evt) {
            }

            $("#testsave").click(function() {
                var m = $("#message").val();
                websocket.send(m);
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
    <input id="message" type="password"> <input id="testsave" type="button" value="Create new graph" /> <br>
</div>


</body>
</html>