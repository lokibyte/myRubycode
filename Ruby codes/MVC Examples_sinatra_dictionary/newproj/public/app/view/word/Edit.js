Ext.define('AM.view.user.Edit', {
    extend: 'Ext.window.Window',
    alias : 'widget.useredit',
    xtype : 'useredit',

    title : 'Edit User',
    layout: 'fit',
    autoShow: true,
	
	items	: [
		{
			xtype: 'form',
			items: [
				{
					xtype: 'textfield',
					name : 'name',
					fieldLabel: 'Name'
				},
				{
					xtype: 'textfield',
					name : 'email',
					fieldLabel: 'Email'
				}
			]
		}
	],
	
	buttons	: [
		{
			text: 'Save',
			action: 'save'
		},
		{
			text: 'Cancel',
			action: 'cancel'
		}
	]

});