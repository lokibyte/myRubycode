Ext.onReady(function(){

var el=Ext.get('divid');
      // event name      event handler
	el.on(    'click', function(e, t, eOpts){
	// handling event here
	console.info('hello');
   // Ext.Msg.alert("hello world");
});



//// demo of event	
	// var myButton = Ext.create('Ext.button.Button', {
  // text: 'Test button',
  // renderTo:Ext.getBody(),
  // listeners : {
    // click: function(btn, e, eOpts) {
      // // event handling here
      // console.log(btn, e, eOpts);
    // }
  // }
// });



// demo of listeners

new Ext.panel.Panel({
    width: 400,
    height: 200,
	renderTo:Ext.getBody(),
 
    listeners: {
        click: {
            element: 'el', //bind to the underlying el property on the panel
            fn: function(){ console.log('click el'); }
        },
        dblclick: {
            element: 'body', //bind to the underlying body property on the panel
            fn: function(){ console.log('dblclick body'); }
        }
    }
	});

});



