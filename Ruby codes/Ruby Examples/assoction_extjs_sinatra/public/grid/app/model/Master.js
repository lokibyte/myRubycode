Ext.define('Demo.model.Master', {
	 extend		: 'Ext.data.Model'
	 
	,fields: [
		'id', 'name'
	]
	,requires	: ['Demo.model.Detail','Ext.data.association.HasMany', 'Ext.data.association.BelongsTo']
	
	,associations	: [{
		 type			: 'hasMany'
		,model			: 'Demo.model.Detail'
		,primaryKey		: 'id'
		,foreignKey		: 'master_id'
		,associationKey	: 'details'
		,name	: 'details'
	}]
	 
});