Ext.Loader.setConfig({
	 enabled		: true
	,disableCaching	: false

});

Ext.application({
     name				: 'App'

	,appFolder			: 'app'

	,launch: function(){
		
		Ext.create('Ext.window.Window', {
			 title	: 'Diff'
			,width	: '100%'
			,height	: '100%'
			,layout: {
				type: 'hbox',
				align: 'middle'
			}
			,items	: [
				{
					xtype:'button'
					,text:'getDate'
					,scope:this
					,handler:function(){
						// var date_time = 1398783243119;
						var date_time = new Date().getTime();
						var dt = this.getDateFormat(date_time);
						console.info(this,dt);
						
					}
				}
				,{
					xtype:'container'
				} 
								
			]
		}).show();
	}
	,getDateFormat:function(datetime){
		var date = new Date(datetime);
		var today = Ext.Date.clearTime(new Date()),
            todayTime = today.getTime(),
            dueDateTime;

        if(!date) {
            return '(No Date)';
        }
        dueDateTime = Ext.Date.clearTime(date).getTime();
        if(dueDateTime === todayTime) {
            return 'Today'+ Ext.Date.format(date, 'g A');
        }
        if(dueDateTime > todayTime) {
            if(dueDateTime === Ext.Date.add(today, Ext.Date.DAY, 1).getTime()) {
                // due date is current date + 1 day
                return 'Tomorrow';
            }
            if(dueDateTime < Ext.Date.add(today, Ext.Date.DAY, 7).getTime()) {
                // if the due date is less than one week in the future, return the day of the week.
                return Ext.Date.format(date, 'l');
            }
        } else {
            if(dueDateTime === Ext.Date.add(today, Ext.Date.DAY, -1).getTime()) {
                // due date is current date - 1 day.
                // return 'Yesterday';
                return 'Yesterday'+ Ext.Date.format(date, 'g A');
            }
            if(dueDateTime > Ext.Date.add(today, Ext.Date.DAY, -7).getTime()) {
                // if the due date is less than one week past, return 'Last' + the day of the week.
                return 'Last '+ Ext.Date.format(date, 'l');
            }
        }
        // return date.getFullYear() === today.getFullYear() ? Ext.Date.format(date, 'D m/d') : Ext.Date.format(date, 'D m/d/Y');
        return date.getFullYear() === today.getFullYear() ? Ext.Date.format(date, 'D M,d') : Ext.Date.format(date, 'D m/d/Y');
	}
});

