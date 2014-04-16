Ext.onReady(function () {

	Ext.create('Ext.Button', {
		// renderTo: 'buttondiv',
		renderTo:Ext.getBody(),
		text : 'Add',
		width :100,
		height :50,
		handler: function(){

			// Ext.get('messagediv').update("you've clicked me");  

			Ext.Ajax.request({
				url: '/',

				method: 'get',

				success: function(response)
				{
					var resp = Ext.decode(response.responseText);
					// if (resp.success){
					// }
					// else{
					// }

					console.info(resp);
					// Ext.get('messagediv').update(resp.value);
					Ext.Msg.alert('Success!', resp.value);
				},
				
				failure: function()
				{
					Ext.Msg.alert('Problem!', 'Server Error');
				}
			
			
			});
		}
	});
	

});