Ext.onReady(function(){

	Ext.create('Ext.data.Store', {
		storeId:'simpsonsStore',
		fields:['name', 'email', 'phone'],
		data:{'items':[

			{ 'name': 'Lisa',  email:"lisa@simpsons.com",  "phone":"555-111-1224"  },
			{ 'name': 'Bart',  email:"bart@simpsons.com",  "phone":"555-222-1234" },
			{ 'name': 'Homer', email:"home@simpsons.com",  "phone":"555-222-1244"  },
			{ 'name': 'Marge', email:"marge@simpsons.com", "phone":"555-222-1254"  }
		
		]},
		
		proxy: {
			type: 'memory',
			reader: {
				type: 'json',
				root: 'items'
			}
		}
});

	Ext.create('Ext.grid.Panel', {
		
		title: 'Simpsons',
		store: Ext.data.StoreManager.lookup('simpsonsStore'),
		columns: [
		
			// { text: 'Name',  dataIndex: 'name' },
			// { text: 'Email', dataIndex: 'email', flex: 1 },
			// { text: 'Phone', dataIndex: 'phone' }
			
			
			{
			text: 'Name',
			dataIndex: 'name',
			sortable: false,
			hideable: false,
			flex: 1
		},
		{
			text: 'Email',
			dataIndex: 'email',
			hidden: true
		},
		{
			text: 'Phone',
			dataIndex: 'phone',
			width: 100
		}
		],
		height: 200,
		width: 400,
		renderTo: Ext.getBody()
});
});