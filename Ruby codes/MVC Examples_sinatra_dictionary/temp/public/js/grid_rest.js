Ext.define('Writer.Form', {
    extend: 'Ext.form.Panel',
    alias: 'widget.writerform',

    requires: ['Ext.form.field.Text'],

    initComponent: function(){
        this.addEvents('create');
        Ext.apply(this, {
            activeRecord: null,
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
                items: ['->', {
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

    setActiveRecord: function(record){
        this.activeRecord = record;
        if (record) {
            this.down('#save').enable();
            this.getForm().loadRecord(record);
        } else {
            this.down('#save').disable();
            this.getForm().reset();
        }
    },

    onSave: function(){
        var active = this.activeRecord,
            form = this.getForm();

        if (!active) {
            return;
        }
        if (form.isValid()) {
            form.updateRecord(active);
            this.onReset();
        }
    },

    onCreate: function(){
        var form = this.getForm();

        if (form.isValid()) {
            this.fireEvent('create', this, form.getValues());
            form.reset();
        }

    },

    onReset: function(){
        this.setActiveRecord(null);
        this.getForm().reset();
    }
});

Ext.define('Writer.Grid', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.writergrid',

    requires: [
        'Ext.grid.plugin.CellEditing',
        'Ext.form.field.Text',
        'Ext.toolbar.TextItem'
    ],

    initComponent: function(){

        this.editing = Ext.create('Ext.grid.plugin.CellEditing');

        Ext.apply(this, {
            iconCls: 'icon-grid',
            frame: true,
            plugins: [this.editing],
            dockedItems: [{
                xtype: 'toolbar',
                items: [{
                    iconCls: 'icon-add',
                    text: 'Add',
                    scope: this,
                    handler: this.onAddClick
                }, {
                    iconCls: 'icon-delete',
                    text: 'Delete',
                    disabled: true,
                    itemId: 'delete',
                    scope: this,
                    handler: this.onDeleteClick
                }]
            }, {
                weight: 2,
                xtype: 'toolbar',
                dock: 'bottom',
                items: [{
                    xtype: 'tbtext',
                    text: '<b>@cfg</b>'
                }, '|', {
                    text: 'autoSync',
                    enableToggle: true,
                    pressed: true,
                    tooltip: 'When enabled, Store will execute Ajax requests as soon as a Record becomes dirty.',
                    scope: this,
                    toggleHandler: function(btn, pressed){
                        this.store.autoSync = pressed;
                    }
                }, {
                    text: 'batch',
                    enableToggle: true,
                    pressed: true,
                    tooltip: 'When enabled, Store will batch all records for each type of CRUD verb into a single Ajax request.',
                    scope: this,
                    toggleHandler: function(btn, pressed){
                        this.store.getProxy().batchActions = pressed;
                    }
                }, {
                    text: 'writeAllFields',
                    enableToggle: true,
                    pressed: false,
                    tooltip: 'When enabled, Writer will write *all* fields to the server -- not just those that changed.',
                    scope: this,
                    toggleHandler: function(btn, pressed){
                        this.store.getProxy().getWriter().writeAllFields = pressed;
                    }
                }]
            }, {
                weight: 1,
                xtype: 'toolbar',
                dock: 'bottom',
                ui: 'footer',
                items: ['->', {
                    iconCls: 'icon-save',
                    text: 'Sync',
                    scope: this,
                    handler: this.onSync
                }]
            }],
            columns: [{
                text: 'ID',
                width: 40,
                sortable: true,
                dataIndex: 'id'
            }, {
                header: 'Email',
                flex: 1,
                sortable: true,
                dataIndex: 'email',
                field: {
                    type: 'textfield'
                }
            }, {
                header: 'First',
                width: 100,
                sortable: true,
                dataIndex: 'first',
                field: {
                    type: 'textfield'
                }
            }, {
                header: 'Last',
                width: 100,
                sortable: true,
                dataIndex: 'last',
                field: {
                    type: 'textfield'
                }
            }]
        });
        this.callParent();
        this.getSelectionModel().on('selectionchange', this.onSelectChange, this);
    },
    
    onSelectChange: function(selModel, selections){
        this.down('#delete').setDisabled(selections.length === 0);
    },

    onSync: function(){
        this.store.sync();
    },

    onDeleteClick: function(){
        var selection = this.getView().getSelectionModel().getSelection()[0];
        if (selection) {
            this.store.remove(selection);
        }
    },

    onAddClick: function(){
        var rec = new Writer.Person({
            first: '',
            last: '',
            email: ''
        }), edit = this.editing;

        edit.cancelEdit();
        this.store.insert(0, rec);
        edit.startEditByPosition({
            row: 0,
            column: 1
        });
    }
});

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

Ext.require([
    'Ext.data.*',
    'Ext.tip.QuickTipManager',
    'Ext.window.MessageBox'
]);

Ext.onReady(function(){
    Ext.tip.QuickTipManager.init();
    
    Ext.create('Ext.button.Button', {
        margin: '0 0 20 20',
        text: 'Reset sample database back to initial state',
        renderTo: document.body,
        tooltip: 'The sample database is stored in the session, including any changes you make. Click this button to reset the sample database to the initial state',
        handler: function(){
            Ext.getBody().mask('Resetting...');
            Ext.Ajax.request({
                url: 'app.php/example/reset',
                callback: function(options, success, response) {
                    Ext.getBody().unmask();
                    
                    var didReset = true,
                        o;
                    
                    if (success) {
                        try {
                            o = Ext.decode(response.responseText);
                            didReset = o.success === true;
                        } catch (e) {
                            didReset = false;
                        }
                    } else {
                        didReset = false;
                    }
                    
                    if (didReset) {
                        store.load();
                        main.down('#form').setActiveRecord(null);
                        Ext.example.msg('Reset', 'Reset successful');
                    } else {
                        Ext.MessageBox.alert('Error', 'Unable to reset example database');
                    }
                    
                }
            });
        }
    })
    
    var store = Ext.create('Ext.data.Store', {
        model: 'Writer.Person',
        autoLoad: true,
        autoSync: true,
        proxy: {
            type: 'ajax',
            api: {
                read: 'app.php/users/view',
                create: 'app.php/users/create',
                update: 'app.php/users/update',
                destroy: 'app.php/users/destroy'
            },
            reader: {
                type: 'json',
                successProperty: 'success',
                root: 'data',
                messageProperty: 'message'
            },
            writer: {
                type: 'json',
                writeAllFields: false,
                root: 'data'
            },
            listeners: {
                exception: function(proxy, response, operation){
                    Ext.MessageBox.show({
                        title: 'REMOTE EXCEPTION',
                        msg: operation.getError(),
                        icon: Ext.MessageBox.ERROR,
                        buttons: Ext.Msg.OK
                    });
                }
            }
        },
        listeners: {
            write: function(proxy, operation){
                if (operation.action == 'destroy') {
                    main.child('#form').setActiveRecord(null);
                }
                Ext.example.msg(operation.action, operation.resultSet.message);
            }
        }
    });

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
                create: function(form, data){
                    store.insert(0, data);
                }
            }
        }, {
            itemId: 'grid',
            xtype: 'writergrid',
            title: 'User List',
            flex: 1,
            store: store,
            listeners: {
                selectionchange: function(selModel, selected) {
                    main.child('#form').setActiveRecord(selected[0] || null);
                }
            }
        }]
    });
});
Ext.require([
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.util.*',
    'Ext.state.*'
]);

// Define Company entity
// Null out built in convert functions for performance *because the raw data is known to be valid*
// Specifying defaultValue as undefined will also save code. *As long as there will always be values in the data, or the app tolerates undefined field values*
Ext.define('Company', {
    extend: 'Ext.data.Model',
    fields: [
       {name: 'company'},
       {name: 'price',      type: 'float', convert: null,     defaultValue: undefined},
       {name: 'change',     type: 'float', convert: null,     defaultValue: undefined},
       {name: 'pctChange',  type: 'float', convert: null,     defaultValue: undefined},
       {name: 'lastChange', type: 'date',  dateFormat: 'n/j h:ia', defaultValue: undefined}
    ],
    idProperty: 'company'
});

Ext.onReady(function() {
    Ext.QuickTips.init();
    
    // setup the state provider, all state information will be saved to a cookie
    Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));

    // sample static data for the store
    var myData = [
        ['3m Co',                               71.72, 0.02,  0.03,  '9/1 12:00am'],
        ['Alcoa Inc',                           29.01, 0.42,  1.47,  '9/1 12:00am'],
        ['Altria Group Inc',                    83.81, 0.28,  0.34,  '9/1 12:00am'],
        ['American Express Company',            52.55, 0.01,  0.02,  '9/1 12:00am'],
        ['American International Group, Inc.',  64.13, 0.31,  0.49,  '9/1 12:00am'],
        ['AT&T Inc.',                           31.61, -0.48, -1.54, '9/1 12:00am'],
        ['Boeing Co.',                          75.43, 0.53,  0.71,  '9/1 12:00am'],
        ['Caterpillar Inc.',                    67.27, 0.92,  1.39,  '9/1 12:00am'],
        ['Citigroup, Inc.',                     49.37, 0.02,  0.04,  '9/1 12:00am'],
        ['E.I. du Pont de Nemours and Company', 40.48, 0.51,  1.28,  '9/1 12:00am'],
        ['Exxon Mobil Corp',                    68.1,  -0.43, -0.64, '9/1 12:00am'],
        ['General Electric Company',            34.14, -0.08, -0.23, '9/1 12:00am'],
        ['General Motors Corporation',          30.27, 1.09,  3.74,  '9/1 12:00am'],
        ['Hewlett-Packard Co.',                 36.53, -0.03, -0.08, '9/1 12:00am'],
        ['Honeywell Intl Inc',                  38.77, 0.05,  0.13,  '9/1 12:00am'],
        ['Intel Corporation',                   19.88, 0.31,  1.58,  '9/1 12:00am'],
        ['International Business Machines',     81.41, 0.44,  0.54,  '9/1 12:00am'],
        ['Johnson & Johnson',                   64.72, 0.06,  0.09,  '9/1 12:00am'],
        ['JP Morgan & Chase & Co',              45.73, 0.07,  0.15,  '9/1 12:00am'],
        ['McDonald\'s Corporation',             36.76, 0.86,  2.40,  '9/1 12:00am'],
        ['Merck & Co., Inc.',                   40.96, 0.41,  1.01,  '9/1 12:00am'],
        ['Microsoft Corporation',               25.84, 0.14,  0.54,  '9/1 12:00am'],
        ['Pfizer Inc',                          27.96, 0.4,   1.45,  '9/1 12:00am'],
        ['The Coca-Cola Company',               45.07, 0.26,  0.58,  '9/1 12:00am'],
        ['The Home Depot, Inc.',                34.64, 0.35,  1.02,  '9/1 12:00am'],
        ['The Procter & Gamble Company',        61.91, 0.01,  0.02,  '9/1 12:00am'],
        ['United Technologies Corporation',     63.26, 0.55,  0.88,  '9/1 12:00am'],
        ['Verizon Communications',              35.57, 0.39,  1.11,  '9/1 12:00am'],
        ['Wal-Mart Stores, Inc.',               45.45, 0.73,  1.63,  '9/1 12:00am']
    ];

    /**
     * Custom function used for column renderer
     * @param {Object} val
     */
    function change(val) {
        if (val > 0) {
            return '<span style="color:green;">' + val + '</span>';
        } else if (val < 0) {
            return '<span style="color:red;">' + val + '</span>';
        }
        return val;
    }

    /**
     * Custom function used for column renderer
     * @param {Object} val
     */
    function pctChange(val) {
        if (val > 0) {
            return '<span style="color:green;">' + val + '%</span>';
        } else if (val < 0) {
            return '<span style="color:red;">' + val + '%</span>';
        }
        return val;
    }

    // create the data store
    var store = Ext.create('Ext.data.ArrayStore', {
        model: 'Company',
        data: myData
    });

    // create the Grid
    var grid = Ext.create('Ext.grid.Panel', {
        store: store,
        stateful: true,
        collapsible: true,
        multiSelect: true,
        stateId: 'stateGrid',
        columns: [
            {
                text     : 'Company',
                flex     : 1,
                sortable : false,
                dataIndex: 'company'
            },
            {
                text     : 'Price',
                width    : 75,
                sortable : true,
                renderer : 'usMoney',
                dataIndex: 'price'
            },
            {
                text     : 'Change',
                width    : 75,
                sortable : true,
                renderer : change,
                dataIndex: 'change'
            },
            {
                text     : '% Change',
                width    : 75,
                sortable : true,
                renderer : pctChange,
                dataIndex: 'pctChange'
            },
            {
                text     : 'Last Updated',
                width    : 85,
                sortable : true,
                renderer : Ext.util.Format.dateRenderer('m/d/Y'),
                dataIndex: 'lastChange'
            },
            {
                menuDisabled: true,
                sortable: false,
                xtype: 'actioncolumn',
                width: 50,
                items: [{
                    icon   : '../shared/icons/fam/delete.gif',  // Use a URL in the icon config
                    tooltip: 'Sell stock',
                    handler: function(grid, rowIndex, colIndex) {
                        var rec = store.getAt(rowIndex);
                        alert("Sell " + rec.get('company'));
                    }
                }, {
                    getClass: function(v, meta, rec) {          // Or return a class from a function
                        if (rec.get('change') < 0) {
                            this.items[1].tooltip = 'Hold stock';
                            return 'alert-col';
                        } else {
                            this.items[1].tooltip = 'Buy stock';
                            return 'buy-col';
                        }
                    },
                    handler: function(grid, rowIndex, colIndex) {
                        var rec = store.getAt(rowIndex);
                        alert((rec.get('change') < 0 ? "Hold " : "Buy ") + rec.get('company'));
                    }
                }]
            }
        ],
        height: 350,
        width: 600,
        title: 'Array Grid',
        renderTo: 'grid-example',
        viewConfig: {
            stripeRows: true,
            enableTextSelection: true
        }
    });
});
