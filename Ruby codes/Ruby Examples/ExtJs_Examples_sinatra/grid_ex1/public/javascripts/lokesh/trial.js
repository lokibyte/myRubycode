
Ext.onReady(function(){

	Ext.define('User', {
    extend: 'Ext.data.Model',
    fields: [ 'name', 'email', 'phone','dob' ]
});

var userStore = Ext.create('Ext.data.Store', {
    model: 'User',
    data: [
        { name: 'Lisa', email: 'lisa@simpsons.com', phone: '555-111-1224' ,dob:'12/10/1987'},
        { name: 'Bart', email: 'bart@simpsons.com', phone: '555-222-1234' ,dob:'12/10/1987'},
        { name: 'Homer', email: 'home@simpsons.com', phone: '555-222-1244' ,dob:'12/10/1987'},
        { name: 'Marge', email: 'marge@simpsons.com', phone: '555-222-1254',dob:'12/10/1987' }
		
	]
});

Ext.create('Ext.grid.Panel', {
    renderTo: Ext.getBody(),
	
	// selType: 'cellmodel', //cell selecting
	selType:'rowmodel',	//RowEditing
	
	// plugins: [
        // Ext.create('Ext.grid.plugin.CellEditing', {
            // clicksToEdit: 1
        // })
    // ],
	
	plugins: [
        Ext.create('Ext.grid.plugin.RowEditing', {
            clicksToEdit: 1
        })
    ],
    
	store: userStore,
    width: 400,
    height: 200,
    title: 'Application Users',
    columns: [
        {
            text: 'Name',
            width: 100,
            sortable: false,
            hideable: false,
            dataIndex: 'name',
			editor:{
			xtype:'textfield',
			alloBlank:false
			}
			
        },
        
		{
            text: 'Email Address',
            width: 150,
            dataIndex: 'email',
            hidden: true,  //hidden email field in grid panel
			editor: 'textfield'
			,renderer:function(value) {
            return Ext.String.format('<a href="mailto:{0}">{1}</a>', value, value);
			}
        },
		
        {
            text: 'Phone Number',
            flex: 1,
            dataIndex: 'phone'
        },
		
		{
			text:'Date of Birth',
			width:150,
			dataIndex:'dob',
			editor: 'datefield'
			
		}
		]
	});

});