
Ext.onReady(function(){

	Ext.define('User', {
    extend: 'Ext.data.Model',
    fields: [ 'name', 'email', 'phone' ,'dob']
	
	});

var userStore = Ext.create('Ext.data.Store', {
    
    model: 'User',
    autoLoad: true,
    pageSize:8 ,
    proxy: {
        
		type: 'ajax',
        url : 'data/users.json',
        reader: {
            type: 'json',
            root: 'users',
            totalProperty: 'total'
			}
		},
		
		data:[
			{
				success: true,
				// total: 12,
				users: [
					
						]
			}
		]
    
});

Ext.create('Ext.grid.Panel', {
   
	renderTo: Ext.getBody(),
	
		// selType: 'cellmodel', //cell selecting
	
	selType:'rowmodel',	//RowEditing
	
	
		// plugins: [
			// Ext.create('Ext.grid.plugin.CellEditing', {
				// clicksToEdit: 1
			// })
		// ],
		
	
	plugins: [
				Ext.create('Ext.grid.plugin.RowEditing', {
					clicksToEdit: 1
			})
		],
		
		
    store: userStore,
    width: 600,
    height: 200,
    title: 'Application Users',
    columns: [
        {
            text: 'Name',
            width: 100,
            sortable: false,
            hideable: false,
            dataIndex: 'name',
			
		},
		
        {
            text: 'Email Address',
            width: 150,
            dataIndex: 'email',
            
			
        },
		
        {
            text: 'Phone Number',
            flex: 1,
            dataIndex: 'phone'
        },
		
		 {
            text: 'Date of Birth',
            width:150,
            dataIndex: 'dob'
        }
    ],
	
	dockedItems: [
			{
	
			xtype: 'pagingtoolbar',
			store: userStore,  
			dock: 'bottom',
			displayInfo: true
			
			}
		
		]
		
	});

});