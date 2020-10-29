<script type="text/javascript" src="jquery-3.2.1.js"></script>
<link rel="stylesheet" href="/css/wenjuansq.css">
<link rel="stylesheet" type="text/css" href="css/wenjuan_ht.css">
<div class="div1">
<br>
<h1 align="center">问卷反馈</h1>
<br>
<br>
<table border="1" width="1000px" height="50px" alight="center">

            <thead>

                <tr>

                    <th>问卷标题</th>

                    <th>状态</th>

                    <th>描述</th>

                    <th>查看详情</th>

                </tr>

            </thead>

            <tbody id="feedback"></tbody>

        </table>
</div>
<script>
$(function() {

    getFeedback();

});

function getFeedback() {

    $("#feedback").empty();

    $.ajax({

                url : "/system/feedback/note",

                type : "GET",

                dataType : "json",

                success : function(data) {

                    $.each(data,

                                    function(feedback,note) {

                                        var noteRow = $("<tr></tr>");

                                        var titleCell = $("<td></td>")

                                                .append(note.title);
                                        var stateCell = $("<td></td>")

                                        .append(note.state);

                                        var descCell = $("<td></td>")
                                        
                                                .append(note.desc);
                                        
                                        var editButton = $(

                                        		"<a href='/system/feedback/getNoteDetails'>******</a>")

                                        .attr("edit-id",

                                                note.note_id);
                                        
                                        var opCell=$("<td></td>").append(editButton);
                                        
                                        noteRow.append(titleCell)
                                        .append(stateCell)
                                        .append(descCell)
                                        .append(opCell);

                                        $("#feedback").append(noteRow);
                                    });
                }
            });
}
$(document).on("click", ".editClass", function() {
	var uid = $(this).attr("edit-id");

	$.ajax({

		url : "/system/feedback/result",

		type : "GET",

	});

});

/* $(document).ready(function () {
	 
});
function method() {
    var val = $("#userId").val();
    $.ajax({
        type:"GET",
        url:"getUser",
        // data:{"id":val},     // data参数是可选的，有多种写法，也可以直接在url参数拼接参数上去，例如这样：url:"getUser?id="+val,
        data:"id="+val,
        async:true,   // 异步，默认开启，也就是$.ajax后面的代码是不是跟$.ajx里面的代码一起执行
        cache:true,  // 表示浏览器是否缓存被请求页面,默认是 true
        dataType:"json",   // 返回浏览器的数据类型，指定是json格式，前端这里才可以解析json数据
        success:function(data){
            $("#name").text(data.name);
            $("#age").text(data.age);
        },
        error:function(){
            console.log("发生错误")
            alert("发生错误");
        },
        complete:function(){
            console.log("ajax请求完事，最终操作在这里完成")
        }
    });
    // alert("测试异步")
} */
</script>