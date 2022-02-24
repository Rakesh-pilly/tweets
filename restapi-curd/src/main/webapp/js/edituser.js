var userid ;

$(document).ready(function() {
	
	let searchParams = new URLSearchParams(window.location.search)
let param = searchParams.get('user')

loadUser(param)




});

function loadUser(param) {


	$.ajax({
		type: 'GET',
		url: `/users/${param}`,
	}).done(function(data) {
		let user = data[0]
		userid = user.user_id;
		$("#username").val(user.username);
		$("#Email").val(user.email);
		$("#password").val(user.password);
	})

}


$("#edituser").click(function(){
	
	
	let payload = {
		
		 "username" :$("#username").val() ,
    "password" : $("#password").val(),
    "email" : $("#Email").val()
	}
	
		$.ajax({
		type: "PUT",
		url: `/users/${userid}`,
		contentType: "application/json",
		data: JSON.stringify(payload)
	}).done(function(data) {
		console.log(data)
		
		
	})
	
	
	;
		
		
	
	
})


$("#delete").click(function(){
	

	
		$.ajax({
		type: "DELETE",
		url: `/users/${userid}`,
		
	}).done(function(data) {
		console.log(data)
		
			location.href = '/logout'
		
		
	})
	
	
	;
		
		
	
	
})

