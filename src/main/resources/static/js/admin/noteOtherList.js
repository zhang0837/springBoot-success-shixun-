define(function() {
	return function() {
		var dg = $("#noteOtherList_dg");
		var searchFrom = $("#note_search_from");
		var form;

		// 使用edatagrid，需要而外导入edatagrid扩展
		dg.datagrid({
			url : '/admin/noteOtherList/getOtherNote',
			emptyMsg : "没有已审核问卷",
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
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				},
				formatter : function(val) {
					return filterXSS(val);
				}
			}, {
				field : 'title',
				title : '问卷标题',
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				},
				formatter : function(val) {
					return filterXSS(val);
				}
			}, {
				field : 'desc',
				title : '问卷说明',
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				},
				formatter : function(val) {
					return filterXSS(val);
				}
			}, {
				field : 'start_time',
				title : '开始时间',
				width : 50,
				editor : {
					type : 'datebox',
					options : {
						editable : false
					}
				}
			}, {
				field : 'end_time',
				title : '结束时间',
				width : 50,
				editor : {
					type : 'datebox',
					options : {
						editable : false
					}
				}
			}, {
				field : 'state',
				title : '状态',
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				},
				formatter : function(val) {
					return filterXSS(val);
				}
			}, {
				field : 'anon',
				title : '是否匿名',
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				},
				formatter : function(val) {
					return filterXSS(val);
				}
			}, {
				field : 'creator',
				title : '创建人',
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				},
				formatter : function(val) {
					return filterXSS(val);
				}
			}, {
				field : 'create_time',
				title : '创建时间',
				width : 50,
				editor : {
					type : 'datebox',
					options : {
						editable : false
					}
				}
			}, ] ],
		});
		
		searchFrom.on('click', 'a.searcher', function() {// 检索
			dg.datagrid('load', searchFrom.formToJson());
		}).on('click', 'a.reset', function() {// 重置
			searchFrom.form('reset');
			dg.datagrid('load', {});
		});
	}
});