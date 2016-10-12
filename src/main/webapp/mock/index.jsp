<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Mock REST API Check</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $("#btnGet").click(function (e) {
                e.preventDefault();
                var cardText = $(this).parent().children('.card-text');

                $.ajax({
                    method: "GET",
                    url: "../api/mock/manyPurposeResource",
                    success: function (data) {
                        cardText.html(data);
                    }
                });

            });

            $("#btnPost").click(function (e) {
                e.preventDefault();
                var cardText = $(this).parent().children('.card-text');

                $.ajax({
                    method: "POST",
                    url: "../api/mock/manyPurposeResource",
                    success: function (data) {
                        cardText.html(data);
                    }
                });

            });

            $("#btnPut").click(function (e) {
                e.preventDefault();
                var cardText = $(this).parent().children('.card-text');

                $.ajax({
                    method: "PUT",
                    url: "../api/mock/manyPurposeResource",
                    success: function (data) {
                        cardText.html(data);
                    }
                });

            });

            $("#btnDelete").click(function (e) {
                e.preventDefault();
                var cardText = $(this).parent().children('.card-text');

                $.ajax({
                    method: "DELETE",
                    url: "../api/mock/manyPurposeResource",
                    success: function (data) {
                        cardText.html(data);
                    }
                });

            });

            $("#btnStatus").click(function (e) {
                e.preventDefault();
                var cardText = $(this).parent().children('.card-text');
                var httpStatus = $("#httpStatus").val();

                $.ajax({
                    method: "GET",
                    url: "../api/mock/produceStatus/" + httpStatus,
                    success: function (data) {
                        cardText.html(data);
                    },
                    statusCode: {
                        404: function() {
                            cardText.html("Page not found.");
                        },
                        418: function() {
                            alert("418 I'm a teapot");
                        }
                    }
                });

            });


            $("#btnConsumesJson").click(function (e) {
                e.preventDefault();
                var cardText = $(this).parent().children('.card-text');
                var httpStatus = $("#httpStatus").val();

                $.ajax({
                    method: "POST",
                    url: "../api/mock/consume/",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        cardText.html(data);
                    }
                });

            });

            $("#btnConsumesXml").click(function (e) {
                e.preventDefault();
                var cardText = $(this).parent().children('.card-text');
                var httpStatus = $("#httpStatus").val();

                $.ajax({
                    method: "POST",
                    url: "../api/mock/consume/",
                    contentType: "application/xml; charset=utf-8",
                    success: function (data) {
                        cardText.html(data);
                    }
                });

            });




        });

    </script>
</head>
<body>
<div class="container">
    <h1>Mock REST API Check</h1>


    <ul>
        <li><a href="http://www.restapitutorial.com/lessons/httpmethods.html">
                http://www.restapitutorial.com/lessons/httpmethods.html</a>
        </li>
        <li><a href="http://api.jquery.com/jquery.ajax/">
            http://api.jquery.com/jquery.ajax/</a>
        </li>
    </ul>

    <div class="row">
        <div class="col-sm-6">
            <div class="card card-block text-xs-right">
                <h4 class="card-title"><span class="tag tag-default">GET</span> api/mock/manyPurposeResource</h4>
                <p class="card-text"></p>
                <a id="btnGet" href="#" class="btn btn-primary">Run</a>
            </div>

            <div class="card card-block text-xs-right">
                <h4 class="card-title"><span class="tag tag-default">POST</span> api/mock/manyPurposeResource</h4>
                <p class="card-text"></p>
                <a id="btnPost" href="#" class="btn btn-primary">Run</a>
            </div>
        </div>

        <div class="col-sm-6">
            <div class="card card-block text-xs-right">
                <h4 class="card-title"><span class="tag tag-default">PUT</span> api/mock/manyPurposeResource</h4>
                <p class="card-text"></p>
                <a id="btnPut" href="#" class="btn btn-primary">Run</a>
            </div>

            <div class="card card-block text-xs-right">
                <h4 class="card-title"><span class="tag tag-default">DELETE</span> api/mock/manyPurposeResource</h4>
                <p class="card-text"></p>
                <a id="btnDelete" href="#" class="btn btn-primary">Run</a>
            </div>
        </div>
    </div>

    <hr>

    <div class="row">
        <div class="col-sm-6">
            <div class="card card-block text-xs-right">
                <h4 class="card-title"><span class="tag tag-default">GET</span> api/mock/produceStatus/{httpStatus}</h4>
                <input type="number" value="200" id="httpStatus">
                <p class="card-text"></p>
                <a id="btnStatus" href="#" class="btn btn-primary">Run</a>
            </div>

            <div class="card card-block text-xs-right">
                <h4 class="card-title"><span class="tag tag-default">POST</span> api/mock/consume</h4>
                <p class="card-text"></p>
                <a id="btnConsumesJson" href="#" class="btn btn-primary">Run JSON</a>
                <a id="btnConsumesXml" href="#" class="btn btn-primary">Run XML</a>
            </div>

        </div>

        <div class="col-sm-6">

        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
