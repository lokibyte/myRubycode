Ext.define('Demo.model.Detail', {
	 extend		: 'Ext.data.Model'
	 
	,fields: [
			'id','master_id','dname'
	]
	,requires	: ['Ext.data.association.BelongsTo']
	
	,associations	: [{
		 type			: 'belongsTo'
		,model			: 'Demo.model.Master'
		,primaryKey		: 'id'
		,foreignKey		: 'master_id'
		,name	: 'master'
	}]
	
	 
});