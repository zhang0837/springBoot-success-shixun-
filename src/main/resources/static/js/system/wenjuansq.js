$(document).ready(function(e) {
	var djigdiv;
	var hovdijidiv;
	$(document).on("click","#sqwenjuanb",function(){
		var title=$("#title").val();
		var startime=$("#starttime").val();
		var entime=$("#endtime").val();
		var anon=$("input[name='anon']:checked").val();
		var desc=$("#desc").val();
		var creator=$("#hiddenk").val();
		var starttime = new Date(startime);
		starttime=starttime.getFullYear() + '-' + (starttime.getMonth() + 1) + '-' + starttime.getDate() + ' ' + starttime.getHours() + ':' + starttime.getMinutes() + ':' + starttime.getSeconds();
		var endtime = new Date(entime);
		endtime=endtime.getFullYear() + '-' + (endtime.getMonth() + 1) + '-' + endtime.getDate() + ' ' + endtime.getHours() + ':' + endtime.getMinutes() + ':' + endtime.getSeconds();
		if(title.length==0||startime.length==0||entime.length==0){
			alert("问卷标题和开始时间，结束时间都必须填写！")
		}else{
			$.ajax({
				url : "/system/wenjuansq/sqbiao",
				type : "POST",
				data:{'title':title,'desc':desc,'anon':anon,'starttime':starttime,'endtime':endtime,'creator':creator},//此处不是JSON数据，在Controller中不能使用@RequestBody进行转换
				success : function(data) {
					alert(data.msg);
					if(data.pd){
					$("#title").attr("readonly",true);
					$("#starttime").attr("readonly",true);
					$("#endtime").attr("readonly",true);
					$('#anon').attr('onClick',"javascript:return false"); 
					$("#desc").attr("readonly",true);
					$("#sqwenjuanb").attr("disabled",true);
					$("#wenjuanDiv").css("display","block");
					}
				}
			});
		}
		

		
		
	});
	//选中的div是第几个
	 $(document).on("click",".movie_box",function(){
		    djigdiv = $(".movie_box").index(this);
	 });
	$(document).on("click",".ssClass",function() {

        // debugger
		var index=$(this).attr("edit-id"); //选择添加问题的类型
        if (index == "-1") {
            return;
        }
        var movie_box = '<div class="movie_box" style="border: 1px solid rgb(255, 255, 255);"></div>';
        var Grade = $(".yd_box").find(".movie_box").length + 1;
        switch (index) {
            case "0": //单选
            case "1": //多选
            case "2": //问答
                var wjdc_list = '<ul class="wjdc_list"></ul>'; //问答 单选 多选
                var danxuan = "";
                if (index == "0") {
                    danxuan = '【单选】';
                } else if (index == "1") {
                    danxuan = '【多选】';
                } else if (index == "2") {
                    danxuan = '【问答】';
                }
                
                wjdc_list = $(wjdc_list).append(' <li><div class="tm_btitlt"><i class="nmb">' + Grade + '</i>. <i class="btwenzi"></i><span class="tip_wz">' + danxuan + '</span></div></li>');
                if (index == "2") {
                    wjdc_list = $(wjdc_list).append('<li>  <label> <textarea name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx" ></textarea></label> </li>');
                }
                movie_box = $(movie_box).append(wjdc_list);
                movie_box = $(movie_box).append('<div class="dx_box" data-t="' + index + '"></div>');

                break;
           }
        
        $(movie_box).hover(function() {
        	hovdijidiv = $(".movie_box").index(this);
            var html_cz = "<div class='kzqy_czbut'><a href='javascript:void(0)' class='sy'>上移</a><a href='javascript:void(0)'  class='xy'>下移</a><a href='javascript:void(0)'  class='bianji'>编辑</a><a href='javascript:void(0)' class='del' >删除</a></div>"
            $(this).css({
                "border": "1px solid #0099ff"
            });
            $(this).children(".wjdc_list").after(html_cz);
        }, function() {
            $(this).css({
                "border": "1px solid #fff"
            });
            $(this).children(".kzqy_czbut").remove();
            //$(this).children(".dx_box").hide(); 
        });
        $(".yd_box").append(movie_box);

    });
			
			
			/*	$(".btwen_text").val("题目");
				$(".btwen_text_dx").val("单选题目");
				$(".btwen_text_duox").val("多选题目");
				$(".btwen_text_tk").val("填空题目");

				$(".leftbtwen_text").val("例子：CCTV1，CCTV2，CCTV3");
				$(".xxk_title li").click(function() {
					var xxkjs = $(this).index();
					$(this).addClass("on").siblings().removeClass("on");
					$(".xxk_conn").children(".xxk_xzqh_box").eq(xxkjs).show().siblings().hide();
				});*/

				//鼠标移上去显示按钮
				$(".movie_box").hover(function() {
					hovdijidiv = $(".movie_box").index(this);
					var html_cz = "<div class='kzqy_czbut'><a href='javascript:void(0)' class='sy'>上移</a><a href='javascript:void(0)'  class='xy'>下移</a><a href='javascript:void(0)'  class='bianji'>编辑</a><a href='javascript:void(0)' class='del' >删除</a></div>"
						$(this).css({
							"border": "1px solid #0099ff"
						});
						$(this).children(".wjdc_list").after(html_cz);
					}, function() {
						$(this).css({
							"border": "1px solid #fff"
						});
						$(this).children(".kzqy_czbut").remove();
						//$(this).children(".dx_box").hide(); 
					});

				//下移
				$(document).on("click",".xy",function() {
					//文字的长度 
					var leng = $(".yd_box").children(".movie_box").length;
					var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index();

					if(dqgs < leng - 1) {
						var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
						var xyghtml = czxx.next().html();
						var syghtml = czxx.html();
						czxx.next().html(syghtml);
						czxx.html(xyghtml);
						//序号
						czxx.children(".wjdc_list").find(".nmb").text(dqgs + 1);
						czxx.next().children(".wjdc_list").find(".nmb").text(dqgs + 2);
					} else {
						alert("到底了");
					}
				});
				//上移

				$(document).on("click",".sy",function(){
					//文字的长度 
					var leng = $(".yd_box").children(".movie_box").length;
					var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index();
					if(dqgs > 0) {
						var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
						var xyghtml = czxx.prev().html();
						var syghtml = czxx.html();
						czxx.prev().html(syghtml);
						czxx.html(xyghtml);
						//序号
						czxx.children(".wjdc_list").find(".nmb").text(dqgs + 1);
						czxx.prev().children(".wjdc_list").find(".nmb").text(dqgs);

					} else {
						alert("到头了");
					}
				});
				//删除

				$(document).on("click",".del",function() {
					alert(hovdijidiv);
					var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
					czxx.remove();
					var zgtitle_gs = $(".yd_box").find(".movie_box").length;
	
					var xh_num = 0;
					//重新编号
					for(var xuhao= 1; xuhao<=zgtitle_gs;xuhao++){
						$(".yd_box").children(".movie_box").eq(xh_num).find(".nmb").text(xuhao);
						xh_num++;
					}
					$.ajax({
						url : "/system/wenjuansq/shanchu",
						type : "POST",
						data:{'hovdijidiv':hovdijidiv},//此处不是JSON数据，在Controller中不能使用@RequestBody进行转换
						success : function(data) {
							alert(data.msg);}
					});  
				
						//alert(xh_num);
				});

				//编辑
				$(document).on("click",".bianji",function() {
					//编辑的时候禁止其他操作   
					$(this).siblings().hide();
					//$(this).parent(".kzqy_czbut").parent(".movie_box").unbind("hover"); 
					var dxtm = $(".dxuan").html();
					var duoxtm = $(".duoxuan").html();
					var tktm = $(".tktm").html();
					//接受编辑内容的容器
					var dx_rq = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".dx_box");
					var title = dx_rq.attr("data-t");
					//alert(title);
					//题目选项的个数
					var timlrxm = $(this).parent(".kzqy_czbut").parent(".movie_box").children(".wjdc_list").children("li").length;

					//单选题目
					if(title == 0) {
						dx_rq.show().html(dxtm);
						//模具题目选项的个数
						var bjxm_length = dx_rq.find(".title_itram").children(".kzjxx_iteam").length;
						var dxtxx_html = dx_rq.find(".title_itram").children(".kzjxx_iteam").html();
						//添加选项题目
						for(var i_tmxx = bjxm_length; i_tmxx < timlrxm - 1; i_tmxx++) {
							dx_rq.find(".title_itram").append("<div class='kzjxx_iteam'>" + dxtxx_html + "</div>");
						}
						//赋值文本框 
						//题目标题
						var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
						dx_rq.find(".btwen_text").val(texte_bt_val);
						//遍历题目项目的文字
						var bjjs = 0;
						$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").each(function() {
							//可选框框
							var ktksfcz = $(this).find("input").hasClass("wenb_input");
							if(ktksfcz) {
								var jsxz_kk = $(this).index();
								dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(jsxz_kk - 1).find("label").remove();
							}
							//题目选项
							var texte_val = $(this).find("span").text();
							dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(bjjs - 1).find(".input_wenbk").val(texte_val);
							bjjs++

						});
					}
					//多选题目  
					if(title == 1) {
						dx_rq.show().html(duoxtm);
						//模具题目选项的个数
						var bjxm_length = dx_rq.find(".title_itram").children(".kzjxx_iteam").length;
						var dxtxx_html = dx_rq.find(".title_itram").children(".kzjxx_iteam").html();
						//添加选项题目
						for(var i_tmxx = bjxm_length; i_tmxx < timlrxm - 1; i_tmxx++) {
							dx_rq.find(".title_itram").append("<div class='kzjxx_iteam'>" + dxtxx_html + "</div>");
							//alert(i_tmxx);
						}
						//赋值文本框 
						//题目标题
						var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
						dx_rq.find(".btwen_text").val(texte_bt_val);
						//遍历题目项目的文字
						var bjjs = 0;
						$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").each(function() {
							//可选框框
							var ktksfcz = $(this).find("input").hasClass("wenb_input");
							if(ktksfcz) {
								var jsxz_kk = $(this).index();
								dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(jsxz_kk - 1).find("label").remove();
							}
							//题目选项
							var texte_val = $(this).find("span").text();
							dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(bjjs - 1).find(".input_wenbk").val(texte_val);
							bjjs++

						});
					}
					//填空题目
					if(title == 2) {
						dx_rq.show().html(tktm);
						//赋值文本框 
						//题目标题
						var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
						dx_rq.find(".btwen_text").val(texte_bt_val);
					}
					//矩阵题目
				});

				
				//增加选项 
				 $(document).on("click",".zjxx",function() {
					var zjxx_html = $(this).prev(".title_itram").children(".kzjxx_iteam").html();
					$(this).prev(".title_itram").append("<div class='kzjxx_iteam'>" + zjxx_html + "</div>");
				});

				//删除一行  
				 $(document).on("click",".del_xm",function() {
					//获取编辑题目的个数
					var zuxxs_num = $(this).parent(".kzjxx_iteam").parent(".title_itram").children(".kzjxx_iteam").length;
					if(zuxxs_num > 1) {
						$(this).parent(".kzjxx_iteam").remove();
					} else {
						alert("手下留情");
					}
				});
				//取消编辑
				 $(document).on("click",".dx_box .qxbj_but",function() {
					$(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();
					$(".movie_box").css({
						"border": "1px solid #fff"
					});
					$(".kzqy_czbut").remove();
					//            
				});
				// body...
				//完成编辑（编辑）
				 $(document).on("click",".swcbj_but",function(){
						var jcxxxx = $(this).parent(".bjqxwc_box").parent(".dx_box"); //编辑题目区
						var querstionType = jcxxxx.attr("data-t"); //获取题目类型
						var kxtk_yf = $("input[name='bitian']:checked").val();
						var bit=0;

						switch(querstionType) {
							case "0": //单选
							case "1": //多选	
								//编辑题目选项的个数
								var bjtm_xm_length = jcxxxx.find(".title_itram").children(".kzjxx_iteam").length; //编辑选项的 选项个数
								var xmtit_length = jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").length - 1; //题目选择的个数

								//赋值文本框 
								//题目标题
								var texte_bt_val_bj = jcxxxx.find(".btwen_text").val(); //获取问题题目
								jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text(texte_bt_val_bj); //将修改过的问题题目展示
								
								if(kxtk_yf=="s"&&querstionType==0){
									jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find("span").text("【单选】【必填】");
									bit=1;
								}
									
								if(kxtk_yf=="s"&&querstionType==1){
										jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find("span").text("【多选】【必填】");
										bit=1;
									}
								if(kxtk_yf=="f"&&querstionType==0){
									jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find("span").text("【单选】【选填】");
								}
								
								if(kxtk_yf=="f"&&querstionType==1){
									jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find("span").text("【多选】【选填】");
								}
								$.ajax({
									url : "/system/wenjuansq/question",
									type : "POST",
									data:{'djigdiv':djigdiv,'querstionname':texte_bt_val_bj,'bit':bit,'querstionType':querstionType},//此处不是JSON数据，在Controller中不能使用@RequestBody进行转换
								});

								//删除选项
								for(var toljs = xmtit_length; toljs > 0; toljs--) {
									jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(toljs).remove();
								}
								//遍历题目项目的文字
								var bjjs_bj = 0;
								var xuanxiang=new Array();
								jcxxxx.children(".title_itram").children(".kzjxx_iteam").each(function() {
									//题目选项
									var texte_val_bj = $(this).find(".input_wenbk").val();//获取填写信息
									xuanxiang[bjjs_bj]=texte_val_bj;
									var inputType = 'radio';
									//jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(bjjs_bj + 1).find("span").text(texte_val_bj);
									if(querstionType == "1") {
										inputType = 'checkbox';
									}
									var li = '<li><label><input name="a" type="' + inputType + '" value=""><span>' + texte_val_bj + '</span></label></li>';
									jcxxxx.parent(".movie_box").children(".wjdc_list").append(li);

									bjjs_bj++
								});
								$.ajax({
									url : "/system/wenjuansq/option",
									type : "POST",
									data:{'djigdiv':djigdiv,'xuanxiang':xuanxiang},//此处不是JSON数据，在Controller中不能使用@RequestBody进行转换
								});  

								break;
							case "2":
								var texte_bt_val_bj = jcxxxx.find(".btwen_text").val(); //获取问题题目
								jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text(texte_bt_val_bj); //将修改过的问题题目展示
								if(kxtk_yf=="s"){
									jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find("span").text("【问答】【必填】");
									bit=1;
								}
							if(kxtk_yf=="f"){
								jcxxxx.parent(".movie_box").children(".wjdc_list").children("li").eq(0).find("span").text("【问答】【选填】");
							}
							$.ajax({
								url : "/system/wenjuansq/question",
								type : "POST",
								data:{'djigdiv':djigdiv,'querstionname':texte_bt_val_bj,'bit':bit,'querstionType':querstionType},//此处不是JSON数据，在Controller中不能使用@RequestBody进行转换
							});
								break;
						}
						//清除     
						$(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();
					});
				 $(document).on("click",".tijiaobtn",function(){
					 $.ajax({
							url : "/system/wenjuansq/tijiao",
							type : "POST",
							success : function(data) {
								alert(data.msg);
								if(data.pd){
								$(".tijiaobtn").attr("disabled",true);
								}
								
							}
						});  
				 });
});

