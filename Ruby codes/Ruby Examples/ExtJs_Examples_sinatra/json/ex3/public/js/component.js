Ext.onReady(function(){

    Ext.define('Employee', {
        extend: 'Ext.util.Observable',
        constructor: function(config){
            this.name = config.name;
            this.addEvents({
                "sayHello" : true,
                "sayGoodbye" : true
            });

            // Copy configured listeners into *this* object so 
            // that the base class's constructor will add them.
            this.listeners = config.listeners;

            // Call our superclass constructor to complete
            // construction process.
            this.callParent(arguments)
        }
    });

    var newEmployee = new Employee({
        name: "Neil",
        listeners: {
            sayHello: function() {   //event 'sayHello'
                // By default, "this" will be the object that
                // fired the event.
                console.log(this.name + " says Hello!");
            },
            sayGoodbye: function() {	//event 'sayGoodbye'
                console.log(this.name + " says goodbye!");
            }
        }
    });

    // with the custom event defined and listener registered...
    // ...fire it up!
    newEmployee.fireEvent('sayHello');
    newEmployee.fireEvent('sayGoodbye');

});