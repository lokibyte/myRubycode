Ext.Loader.setConfig({ enabled:true});

Ext.application({
    name: 'AM',

	controllers: [ 'Users' ],
	
	autoCreateViewport: true
});