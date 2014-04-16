
Ext.onReady(function(){

	
	// Ext.Msg.alert('Hello', 'Welcome');
	
	// add form 
	
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
			}
		]
	});
	
	
	
	var win = Ext.create('Ext.window.Window', {
	
		 title		: 'Welcome'
		,modal		: true 	//'modal:true' this configuration is used to edit or changes in  the background page without effecting javascript form
		,height		: 200
		,width		: 300
		,closable	: false
		,items		: [ form ]
		// ,buttons	: [
			// {
				 // text	: 'Ok'

				// ,handler: function(){
					
					// form.submit({
		
					// // waitMsg	:'Saving....' , //waiting message 
					// success: function(f, a){
						
							// Ext.Msg.alert('Done!!', a.result.message)
							
						// }
						
						// ,failure: function(f, a){
							// // debugger;
							// Ext.Msg.alert('Error', a.result.message)
						// }
					// });
				// }
			// }

		// ]
	});
	
	
	
	win.show();

});