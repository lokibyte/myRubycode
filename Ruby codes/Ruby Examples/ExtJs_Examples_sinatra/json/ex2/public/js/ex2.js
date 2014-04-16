Ext.onReady(function(){


// // ********* alert for testing pupose**********

	// Ext.Msg.alert('Hello', 'Welcome');



// // ********* Text field1********************

	// var word = Ext.create('Ext.form.field.Text', {
		// fieldLabel	: 'Word'
		// // renderTo :Ext.getBody() //render to body of the page
	// });




// // // ********* Text field2 **********

	// var meaning = Ext.create('Ext.form.field.Text', {
		// fieldLabel	: 'Meaning'
	// });



// //**********creating form********



	var form = Ext.create('Ext.form.Panel', {
		 title	: 'Add a Word'
		,url	: '/list'
		// ,method	: 'post'

		,items	: [		 //container for adding word and meaning textfields  TYPE -2


			{
				 xtype		: 'textfield'
				,fieldLabel	: 'Word'
				,name		: 'words'
			}
			,{
				 xtype		: 'textfield'
				,fieldLabel	: 'Meaning'
				,name		: 'meanings'
			}
		]


	});


// // ********* window **********


	var win = Ext.create('Ext.window.Window', {

		 title		: 'Welcome'
		,modal		: false //'modal:false' this configuration is used to edit or changes in  the background page without effecting javascript form
		,height		: 200
		,width		: 300
		,closable	: true
		,items		: [ form ]   //// add form to window
		,buttons	: [{
			 text	: 'Ok'
			,handler	: function(){
				var submissionform = form.getForm(); 

				var values = submissionform.getValues();

				var dictmodel = Ext.create('Dictinary', values);
				
				userStore.add(dictmodel);
				
				// userStore.sync();
				// form.submit({
					// success: function(f, a){

						// Ext.Msg.alert('Done!!', a.result.message)
					// }
					// ,failure: function(f, a){

						// Ext.Msg.alert('Error', a.result.message)
					// },
					// failure: function(form, action) {
						// Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
					// }
				// });
			}
		}]
	});

// Add Button
	Ext.create('Ext.Button',{
		text :'add word',
		// renderTo:Ext.getBody(),
		renderTo:'btn_div',
		handler: function() {


			win.show();

		}
	});



// model

Ext.define('Dictinary', {
	  extend: 'Ext.data.Model',
	  fields: [ 'words', 'meanings']
	  // fields: [{
		// name: 'words'
	  // },
	  // {
		// name: 'meanings'
	  // }]
});


// store

var  userStore = Ext.create('Ext.data.Store', {
    model: 'Dictinary',
    autoLoad: true,
	autoSync:true,

    proxy: {
		type: 'rest',
		url: '/list',

		reader: {
			type: 'json',
			root: 'data',
			successProperty: 'success'
		},
		writer: {
			type: 'json',
			writeAllfields:false, //just send changed fields
			allowSingle:false
		}
    }
  });

// grid Panel

Ext.create('Ext.grid.Panel', {
    // renderTo: Ext.getBody(),
	renderTo:'grid_div',
    store: userStore,
	id:'dict',
    width: 400,
    // height: 200, //set height manually

	autoHeight: true,

    title: 'Dictinary',
    columns: [
        {
            text: 'Word',
            width: 150,
            dataIndex: 'words',
			editor: 'textfield'
        },
        {
            text: 'Meaning',
            width: 150,
            dataIndex: 'meanings',
			editor: 'textfield'

        }

    ]
});

});