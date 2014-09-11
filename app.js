(function() { // We use this anonymous function to create a closure.
	before_filter :set_header;
	
	var app = angular.module('splatter-web', ['ngResource']);
	
	app.factory('User', function($Resource){
		return $Resource('http://weily.sqrawler.com:3000/users/:id', {id: '@id'}, 
						{'update': {method:'PUT'}} );
	});
		
		
	app.controller('UserController', function(User)
	{
		this.data = {};
		this.uList = User.query();
		this.getUser = function(i)
		{
			return User.get({id: i});
		};
		
		this.login = function()
		{
			this.loggedin_user = this.getUser(this.data.id);
			this.data = {};
		};
		
		this.updateUser = function()
		{
			this.loggedin_user.name = this.data.name;
			this.loggedin_user.email = this.data.email;
			this.loggedin_user.blurb = this.data.blurb;
			this.loggedin_user.$update();
			this.data = {};
		};
		
		this.delUser = function()
		{
			User.delete({id: this.data.delid});
		};
	});
        // add your form controller below
		/* app.controller("UpdateFormController", function()
		{
			this.data = {};
			this.updateUser = function(user)
			{
				user.u.name = this.data.name;
				this.data = {}; //Clears the form
			}
		}); */
		

        // add your form controller above

	// mock data
        var u1 = {
          id: 1,
          name: "Jane Doe",
          email: "jane@doe.com",
          blurb: "Sometimes I feel anonymous."
	};	

        var u2 = {
          id: 2,
	  name: "Bob Smith",
	  email: "bob@smith.org"
	};

       var feed = [
         {
	   id: 3,
           user_id: 2,
           body: "This is Bob's most recent splatt.",
	   created_at: "2014-08-17T22:00:00Z"
	 },
         {
	   id: 2,
           user_id: 2,
           body: "This is Bob's second splatt.",
	   created_at: "2014-08-16T13:25:00Z"
         },
         {
	   id: 1,
           user_id: 2,
           body: "This is Bob's first splatt.",
	   created_at: "2014-08-16T10:25:00Z"
	 }
	 
       ];
})();