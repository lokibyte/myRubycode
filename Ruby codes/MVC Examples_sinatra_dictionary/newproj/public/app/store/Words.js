Ext.define('Dict.store.WOrds',{
	extend:'Ext.data.Store', // S capitalize
	fields:['id','words','meanings'],
	model:'Dict.model.WOrds',
	autoLoad:true,
	autoSync:true,
	proxy:{
		type:'ajax',
			api: {
				
				read:'/read',
				create:'/create',
				update:'/update',
				destroy:'/destroy'
			}
		reader: {
			type:'json'
			successProperty:'success',
			root:'data',
			messageProperty:'message',
			idProperty:'id'
		},
		writer:{
			type:'json'
			writeAllFeilds:false,
			root:'data'
		},
		
		listeners: {
			write:function()
		}
}


});
        
        listeners: {
            write: function(proxy, operation){
                if (operation.action == 'destroy') {
                    main.child('#form').setActiveRecord(null);
                }
                // Ext.example.msg(operation.action, operation.resultSet.message);
            }
        }
    });