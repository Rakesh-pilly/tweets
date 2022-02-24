
var userid;

$(document).ready(function() {
	console.log("ready!");
	loadUser();

});

function loadUser() {


	$.ajax({
		type: 'GET',
		url: `/users/${$("#usesr_name").val()}`,
	}).done(function(data) {
		let user = data[0]
		userid = user.user_id;
		console.log(userid)
		loadUserDetails(user)
		loadTweets();
		
		
	})

}


function loadUserDetails(username){
	
	
	
	$("#cardname").html(username.username)
	$("#cardemail").html(username.email)
	
	
	
}


function loadTweets(l) {
	$("#tweets").html("");


	$.ajax({
		type: 'GET',
		url: "/tweets",
	}).done(function(data) {



		for (let e of data) {

			let editButton = "";
			let deleteButton = ""

			if (e.user_id === userid || userid == 1) {


				editButton = `
				<button type="button" onClick = "editTweet(${e.tweet_id},${e.user_id}, )" data-bs-toggle="modal" data-bs-target="#editModal" class="btn btn-outline-secondary">edit</button>`;

				deleteButton = `<a  onClick = "tweetDelete(${e.tweet_id})" class="btn btn-danger">delete</a>`
			}


			let like = "Like";
			let count = 0

			$.ajax({
				type: 'GET',
				url: `/likes/${userid}/${e.tweet_id}`
			}).done(function(data) {

				if (data[0].count !== 0) {
					like = "Liked";
					count = data[0].count;
				}

				getLike(e.tweet_id)

				$("#tweets").append(


					`
				<div class="card mx-auto mb-4">
						
						<div class="card-body">
						
						<div class = "d-flex justify-content-between">
						
								<h5 class="card-title">${e.username}</h5>
								
								${editButton}
								

						</div>
							<p class="card-text" id = "tweetId-${e.tweet_id}">${e.tweets}</p>
							
							
							<div class = "d-flex  justify-content-between w-100">
							<div class = "d-flex align-items-center">
							
							
							<a class="btn btn-primary" onClick = "togglelike(${e.tweet_id})" id = "likebtn-${e.tweet_id}">${like}</a>
							
							<p class = "m-0 ms-4" id = "likes-${e.tweet_id}" > </P>
							
							
							
							</div>
							${deleteButton}
							 </div>
							
							    

						</div>
					</div>
				
				`
				)

			});






		}


	})

}


function getLike(tweetid) {


	$.ajax({
		type: 'GET',
		url: `/likes/tweets/${tweetid}`
	}).done(function(data) {

		$(`#likes-${tweetid}`).text(
			`${data[0].count} likes`
		)

	});

}




$("#postTweet").click(function() {
	let text

	text = $("#tweetwriten").val();


	let payload = {
		tweets: text,
		user_id: userid,

	}

	console.log(payload)
	$.ajax({
		type: "POST",
		url: '/tweets',
		contentType: "application/json",
		data: JSON.stringify(payload)
	}).done(function(data) {
		console.log(data)
		loadTweets();
		$("#tweetwriten").val("");
	})



})

function tweetDelete(id) {

	$.ajax({
		type: 'DELETE',
		url: `/tweets/${id}`

	}).done(function(data) {
		loadTweets();
	})

}

function editTweet(tid, uid) {

	$("#tweetedit").val($(`#tweetId-${tid}`).html());



	$("#savemodel").click(function() {

		let text = $("#tweetedit").val();

		let payload = {
			tweets: text
		}


		$.ajax({
			type: 'PUT',
			url: `/tweets/${tid}`,
			data: JSON.stringify(payload),
			contentType: "application/json",



		}).done(function(data) {
			loadTweets();
		})

	})

}

function togglelike(tid) {

	console.log("toogle liek is colled", tid)



	if ($(`#likebtn-${tid}`).html() == "Like") {


		$.ajax({
			type: 'POST',
			url: `/likes/${userid}/${tid}`
		}).done(function(data) {


			$(`#likebtn-${tid}`).html("Liked")

			getLike(tid);



		});


	} else {

		$.ajax({
			type: 'DELETE',
			url: `/likes/${userid}/${tid}`
		}).done(function(data) {


			$(`#likebtn-${tid}`).html("Like")
			getLike(tid);


		});

	}


}




