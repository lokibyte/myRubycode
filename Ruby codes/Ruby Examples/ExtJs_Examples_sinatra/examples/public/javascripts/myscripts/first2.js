Ext.onReady(function(){

// Basic Examples

var dat = Ext.create('Ext.panel.Panel', 
{
    bodyPadding: 10, 		//padding size
	title: 'Hello',
    width: 300,				// panel width	
	height:150,  			 // panel height
	renderTo: Ext.getBody(),
	 

// add items (componets to Panel)
	 
	 items:[
	 {
	 xtype: 'datefield',  		//datefield
	 fieldLabel:'start Date'
	 },
	 
	 
	 
	 {
	 xtype:'datefield', 	 //datefield
	 fieldLabel:'End Date'
	 },
	 
	 
	 // add button to Panel

	// {
	// xtype: 'button' ,
	// text: 'OK',
	// scale:'medium',  		//set scale to button like large/medium/small
	// enableToggle:true
	
	// }		,
	
	// Menu Button 
	
	// {
	// xtype: 'button' ,
	// text: 'menu Button',
	// scale:'medium',  		//set scale to button like large/medium/small
	// enableToggle:true,
	// arrowAlign:'top',
	// menu: [{text:'menu1'},
		   // {text:'menu2'},
		   // {text: 'menu3'},
		   // {text:'menu4'} ]
	// }
	
 ],  // end of items

	buttonAlign: 'left', // align both buttons to left
	buttons: [
		{
			text: 'Ok'
		} , 
		
		'->' ,  // align 'cancel' button to the right
		
		{
			text: 'Cancel'
		}
			]
	

	 
});  // end of create function

});  //end of onReady