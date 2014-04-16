Ext.define('AM.controller.Users', {
    extend: 'Ext.app.Controller',

     views: [
        'user.List',
        'user.Edit'
    ],

	stores: ['Users'],
    models: ['User'],
	
	refs: [
		{
			selector: '#editwindowid', // using id of the component
			ref: 'editWindow'
		}
		,{
			selector: 'useredit button[action=cancel]', // use componet directly
			ref: 'cancelButton'
		}
	],
	
	
	//******* init 
    init: function() {
        this.control({
            'userlist': {
                itemdblclick: this.editUser
            },
			
			'useredit button[action=cancel]': {
				click: this.onCancel
			}
        });
    },
	
	onCancel: function(){
		console.log('cancel clicked');
		this.getEditWindow().close();
	},

    editUser: function(grid, record) {
        var view = Ext.widget('useredit', {
			id: 'editwindowid'
		});
		// var win = Ext.create('AM.view.user.Edit');

        view.down('form').loadRecord(record); //load record to window form 
    }
});



