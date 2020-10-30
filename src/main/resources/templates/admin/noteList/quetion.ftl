<!DOCTYPE html>

<html lang="en">

<head>

<meta  charset=UTF-8">

<title>问卷审核列表页面FreeMarker</title>


<script type="text/javascript"></script>

</head>

<body>

    <form class="app-form">

        <table style="border-collapse:separate; border-spacing:0px 20px;">

            <thead>

                <tr>
                    <th>问题名称</th>
                    <th align="center">选项</th>
                </tr>
            </thead>

            <tbody id="queList"></tbody>

        </table>

    </form>

 <hr/>


	<script>

        $(function() {
            getQueList();
        });
        function getQueList() {
            $("#queList").empty();
                    var quelist = ${queList};
  					$.each(quelist,function(index, que) {
                       var noteRow = $("<tr></tr>");
                       var Que_que_title = $("<td></td>").append(que.title);
                       var Que_que_optt = $("<td></td>").append(que.optt);
                       noteRow.append(Que_que_title).append(Que_que_optt);
                       $("#queList").append(noteRow);
                    })
        }
</script>

</body>

</html>