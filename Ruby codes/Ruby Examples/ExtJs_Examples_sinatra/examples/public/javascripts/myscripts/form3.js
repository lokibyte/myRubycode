Ext.onReady(function(){

// Ext.Msg.alert('hshdjashdjsa');

Ext.create('Ext.form.FormPanel',{
	// extend:,
	// alias:'widget.compose',
	
	renderTo: Ext.getBody(),
	 width: 300,				// panel width	
	// height:150, 
	title:'compose mail',
	items:[
		{
		xtype:'textfield',
		fieldLabel:'To'
			
		},{
			xtype:'textfield',
			fieldLabel:'subject'
			
		},{
			xtype:'textarea',
			grow      : true,
			name      : 'message',
			fieldLabel: 'Message',
			anchor    : '100%'
		}
		
	
	]
});

});