Ext.define('Demo.view.Details',{
	extend:'Ext.grid.Panel'
	,alias:'widget.details'
	,store:'Details'
	,columns: [
		 {text:'id',dataIndex: 'id',flex:1	}
        ,{ text: 'Mid',  dataIndex: 'master_id',flex:1 }
        ,{ text: 'DName',  dataIndex: 'dname',flex:1 }
		
    
	]
	
	
	
});