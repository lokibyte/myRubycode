Ext.onReady(function () {




	Ext.create('Ext.Button', 
	{
			renderTo: 'buttondiv',
			text : 'Add',
			iconAlign: "center",
			width :100,
			height :50,
		handler: function()
		{
		
	var	form = Ext.create('Ext.form.Panel', 
	{
			title: 'Items',
			renderTo: 'formdiv', // render to div of the page
			bodyPadding: 5,
			width: 350,
			url: '/AddWord',
	  
		items: [{
				
				xtype: 'textfield',
				fieldLabel: 'Item',
				name: 'item'
				},
				{	
				xtype: 'textfield',
				fieldLabel: 'Rate',
				name: 'rate'
				},
				{	
				xtype: 'textfield',
				fieldLabel: 'Quantity',
				name: 'qty'
				}
			],

		buttons: [ {
			text: 'Submit',
			handler: function() {
		
				var form = this.up('form').getForm();
				Ext.Ajax.request({
				url: '/AddWord',

				method: 'post',
				params :form.getValues(),
				
				success: function(resp) {
						var resp=Ext.decode(resp.responseText);
					   Ext.Msg.alert('Details saved Successfully',resp.message);
						},
					failure: function(form, action) {
						Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
						}
				
						});
					
			}
		}]
	});
		
	}
	
	});
	
	//List The Items 
	
	
	Ext.create('Ext.Button',{
			renderTo: Ext.getBody(),//'buttondiv',
			text : 'List', 	 
			iconAlign: "center",
			width :100,
			height :50,
		
		handler: function()
		
		{
		
		grid.show();
		
		}
		});
		 
		// model	
	Ext.define('FruitsModel', {
  extend: 'Ext.data.Model',
  fields: [
	  {
		name: 'item'
	  }, 
	  {
		name: 'rate'
	  },
	  {
		name: 'qty'
	}
  ]
});
		
		// store
		
	var User = new Ext.data.Store({
		model:'FruitsModel',
		autoLoad:true,
    proxy: {
        type: 'sessionstorage',
        id  : 'User',
		url:'/list'
    },
	reader: {
                type: 'json',
                root: 'data',
				successProperty: 'success'
            }
});
		
		
		// var User = Ext.create('Ext.data.Store', {
        // model: 'FruitsModel',
		// autoLoad:true,
        // proxy: {
            // type: 'ajax',
            // url: '/list',
			
            // reader: {
                // type: 'json',
                // root: 'data',
				// successProperty: 'success'
            // }
        // }
    // });
	
	
	//grid	
	
		var grid = Ext.create('Ext.grid.Panel', {
        width:425,
        height:250,
        title:'Fruits',
		store: User,
		formBind:true,
		params :form.getValues(),
        renderTo: 'griddiv',


        columns: [{
            text: 'Item',
            // flex: 50,
            dataIndex: 'item'
        },{
            text: 'Rate',
            // flex: 30,
            dataIndex: 'rate'
        },{
            text: 'Quantity',
            dataIndex: 'qty',
             // flex: 30,
           
        }]
    });
		
			
	
});
		
	
	
	
	
	


		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
    

							
							
							

	
