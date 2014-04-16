Ext.onReady(function(){

  

    Ext.QuickTips.init();

  

    var simpleForm = new Ext.FormPanel ({

        labelWidth: 75,         // label settings here cascade unless overridden

        url:'',    // when this form submitted, data goes here

        frame:true,

        title: 'Add Pirates Crew',

        bodyStyle:'padding:5px 5px 0',

        width: 350,

        defaults: {width: 230},

        defaultType: 'textfield',
  
        items: [{

                /*

                    here same as <input type="text" name="name" /> in HTML

                */

                fieldLabel: 'Name',

                name: 'name',

               allowBlank:false

            },{

                fieldLabel: 'Position',

                name: 'position'

            },{

                fieldLabel: 'Ambition',

                name: 'ambition'

        }],            

  

        buttons: [{

            text: 'Save',          

            handler: function () {
                // when this button clicked, sumbit this form

                simpleForm.getForm().submit({

                    waitMsg: 'Saving...',       // Wait Message

                    success: function () {      // When saving data success

                        Ext.MessageBox.alert ('Message','Data has been saved');

                        // clear the form

                        simpleForm.getForm().reset();

                    },

                    failure: function () {      // when saving data failed

                        Ext.MessageBox.alert ('Message','Saving data failed');

                    }

                });

            }

        },{

            text: 'Cancel',

            handler: function () {

                // when this button clicked, reset this form

                simpleForm.getForm().reset();

            }

        }]

  

    });

  

    // finally render the form

    simpleForm.render ('simple-form'); // render form to simple-form element (see simple-form.html)

  

});
