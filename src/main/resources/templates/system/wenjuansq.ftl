<link rel="stylesheet" href="/css/wenjuansq.css">
<link rel="stylesheet" type="text/css" href="css/wenjuan_ht.css">
<div class="div1">
<h3 align="center">申请问卷</h3>
<form id="sqwenjuanform">
<input type="hidden" name="hiddenk" id="hiddenk" value='${s_member.userName}'>
<table class="table1">
<tr class="tr1"><td  width="20%">问卷标题:</td>
<td><input class="input1" type="text" name="title" id="title">  </td>
</tr>
<tr class="tr1"><td>问卷说明:</td>
<td>
<input class="input1" type="text" name="desc" id="desc">  </td>
</tr>
<tr class="tr1"><td>问卷开始时间:</td>
<td><input class="input1" type="datetime-local" name="starttime" id="starttime">请输入两天后的时间，必填  </td>
</tr>
<tr class="tr1"><td>问卷结束时间:</td>
<td><input class="input1" type="datetime-local" name="endtime" id="endtime">必填 </td>
</tr>
<tr class="tr1"><td>是否匿名发布:</td>
<td><input class="input1" type="radio" name="anon" id="anon" value="yes">是
<input class="input1" type="radio" name="anon" id="anon" value="no" checked="checked">否
</td>
</tr>
<tr class="tr1"><td colspan="2" align="center"><input type="button" id="sqwenjuanb" value="确定申请问卷"></td>
</tr>
</table>
</form>
<hr>
<div id="wenjuanDiv" style="display:none">
<h3 align="center">编辑问卷</h3>
 <div class=" all_660">
    <table id="wenjuan_dg"></table>
        <div class="yd_box"></div>
        <div class="but" style="padding-top: 20px">
        <input type="button" class="ssClass" edit-id="0" value="单选"/>
        <input type="button" class="ssClass" edit-id="1" value="多选"/>
        <input type="button" class="ssClass" edit-id="2" value="填空"/>
        <input type="button" class="tijiaobtn" value="提交问题"/>
        </div>
        <!--选项卡区域  模板区域---------------------------------------------------------------------------------------------------------------------------------------->
        <div class="xxk_box">
            <div class="xxk_conn hide">
                <!--单选----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box dxuan ">
                <span>请编辑单选题目</span>
                    <textarea name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx" placeholder="单选题目"></textarea>
                    <span>是否将此题设为必填</span>
                    <input type="radio" name="bitian" id="bitian1" value="s" checked="checked">必填
                    <input type="radio" name="bitian" id="bitian2" value="f">选填
                    <div class="title_itram">
                        <div class="kzjxx_iteam">
                            <input name="" type="radio" value="" class="dxk">
                            <input name="" type="text" class="input_wenbk" value="【单选】">
                            <a href="javascript:void(0);" class="del_xm">删除</a>
                        </div>
                    </div>
                    <a href="javascript:void(0)" class="zjxx">增加选项</a>
                    <!--完成编辑-->
                    <div class="bjqxwc_box">
                        <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                        <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                    </div>
                </div>
                <!--多选----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box duoxuan hide">
                <span>请编辑多选题目</span>
                    <textarea name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_duox" placeholder="多选题目"></textarea>
                    <span>是否将此题设为必填</span>
                    <input type="radio" name="bitian" id="bitian1" value="s" checked="checked">必填
                    <input type="radio" name="bitian" id="bitian2" value="f">选填
                    <div class="title_itram">
                        <div class="kzjxx_iteam">
                            <input name="" type="checkbox" value="" class="dxk">
                            <input name="" type="text" class="input_wenbk" value="【多选】" >
                            <a href="javascript:void(0);" class="del_xm">删除</a>
                        </div>
                    </div>
                    <a href="javascript:void(0)" class="zjxx">增加选项</a>
                    <!--完成编辑-->
                    <div class="bjqxwc_box">
                        <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                        <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                    </div>
                </div>
                <!-- 填空----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box tktm hide">
                <span>请编辑问答题目</span>
                    <textarea name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="答题区"></textarea>
                    <span>是否将此题设为必填</span>
                    <input type="radio" name="bitian" id="bitian1" value="s" checked="checked">必填
                    <input type="radio" name="bitian" id="bitian2" value="f">选填
                    <!--完成编辑-->
                    <div class="bjqxwc_box">
                        <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                        <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                    </div>
                </div></div>
            </div>
        </div>
    </div>
</div>
</div>