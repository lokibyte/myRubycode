Ext.define('Dict.controller.Words',{
	extend:'Ext.app.controller',
	
	views: [
		'word.edit',
		'word.list'
	],
	stores:['Words'],
	models:['Words']




});