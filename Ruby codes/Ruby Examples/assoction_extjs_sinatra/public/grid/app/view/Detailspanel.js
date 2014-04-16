Ext.define('Demo.view.Detailspanel',{
	extend:'Ext.panel.Panel'
	,alias:'widget.detailspanel'
	,header: false
	,title:'Details'
	,requires:['Demo.view.Details','Demo.view.Masters']
	,layout: {
		 type:'hbox'
		,align: 'stretch'

	}
	,items:[{
		 xtype: 'masters'
		,flex:1	
		,title:'Masters'
		},{
		 xtype:'details'
		,flex:1	
		,title:'Details'
	}]
});