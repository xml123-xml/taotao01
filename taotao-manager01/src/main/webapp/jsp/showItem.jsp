<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品展示页面</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<style>
body {
	margin: 10px;
}

.demo-carousel {
	height: 200px;
	line-height: 200px;
	text-align: center;
}
</style>
</head>
<body>
	<!--<table class="layui-hide" id="demo" lay-filter="test"></table>
	<div id="toolbarDemo" class="layui-btn-container">
		<button class="layui-btn layui-btn-sm" data-type="CommodityUpdate">上架商品</button>
		<button class="layui-btn layui-btn-sm" data-type="CommodityDelete">下架商品</button>
	</div>	
	<blockquote class="layui-elem-quote layui-quote-nm layui-hide"
		id="footer">こんにちは</blockquote>
	<script>
		layui.config({
			version : '1575889601624' //为了更新 js 缓存，可忽略
		});
		layui
				.use(
						[ 'laypage', 'layer', 'table', 'upload', 'element',
								'slider' ],
						function() {
							var laypage = layui.laypage //分页
							, layer = layui.layer //弹层
							, table = layui.table //表格
							, upload = layui.upload //上传
							, element = layui.element //元素操作
							, slider = layui.slider //滑块

							//向世界问个好
							layer.msg('こんにちは');

							//监听Tab切换
							element.on('tab(demo)', function(data) {
								layer.tips('切换了 ' + data.index + '：'
										+ this.innerHTML, this, {
									tips : 1
								});
							});

							//执行一个 table 实例
							table
									.render({
										elem : '#demo',
										height : 420,
										url : '/item/tbitem' //数据接口
										,
										title : '数据表',
										page : true //开启分页
										,
										toolbar : 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
										,
										totalRow : true //开启合计行
										,
										cols : [ [ //表头
												{
													type : 'checkbox',
													fixed : 'left'
												},
												{
													field : 'id',
													title : 'ID',
													width : 80,
													sort : true,
													fixed : 'left',
													totalRowText : '合计：'
												},
												{
													field : 'title',
													title : '型号',
													width : 80
												},
												{
													field : 'sellPoint',
													title : '描述',
													width : 90,
													totalRow : true
												},
												{
													field : 'price',
													title : '价格',
													width : 80
												},
												{
													field : 'num',
													title : '数量',
													width : 80,
													totalRow : true
												},
												{
													field : 'barcode',
													title : 'barcode',
													width : 80
												},
												{
													field : 'image',
													title : '图片路径',
													width : 200
												},
												{
													field : 'cId',
													title : 'cId',
													width : 100
												},
												{
													field : 'status',
													title : '状态',
													width : 100,
													templet: '#titleTpl'
												},
												{
													field : 'created',
													title : '出现时间',
													width : 190,
													totalRow : true,
													templet : "<div>{{layui.util.toDateString(d.created,'yyyy-MM-dd HH:mm:ss')}}</div>"
												},
												{
													field : 'updated',
													title : '修改时间',
													width : 190,
													templet : "<div>{{layui.util.toDateString(d.created,'yyyy-MM-dd HH:mm:ss')}}</div>"
												} ] ] 
												
									});

							//监听头工具栏事件
							table
									.on(
											'toolbar(test)',
											function(obj) {
												var checkStatus = table
														.checkStatus(obj.config.id), data = checkStatus.data; //获取选中的数据
												switch (obj.event) {
												case 'add':
													layer.msg('添加');
													break;
												case 'update':
													if (data.length === 0) {
														layer.msg('请选择一行');
													} else if (data.length > 1) {
														layer.msg('只能同时编辑一个');
													} else {
														layer
																.alert('编辑 [id]：'
																		+ checkStatus.data[0].id);
													}
													break;
												case 'delete':
													var data = checkStatus.data;
													var items = JSON
															.stringify(data);
													$
															.ajax({
																type : "post",
																url : "/item/delete",
																data : {
																	"items" : items
																},
																success : function(
																		msg) {
																	layer
																			.open({
																				title : '信息',
																				content : msg
																			});
																	$(
																			"#content")
																			.load(
																					"/jsp/showItem.jsp");
																}
															});
													break;
												case 'CommodityUpdate':

													var data = checkStatus.data;

													$
															.ajax({

																type : "POST",

																url : "/item/CommodityUpdate",

																contentType : "application/json;charset=utf-8",

																data : JSON
																		.stringify(data),

																dataType : "json",

																success : function(
																		message) {

																	if (message.status == 200) {

																		layer
																				.alert(message.msg);

																		table
																				.reload(
																						'tbitem',
																						{});

																	} else {

																		layer
																				.alert(message.msg);

																	}

																}

															});

													break;

												case 'CommodityDelete':

													var data = checkStatus.data;

													$
															.ajax({

																type : "POST",

																url : "/item/CommodityDelete",

																contentType : "application/json;charset=utf-8",

																data : JSON
																		.stringify(data),

																dataType : "json",

																success : function(
																		message) {

																	if (message.status == 200) {

																		layer
																				.alert(message.msg);

																		table
																				.reload(
																						'tbitem',
																						{});

																	} else {

																		layer
																				.alert(message.msg);

																	}

																}

															});

													break;

												}
												;
											});

							//分页
							laypage.render({
								elem : 'pageDemo' //分页容器的id
								,
								count : 100 //总页数
								,
								skin : '#1E9FFF' //自定义选中色值
								//,skip: true //开启跳页
								,
								jump : function(obj, first) {
									if (!first) {
										layer.msg('第' + obj.curr + '页', {
											offset : 'b'
										});
									}
								}
							});

							//上传
							upload.render({
								elem : '#uploadDemo',
								url : '' //上传接口
								,
								done : function(res) {
									console.log(res)
								}
							});

							//滑块
							var sliderInst = slider.render({
								elem : '#sliderDemo',
								input : true
							//输入框
							});

							var footerTpl = lay('#footer')[0].innerHTML;
							lay('#footer').html(
									layui.laytpl(footerTpl).render({}))
									.removeClass('layui-hide');
						});
	</script>
		<script type="text/html" id="titleTpl">
    {{#  if(d.status ==0){ }}
        	下架 
    {{#  }  else if(d.status==1){ }}
       	上架
 	{{#  }  else if(d.status==2){ }}
      	删除
    {{#  } }}
	</script> -->
	
	 <form action="" method="post">
		<div class="layui-form-item" style="margin-right: 800px">
			<label class="layui-form-label" style="color: green">搜索</label>
			<div class="layui-input-block">
				<input name="username" class="layui-input" type="text"
					placeholder="请输入你要搜索的商品" autocomplete="off" lay-verify="title">
			</div>
		</div>
	</form>
	
	

	<table class="layui-hide" id="showItemPage" lay-filter="itemToolBar"></table>



	<div id="toolbarDemo" style="display: none;"  class="layui-btn-container">

		<button class="layui-btn layui-btn-sm" lay-event="delete">选中删除</button>

		<button class="layui-btn layui-btn-sm" lay-event="addItem">新增商品</button>

		<button class="layui-btn layui-btn-sm" lay-event="updateItem">修改商品</button>

		<button class="layui-btn layui-btn-sm" lay-event="commodityUpdate">商品上架</button>

		<button class="layui-btn layui-btn-sm" lay-event="commodityDelete">商品下架</button>

	</div>

	<div style="display: none;" id="barDemo">

		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> 

		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>

	</div>

	

	<script>

		var table;

		layui.use('table', function() {

			table = layui.table;

			table.render({

				elem : '#showItemPage',//绑定哪个table表 可以以id选择器绑定 可以以class选择器 还可以以 name选择器

				url : '/item/tbitem',//请求服务器的url路径

				toolbar : '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板

				,

				defaultToolbar : [ 'filter', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可

					layEvent : 'LAYTABLE_TIPS',

					icon : 'layui-icon-tips'

				} ],

				title : '商品表',

				cols : [ 

				         [ 

				{

					type : 'checkbox',

					fixed : 'left'

				}, {

					field : 'id',

					title : 'ID',

					width : 80,

					fixed : 'left'

				}, {

					field : 'title',

					title : '商品名称',

					width : 100

				}, {

					field : 'sellPoint',

					title : '商品卖点',

					width : 100

				}, {

					field : 'price',

					title : '商品价格',

					width : 100

				}, {

					field : 'num',

					title : '商品数量',

					width : 100

				}, {

					field : 'cId',

					title : '商品类目',

					width : 100

				}, {

					field : 'status',

					title : '商品状态',

					width : 100,

					templet: '#titleTpl',

					sort : true

				},{

					field : 'created',

					title : '创建时间',

					templet:'<div>{{ layui.util.toDateString(d.created, "yyyy-MM-dd HH:mm:ss") }}</div>',

					width : 200

				},{

					field : 'updated',

					title : '更新时间',

					templet:'<div>{{ layui.util.toDateString(d.updated, "yyyy-MM-dd HH:mm:ss") }}</div>',

					width : 200

				},

				{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}

					]

				],

				page : true

			});



			 //头工具栏事件

			table.on('toolbar(itemToolBar)', function(obj){

			   var checkStatus = table.checkStatus(obj.config.id);

			    switch(obj.event){

			      case 'delete':

			        var data = checkStatus.data;

			             $.ajax({

				            type: "POST",

				            url: "/item/delete",

				            contentType: "application/json;charset=utf-8",

				            data:JSON.stringify(data),

				            dataType: "json",

				            success:function (message) {

				               if(message.status==200){

				            	   layer.alert('删除商品成功');

				            	   table.reload('showItemPage',{  });

				               }else{

				            	   layer.alert(message.msg);

				               }

				            }

				        });

			      break;

			      case 'commodityUpdate':

				        var data = checkStatus.data;

				             $.ajax({

					            type: "POST",

					            url: "/item/commodityUpdate",

					            contentType: "application/json;charset=utf-8",

					            data:JSON.stringify(data),

					            dataType: "json",

					            success:function (message) {

					               if(message.status==200){

					            	   layer.alert(message.msg);

					            	   table.reload('showItemPage',{  });

					               }else{

					            	   layer.alert(message.msg);

					               }

					            }

					        });

				      break;

			      case 'commodityDelete':

				        var data = checkStatus.data;

				             $.ajax({

					            type: "POST",

					            url: "/item/commodityDelete",

					            contentType: "application/json;charset=utf-8",

					            data:JSON.stringify(data),

					            dataType: "json",

					            success:function (message) {

					               if(message.status==200){

					            	   layer.alert(message.msg);

					            	   table.reload('showItemPage',{  });

					               }else{

					            	   layer.alert(message.msg);

					               }

					            }

					        });

				      break;

			    

			    };

			  });



			

		});

		

		

		

	</script>

	<script type="text/html" id="titleTpl">

    {{#  if(d.status ==0){ }}

        	下架 

    {{#  }  else if(d.status==1){ }}

       	上架

 	{{#  }  else if(d.status==2){ }}

       	删除

    {{#  } }}

	</script>
</body>
</html>
