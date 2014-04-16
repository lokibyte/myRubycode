Ext.define('Demo.store.Masters', {
	 extend		: 'Ext.data.Store'
	
	,model		: 'Demo.model.Master'
	,autoLoad: true
    ,proxy: {
        type: 'ajax',
        url : 'resources/json/details.json'
    }

});