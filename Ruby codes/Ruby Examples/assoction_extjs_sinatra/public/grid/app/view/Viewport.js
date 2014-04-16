Ext.define('Demo.view.Viewport',{
	extend:'Ext.Viewport',
	title:'my book blog',
	layout:'fit',
	requires:[
				'Demo.view.Detailspanel'
	],
	items:[
		{
			xtype:'detailspanel'
		}
	]

})