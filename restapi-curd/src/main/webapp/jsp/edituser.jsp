<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edit profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
<input type="hidden" value=<%=request.getAttribute("usesr_name")%>
		id="usesr_name" />

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">tweets</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse " id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Features</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/logout">logout</a>
					</li>


				</ul>
			</div>
		</div>
	</nav>



	<div class="container">

		<div class="row">

			<div class="col">
				<div class="card ">

					<div class="mx-auto">


						<img class="rounded-circle mt-2" width="150px"
							src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
					</div>

					<div class="card-body w-50 mx-auto">
						<div class="mb-3">
							<label for="username" class="form-label">user name</label> <input
								type="text" class="form-control" id="username"
								aria-describedby="emailHelp">
							<div id="userlHelp" class="form-text">you user name should be uinqe.</div>
						</div>

						<div class="mb-3">
							<label for="Email" class="form-label">Email
								address</label> <input type="email" class="form-control"
								id="Email" aria-describedby="emailHelp">
							<div id="emailHelp" class="form-text">We'll never share
								your email with anyone else.</div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label>
							<input type="text" class="form-control"
								id="password">
								
								<div id="passwordHelp" class="form-text">enter new password</div>

						</div>

							<div class = "d-flex justify-content-between">
							
							<a  class="btn btn-primary" id ="edituser">edit</a>
							
							<button id = "delete" class = "btn btn-danger">Delete</button>
							
							
							</div>


						
					</div>
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



<script type="text/javascript" src="../js/edituser.js"></script>


</html>