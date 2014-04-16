Ext.onReady(function(){

//panel 1 

	var panel1 = Ext.create('Ext.panel.Panel',{
		title:'Panel1',
		// region:'east',
		width:100,
		flex:1,
		height:400,
		items:[
			{
				xtype:'button',
				id:'btnid',
				text:'click button',
				handler: function(){
					// Ext.getCmp('txt').setText('you clicked button');
					Ext.getCmp('panel2id').fireEvent('abracadabra'); // create and fireEvent 'abracadabra' to panel2
					Ext.getCmp('panel3').fireEvent('aoneevent');
				}	
			}
		]
	});
	
	
	var panel3 = Ext.create('Ext.panel.Panel',{
		title:'Panel1',
		// region:'east',
		width:100,
		flex:1,
		height:400,
		id:'panel3'		,
		html:'panel3',
		listeners:
		{
			// this.addEvents('aoneevent');
			aoneevent:function() {
		
			// alert("listening from panel2");
				Ext.getCmp('panel3').update('i listen from panel2');
				console.info('panel2');	
			}
		}
	});
	
	
// panel 2 define here to intialize the panel 'initComponent'
	Ext.define('panel2def', {
	
		extend: 'Ext.panel.Panel',
		flex:1,
		title:'Text Panel',
		height:400,
		// width:150
		html: 'hello',
		initComponent: function(){  // intialize the componets such as addEvents('abracadabra') from panel1 & callParent()
			this.addEvents('abracadabra','aoneevent'); // this refers to currnt panel i.e panel2 here
			this.callParent();
			
		}
		,listeners: {
			abracadabra: function(){  // listening 'abracadabra' event from panel1 * 
				console.info('heard');
				Ext.getCmp('panel2id').update('goodbye'); //when it's listened the above event it perform update html text to goodbye
			}
		}
	});
	
	var panel2 = Ext.create('panel2def', {
		id: 'panel2id'
	});
	
	
	
	
	
	
	// view port to hold two panels i.e in items[panel1,panel2]
	
	Ext.create('Ext.container.Viewport',{
	
		layout:'hbox',
		// renderTo:Ext.getBody(),
		items: [panel1,panel2,panel3],
		
	});
});