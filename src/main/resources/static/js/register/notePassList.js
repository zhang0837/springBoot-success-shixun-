define(function() {
	return function() {
		var dg = $("#notePassList_dg");
		var searchFrom = $("#note_search_from");
		var form;

		// 使用edatagrid，需要而外导入edatagrid扩展
		dg.datagrid({
			url : '/register/notePassList/getPassNote',
			emptyMsg : "没有发布的问卷",
			idField : "note_id",
			fit : true,
			rownumbers : true,
			fitColumns : true,
			border : false,
			pagination : true,
			singleSelect : true,
			ignore : [ 'roles' ],
			pageSize : 30,
			columns : [ [ {
				field : 'note_id',
				title : '问卷ID',
				width : 30
			}, {
				field : 'title',
				title : '问卷标题',
				width : 30
			}, {
				field : 'shuoming',
				title : '问卷说明',
				width : 30
			}, {
				field : 'start_time',
				title : '开始时间',
				width : 50
			}, {
				field : 'end_time',
				title : '结束时间',
				width : 50
			},{
				field : 'creator',
				title : '创建人',
				width : 30
			},{
				field : 'test',
				itle : '操作',
				width : 50,
				align : 'center',
				formatter: function (value, row, index) {
			            return authToolBar({
			              "member-edit": '<a data-note_id="' + row.note_id + '" class="ctr ctr-examine">去填写</a>'
			            }).join("");
			         }
			} ] ],
		});
		/**
		 * 操作按钮绑定事件
		 */
		dg.datagrid("getPanel").on('click', "a.ctr-examine", function() {// 去填写
			createForm.call(this, this.dataset.note_id)
		});

		/**
		 * 搜索区域事件
		 */

		searchFrom.on('click', 'a.searcher', function() {// 检索
			dg.datagrid('load', searchFrom.formToJson());
		}).on('click', 'a.reset', function() {// 重置
			searchFrom.form('reset');
			dg.datagrid('load', {});
		});

		/**
		 * 创建表单窗口
		 * 
		 * @returns
		 */
		function createForm(note_id) {
			var dialog = $("<div/>")
					.dialog(
							{	
								title : "问卷填写",
								iconCls : 'fa fa-eye',
								resizable : true,
								maximizable : true,
								height : 420,
								width : 420,
								collapsible : true,
								// 一个 URL，用它加载远程数据并且显示在面板（panel）里。
								href : '/register/notePassList/quetion',
								queryParams : {
									id : note_id
								},
								modal : true,
								onClose : function() {
									$(this).dialog("destroy");
								},
								onLoad : function() {
									// 窗口表单加载成功时执行
									form = $("#passQuetion-form");
								},
								buttons : [
										{
											iconCls : 'fa fa-times',
											text : '取消',
											handler : function() {
												dg.datagrid('reload');
												dialog.dialog('close');
														
											}
										},
										{
											iconCls : 'fa fa-check',
											text : '提交',
											handler : function() {
												var formData = {};
												formData.id = note_id;
												if (form.form('validate')) {
													$.post(
																	"/register/notePassList/",
																	formData,
																	function(
																			res) {
																		dg
																				.datagrid('reload');
																		dialog
																				.dialog('close');
																		alert("提交成功");
																	})
												}
											}
										} ],
							});
		}
	}
});
