<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>tweets</title>

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



	<div class="container-fluid">
		<div class="row pt-4">
			<div class="col">
				<div class="card">
				
				<div class = "mx-auto">
				
				
            <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
				</div>
				
					<div class="card-body text-center">
						<h5 class="card-title" id = "cardname"></h5>
						<p class="card-text" id = "cardemail"></p>
						<a href="/edituser?user=<%=request.getAttribute("usesr_name")%>" class="btn btn-primary">edit</a>
					</div>
				</div>

			</div>
			<div class="col-6">

				<div class="container " id="tweets"></div>


			</div>

			<div class="col">

				<div class="row">

					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">What's
							in you mind</label>
						<textarea class="form-control" id="tweetwriten" rows="3"></textarea>


						<button id="postTweet" class="btn btn-primary my-3">Post</button>

					</div>

				</div>



			</div>
		</div>
	</div>



	<div class="modal fade" id="editModal" tabindex="-1"
		aria-labelledby="editModallLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">edit tweet</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<textarea class="form-control" id="tweetedit" rows="3"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" id="savemodel" aria-label="Close"
						data-bs-dismiss="modal" class="btn btn-primary">Save
						changes</button>
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



<script type="text/javascript" src="../js/card.js"></script>


</html>