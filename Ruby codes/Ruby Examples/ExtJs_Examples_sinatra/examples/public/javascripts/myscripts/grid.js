Ext.onReady(function(){
	
	var form = Ext.create('Ext.form.Panel', {
		 title	: 'Add a Word'
		,url	: '/add'
		,method	: 'post'
		,items	: [
			{
				 xtype		: 'textfield'
				,allowBlank	: false
				,blankText : 'This field is required'
				,msgTarget	: 'side'  // side alert if textfield is empty
				,fieldLabel	: 'Word'
				,name		: 'word'
				
			}
			
			,{
				 xtype		: 'textfield'
				,allowBlank :	false
				,msgTarget	: 'side' // side alert if textfield is empty
				,fieldLabel	: 'Meaning'
				,name		: 'meaning'
				
			}
			
			,{
				 xtype		: 'displayfield'
				,id			: 'message'
				,width		: '100%'
			}
		]
		
		,buttons	: [
			{
				 text	: 'Ok'
				,formBind: true   //disable button if form textfields are empty
				,handler: function(){
					
					form.submit({
		
						success: function(f, a){
							Ext.getCmp('message').setValue(a.result.message);
						}
						
						,failure: function(f, a){
							Ext.getCmp('message').setValue(a.result.message);
						}
					});
				}
			},
			

		]
	}); 		//end of form
	
	
	
	
var forms = Ext.create('Ext.form.Panel', {
		 title	: 'Search a Word'
		,url	: '/searching'
		,method	: 'post'
		,items	: [
			{
				 xtype		: 'textfield'
				,allowBlank	: false
				,blankText : 'This field is required'
				,msgTarget	: 'side'  // side alert if textfield is empty
				,fieldLabel	: 'search word'
				,name		: 'search'
				
			}
			
			,{
				 xtype		: 'displayfield'
				,id			: 'messages'
				,width		: '100%'
			}
		]
		,buttons	: [
			{
				 text	: 'Search'
				,formBind: true   //disable button if form textfields are empty
				,handler: function(){
					
					forms.submit({
		
						success: function(frm, act){
							Ext.getCmp('messages').setValue(act.result.message);
						
						}
						
						,failure: function(frm, act){
							Ext.getCmp('messages').setValue(act.result.message);
						
						}
					});
				}
			},
		]
	});			//end of forms
	
	
	// var wordstore = Ext.create('Ext.data.Store', {
	
	
	// });
	
	var grid = Ext.create('Ext.grid.Panel', {
		
		title	: 'Dictionary'
		
		// ,store	: wordstore
		// ,store	: {
			// fields	: [ 'word', 'meaning' ]
		// }
		
		,tbar	: [
			{
				 text		: 'Add Word'
				,handler	: function(){
						
	Ext.create('Ext.window.Window', {
	
		 title		: 'Welcome'
		,modal		: true 	//'modal:true' this configuration is used to edit or changes in  the background page without effecting javascript form
		,height		: 200
		,width		: 300
		,closable	: true
		,items		: [ form ]
		
		
	}).show();
	
				} 		//end of handler
			}
			// ,'-'
			,{
				xtype	: 'tbseparator'
			}
			,
			{
				 text		: 'search word'
				,handler	: function(){
						
	Ext.create('Ext.window.Window', {
	
		 title		: 'search window'
		,modal		: true 	//'modal:true' this configuration is used to edit or changes in  the background page without effecting javascript form
		,height		: 200
		,width		: 300
		,closable	: true
		,items		: [ forms ]
		
		
	}).show();
	
				} 		//end of handler
			}
		]
		
		,columns	: [
			// {
				 // dataIndex	: 'word'
				// ,header		: 'Word'
			// }
			// ,{
				 // dataIndex	: 'meaning'
				// ,header		: 'Meaning'
			// }
		
		]
		
		,renderTo: Ext.getBody()
	});
});