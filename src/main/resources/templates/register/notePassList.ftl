<div class="easyui-layout" fit="true">
	<div data-options="region:'north',border:false"
		style="height: 80px; padding: 10px; overflow: hidden;" title="待审核问卷管理">
		<form id="note_search_from" class="searcher-form">
			<input name="title" class="easyui-textbox field" label="问卷标题："labelWidth="70">
			<input name="creator" class="easyui-textbox field" label="创建人：" labelWidth="60">
			<input name=start_time class="easyui-datebox field" label="开始时间：" labelWidth="70">
			<a class="easyui-linkbutton searcher" data-options="iconCls:'fa fa-search'">检索</a>
			<a class="easyui-linkbutton reset" data-options="iconCls:'fa fa-repeat'">重置</a>
		</form>
	</div>
	<div data-options="region:'center',border:false"
		style="border-top: 1px solid #D3D3D3">
		<table id="notePassList_dg"></table>
	</div>
</div>