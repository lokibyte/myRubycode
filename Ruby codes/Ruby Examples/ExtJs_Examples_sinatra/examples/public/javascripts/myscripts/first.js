Ext.onReady(function(){

	// Ext.Msg.alert('Hello', 'Welcome');
	
	// var word = Ext.create('Ext.form.field.Text', {
		// fieldLabel	: 'Word'
	// });
	
	// var meaning = Ext.create('Ext.form.field.Text', {
		// fieldLabel	: 'Meaning'
	// });
	
	var form = Ext.create('Ext.form.Panel', {
		 title	: 'Add a Word'
		// ,items	: [ word, meaning ]
		
		,url	: '/word'
		,method	: 'post'
		
		,items	: [
			{
				 xtype		: 'textfield'
				,fieldLabel	: 'Word'
				,name		: 'word'
			}
			,{
				 xtype		: 'textfield'
				,fieldLabel	: 'Meaning'
				,name		: 'meaning'
			}
		]
	});
	
	var win = Ext.create('Ext.window.Window', {
	
		 title		: 'Welcome'
		,modal		: false //'modal:true' this configuration is used to edit or changes in  the background page without effecting javascript form
		,height		: 200
		,width		: 300
		// ,closable	: false
		,items		: [ form ]
		,buttons	: [
			{
				 text	: 'Ok'
				,handler	: function(){
					
					form.submit({
						success: function(f, a){
							Ext.Msg.alert('Done!!', a.result.message)
						}
						,failure: function(f, a){
							// debugger;
							Ext.Msg.alert('Error', a.result.message)
						}
					});
				}
			}

		]
	});
	
	
	
	win.show();

});