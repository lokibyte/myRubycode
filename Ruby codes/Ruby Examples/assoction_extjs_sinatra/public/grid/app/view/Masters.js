Ext.define('Demo.view.Masters',{
	extend:'Ext.grid.Panel'
	,alias: ['widget.masters']
	,store:'Masters'
	,columns: [
		 {text:'id',dataIndex: 'id',flex:1	}
		,{text:'name',dataIndex: 'name',flex:1	 }
    ]
	
	
	
});