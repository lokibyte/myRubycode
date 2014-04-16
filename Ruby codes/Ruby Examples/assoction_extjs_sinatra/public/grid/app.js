C = console.info;

Ext.Loader.setConfig({
	enabled:true
	,disableCaching: false
});

Ext.application({
		name:'Demo'
		,appFOlder:'app'
		,autoCreateViewport :true
		,controllers		: [ 'Document' ]
		

});