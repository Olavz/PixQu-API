<html>
<head>
    <title>Mock REST API Check</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript">
        
        $(document).ready(function () {

            $(".ajaxButton").click(function() {
                var method = $(this).attr('method');
                var url = $(this).attr('url');
                $.ajax({
                    method: method,
                    url: "../" + url,
                    success: function(data) {
                        console.log(data);
                        $(this).parent().children(".results").text(data);
                    }
                });
            });


        });

        
    </script>
</head>
<body>


1. GET api/mock/manyPurposeResource

<div>
    <div>Code block</div>
    <button class="ajaxButton" id="btnGet" method="GET" url="api/mock/manyPurposeResource">TEST</button>
    <div class="results">Results block</div>
</div>


</body>
</html>
