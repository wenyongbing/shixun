<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="/easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="/easyui/themes/icon.css"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单列表</title>
<script>
	function doquery()
	{
		var val = $('#name').textbox('getValue');
		$('#dg').datagrid({
			url:'/findorder?name='+val
		});
		
	}
	function showbtn(cellVal,rowObj,rowNo)
	{
		return '<input type="button" value="修改" onclick="domodify('+rowNo+')"/>';
	}
	function domodify(rowNo)
	{
		var rowsObj = $('#dg').datagrid('getRows');
		var rowObj = rowsObj[rowNo];
		$('#win').window('open');
		$('#id').val(rowObj.id);
		$('#prdtName').textbox('setValue',rowObj.prdtName);
		$('#price').textbox('setValue',rowObj.price);
		$('#num').textbox('setValue',rowObj.num);
		$('#dt').datebox('setValue',rowObj.dt);
		$('#desc').textbox('setValue',rowObj.desc);
		$('#no').textbox('setValue',rowObj.no);
		loadprop(rowObj.pid);
	}
	function loadprop(pid)
	{
		$.ajax({
			url:'/findprop',
			success:function(data)
			{
				$('#propDiv').empty();
				for(var i=0;i<data.length;i++)
				{
					if(pid != null && pid.indexOf(data[i].id)>=0)
						$('#propDiv').append("<input name='pid' type='checkbox' value="+data[i].id+" checked>"+data[i].name);
					else
						$('#propDiv').append("<input name='pid' type='checkbox' value="+data[i].id+">"+data[i].name);
				}
			}
			
		})
	}
	function dosave()
	{
		var frmdata = $('#frm').serialize();
		$.ajax({
			url:'/save',
			data:frmdata,
			success:function(rtn)
			{
				$('#dg').datagrid('reload');
				$('#win').window('close');
			}
		})
	}
	function doadd()
	{
		$('#win').window('open');
	}
	function dodelete()
	{
		var rowsObj = $('#dg').datagrid('getChecked');
		var ids = '';
		for(var i=0;i<rowsObj.length;i++)
		{
			ids = ids + rowsObj[i].id + ',';
		}
		$.ajax({
			url:'/delete?ids='+ids,
			success:function(rtn)
			{
				$('#dg').datagrid('reload');
			}
		})
	}
	$(document).ready(function(){
		$('#win').window('close');
		loadprop('');
	})
</script>
</head>
<body class="easyui-layout">
<input class="easyui-textbox" id="name" data-options="label:'输入商品名'" style="width:300px">
<a id="btn" onclick="doquery()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
<a id="btn" onclick="doadd()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
<table id="dg" class="easyui-datagrid" 
	data-options="url:'/findorder',fitColumns:true,pagination:true,pageList:[2,4,8],pageSize:4">   
    <thead>   
        <tr>
        	<th data-options="field:'id',width:100,checkbox:true">全选</th>   
            <th data-options="field:'no',width:100">订单编码</th>   
            <th data-options="field:'prdtName',width:100">商品名称</th>   
            <th data-options="field:'price',width:100">商品价格</th>
            <th data-options="field:'num',width:100">订单金额</th>
            <th data-options="field:'dt',width:100,sortable:true">时间</th>
            <th data-options="field:'pname',width:100">属性</th>
            <th data-options="field:'pid',width:100,hidden:true">属性ID</th>
            <th data-options="field:'desc',width:100">描述</th>
            <th data-options="field:'cmd',width:100,formatter:showbtn">操作</th>
        </tr>   
    </thead>   
 
</table>     
<a id="btn" onclick="dodelete()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">批量删除</a>

<div id="win" class="easyui-window" title="订单详情" style="width:600px;height:500px"   
        data-options="iconCls:'icon-save',modal:true">   
<form id="frm" method="post">
	<input type="hidden" id="id" name="id"/>
    <div style="margin-left:50px;margin-top:30px">   
        <label for="name">商品名称:</label>   
        <input class="easyui-textbox" type="text" id="prdtName" name="prdtName" data-options="required:true" />   
    </div>   
    <div style="margin-left:50px;margin-top:30px">   
        <label for="name">商品价格:</label>   
        <input class="easyui-textbox" type="text" id="price" name="price" data-options="required:true" />   
    </div>   
    <div style="margin-left:50px;margin-top:30px">   
        <label for="name">商品数量:</label>   
        <input class="easyui-textbox" type="text" id="num" name="num" data-options="required:true" />   
    </div>
    <div style="margin-left:50px;margin-top:30px">   
        <label for="name">下单日期:</label>   
        <input class="easyui-datebox" type="text" id="dt" name="dt" data-options="required:true" />   
    </div>  
    <div style="margin-left:50px;margin-top:30px">   
        <label for="name">订单描述:</label>   
        <input class="easyui-textbox" type="text" id="desc" name="desc" data-options="required:true" />   
    </div>
    <div style="margin-left:50px;margin-top:30px">   
        <label for="name">订单编号:</label>   
        <input class="easyui-textbox" type="text" id="no" name="no" data-options="required:true" />   
    </div>
    <div style="margin-left:50px;margin-top:30px">   
        <label for="name">属性选择:</label>   
        <div id="propDiv">
        </div>           
    </div>
    <div style="margin-left:50px;margin-top:30px">   
		<a id="btn" onclick="dosave()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
		<a id="btn" onclick="doclose()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">关闭</a>        
    </div>
</form>   
</div> 
    </div> 
</body>
</html>