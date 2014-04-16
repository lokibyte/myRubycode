Ext.define('Writer.Form', {
  extend: 'Ext.form.Panel',
  alias: 'widget.writerform',
  requires: ['Ext.form.field.Text'],
  initComponent: function () {
    this.addEvents('create');
    Ext.apply(this, {
      current_selected_record: null,
      iconCls: 'icon-user',
      frame: true,
      title: 'User -- All fields are required',
      defaultType: 'textfield',
      bodyPadding: 5,
      fieldDefaults: {
        anchor: '100%',
        labelAlign: 'right'
      },
      items: [{
        fieldLabel: 'Email',
        name: 'email',
        allowBlank: false,
        vtype: 'email'
      }, {
        fieldLabel: 'First',
        name: 'first',
        allowBlank: false
      }, {
        fieldLabel: 'Last',
        name: 'last',
        allowBlank: false
      }],
      dockedItems: [{
        xtype: 'toolbar',
        dock: 'bottom',
        ui: 'footer',
        items: ['->',
        {
          iconCls: 'icon-save',
          itemId: 'save',
          text: 'Save',
          disabled: true,
          scope: this,
          handler: this.onSave
        }, {
          iconCls: 'icon-user-add',
          text: 'Create',
          scope: this,
          handler: this.onCreate
        }, {
          iconCls: 'icon-reset',
          text: 'Reset',
          scope: this,
          handler: this.onReset
        }]
      }]
    });
    this.callParent();
  },
  setcurrent_selected_record: function (record) {
    this.current_selected_record = record;
    if (record) {
      this.down('#save').enable();
      this.getForm().loadRecord(record);
    } else {
      this.down('#save').disable();
      this.getForm().reset();
    }
  },
  
  
  // onSave function for saving data to store**********************
  onSave: function () {
    var active = this.current_selected_record,
      form = this.getForm();
    if (!active) {
      return;
    }
    if (form.isValid()) {
      form.updateRecord(active);
      this.onReset();
    }
  },
  
  
  
  // onCreate function for GETTING VALUES FROM FORM **********************
  onCreate: function () {
    var form = this.getForm();
    if (form.isValid()) {
      this.fireEvent('create', this, form.getValues());
      form.reset();
    }
  },
  
  // onReset function for reset data in Form**********************
  
    onReset: function () {
    this.setcurrent_selected_record(null);
    this.getForm().reset();
  }
});


// model
Ext.define('Writer.Person', {
  extend: 'Ext.data.Model',
  fields: [{
    name: 'id',
    type: 'int',
    useNull: true
  }, 'email', 'first', 'last'],
  validations: [{
    type: 'length',
    field: 'email',
    min: 1
  }, {
    type: 'length',
    field: 'first',
    min: 1
  }, {
    type: 'length',
    field: 'last',
    min: 1
  }]
});

//store

  var store = Ext.create('Ext.data.Store', {
    model: 'Writer.Person',
    autoLoad: true,
    autoSync: true,
    proxy: {
      type: 'ajax',
      url:'/create',
	  // api: {
        // read: '/create',
        // create: '/create',
        // // update: 'app.php/users/update',
        // // destroy: 'app.php/users/destroy'
      // },
      reader: {
        type: 'json',
        successProperty: 'success',
        root: 'data',
        messageProperty: 'message'
      },
      writer: {
        type: 'json',
        // writeAllFields: true,
        root: 'data'
      }
   }
   
  });

  //page loading here
Ext.onReady(function() {


//create container 
var main = Ext.create('Ext.container.Container', {
    padding: '0 0 0 20',
    width: 500,
    height: 450,
    renderTo: document.body,
    layout: {
      type: 'vbox',
      align: 'stretch'
    },
    items: [{
      itemId: 'form',
      xtype: 'writerform',
      height: 150,
      margins: '0 0 10 0',
      listeners: {
        create: function (form, data) {
          store.insert(0, data);
        }
      }
    }]
  });



});