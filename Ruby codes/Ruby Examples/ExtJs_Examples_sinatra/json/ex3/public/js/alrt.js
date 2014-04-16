// Ext.onReady(function(){
Ext.require('Ext.container.Viewport');
Ext.define('user',{
	extend:'Ext.data.Model', 
	//creating fields
	fields: [
		{name: 'id', type: 'int'},
		
		'name',
		
		{
		name: 'height',
		type: 'int',
		convert: function(inches){
		return Math.round(inches*2.54);
			}
		}
	],
		//create validation for fields
	validations:[
	{type:'presence', field:'id',},
	{type:'length', field:'name', min:2,max:2},
	{type:'length', field:'height', min:1,max:1},

],

	// creating proxy for saving/loading data from some source
	proxy: { 
		type:'rest',
		url:'/users', // get '/users' from  test.rb
		reader:'json'
	}
	
});
 
 
 // create one user model 'loki' in clientSide JS
	var loki = new user({
		id:1234,
		name:'loki',
		height:6
	});
	
//output in browser console ==== getting model 'loki' attributes
	console.info('getting model Loki attributes')
	console.log(loki.get('id'));  //1234
	console.log(loki.get('name')); //loki
	console.log(loki.get('height')); //6*2.54

//validate here 
	var validation = loki.validate();
	console.info(validation.isValid());  //false coz of length validation  
console.log('Is User valid?', validation.isValid()); //returns 'false' as there were validation errors
console.log('All Errors:', validation.items); //returns the array of all errors found on this model instance
console.log('name Errors:', validation.getByField('name')); //returns the errors for the age field



//request to  server using json with id 123  
// user.load(123, {
    // success: function(user) {
        // console.log(user.get('name'));
        // console.log(user.get('id'));
        // console.log(user.get('height'));
    // }
// });












// function highlight()
// {
// alert("you select paragraph");
// }
// console.log(Ext.select('p'));
// Ext.select('p').highlight();
	// var myButton = Ext.create('Ext.button.Button', {
	  // text: 'Test button',
	  // renderTo:Ext.getBody()
	// });

	// myButton.on('click', function(btn, e, eOpts) {
	  // // event handling here
	  // console.log(btn, e, eOpts);
		
		// });
// });