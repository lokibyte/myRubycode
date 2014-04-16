
Ext.define('Demo.controller.Document', {
     extend: 'Ext.app.Controller'
	 ,requires	: ['Demo.model.Detail']
	 ,stores:['Masters','Details']
	 ,models:['Master','Detail']
	
	,refs: [
		{
			 selector	: 'detailspanel'
			,ref		: 'detailspanel'
		}
		,{
			 selector	: 'editform'
			,ref		: 'editform'
		}
		,{
			 selector	: 'details'
			,ref		: 'details'
		}
	]
	
	
	,init: function() {
		this.control({
			'masters':{
				select:function(selmodel,record){ 
					var rec = record.details();
					// C(selmodel);
					// C(rec);
					// this.showGrid(rec,this.getDetailsStore());
					// this.showGrid(rec);
					// this.showGrid(rec);
					this.getDetails().bindStore(rec);
				}
			}
		});
	}
	// ,showGrid: function(rec){
		// this.getDetails().bindStore(rec);
	// }
});

