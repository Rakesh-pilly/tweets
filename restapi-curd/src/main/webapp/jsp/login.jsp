<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
	
</head>
<body>


	<div class="container">

		<div class="row">

			<div class="col-6 p-6 ">

				<form class="form-signin" method="post" action="/login">


					<h2 class="form-signin-heading">Please sign in</h2>
					
					<p>
						<label for="username" class="sr-only">Username</label> <input
							type="text" id="username" name="username" class="form-control"
							placeholder="Username" required="" autofocus="">
					</p>
					<p>
						<label for="password" class="sr-only">Password</label> <input
							type="password" id="password" name="password"
							class="form-control" placeholder="Password" required="">
					</p>
					<input name="_csrf" type="hidden"
						value="7eac89c0-b65d-49d0-9a18-825543b5f50d">
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
						in</button>
				</form>

			</div>


			<div class="col-6">
			
			
			<div  >


					<h2 class="form-signin-heading" >sign up</h2>
					
					<p>
						<label for="username" class="sr-only">Username</label> <input
							type="text" id="newusername" name="newusername" class="form-control"
							placeholder="Username" required="" >
					</p>
					<p>
						<label for="password" class="sr-only">Password</label> <input
							type="password" id="newpassword" name="newpassword"
							class="form-control" placeholder="Password" required="">
					</p>
					
					<p>
						<label for="password" class="sr-only">Email</label> <input
							type="email" id="newemail" name="newemail"
							class="form-control" placeholder="Email " required="">
					</p>
					<input name="_csrf" type="hidden"
						value="7eac89c0-b65d-49d0-9a18-825543b5f50d">
					<button class="btn btn-lg btn-primary btn-block" id = "singup" >Sign up</button>
				</div>
			
			
			</div>
		</div>



	</div>

</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
	
	
	<script type="text/javascript">
	
	 $("#singup").click(function(){
		 
		 
		 let payload = {
				 "username" : $("#newusername").val(),
				    "password" : $("#newpassword").val(),
				    "email" : $("#newemail").val()
		 }
		 
		 
		$.ajax({
			type: 'POST',
			url: "/users",
			contentType: "application/json",
			data: JSON.stringify(payload)
		}).done(function(data){
			
			console.log(data)
			location.reload();
			
		})
		
		
	})
	 
	
	</script>




</html>