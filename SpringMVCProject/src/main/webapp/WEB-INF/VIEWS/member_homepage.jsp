<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home-Librarian</title>
</head>
<style>
.sidebar-container {
	position: fixed;
	width: 220px;
	height: 100%;
	left: 0;
	overflow-x: hidden;
	overflow-y: auto;
	background: #1a1a1a;
	color: #fff;
}

.content-container {
	padding-top: 20px;
}

.sidebar-logo {
	padding: 10px 15px 10px 30px;
	font-size: 20px;
	background-color: #2574A9;
}

.sidebar-navigation {
	padding: 0;
	margin: 0;
	list-style-type: none;
	position: relative;
}

.sidebar-navigation li {
	background-color: transparent;
	position: relative;
	display: inline-block;
	width: 100%;
	line-height: 20px;
}

.sidebar-navigation li a {
	padding: 10px 15px 10px 30px;
	display: block;
	color: #fff;
}

.sidebar-navigation li .fa {
	margin-right: 10px;
}

.sidebar-navigation li a:active, .sidebar-navigation li a:hover,
	.sidebar-navigation li a:focus {
	text-decoration: none;
	outline: none;
}

.sidebar-navigation li::before {
	background-color: #2574A9;
	position: absolute;
	content: '';
	height: 100%;
	left: 0;
	top: 0;
	-webkit-transition: width 0.2s ease-in;
	transition: width 0.2s ease-in;
	width: 3px;
	z-index: -1;
}

.sidebar-navigation li:hover::before {
	width: 100%;
}

.sidebar-navigation .header {
	font-size: 12px;
	text-transform: uppercase;
	background-color: #151515;
	padding: 10px 15px 10px 30px;
}

.sidebar-navigation .header::before {
	background-color: transparent;
}

.content-container {
	padding-left: 220px;
}
</style>
<body>
	<div class="sidebar-container">
		<div class="sidebar-logo">Library Management System</div>
		<ul class="sidebar-navigation">
			<li class="header">Navigation</li>
			<li onclick=viewBooks()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> View Books
			</a></li>
			<li onclick=viewBorrowedeBooks()><a> <i
					class="fa fa-info-circle" aria-hidden="true"></i> View Borrowed
					Books
			</a></li>
			<li onclick=viewDetails()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> View Personal Details
			</a></li>
			<li onclick=changePassword()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> Change Password
			</a></li>
		</ul>
	</div>

	<div class="content-container">
		<div class="jumbator">
			<div class="container">
				<h2>Welcome to Library Management System</h2>
			</div>
		</div>

		<!-- ==================================Home Page============================ -->

		<div class="row" id="homepage">
			<div class="col-10">
				<fieldset>
					<legend>Home Page</legend>
					<form class="col-lg-12" action="/SpringMVCProject/welcome"
						method="post">
						<li class="navbar-brand">Member Home Page</li>
					</form>
				</fieldset>
			</div>
		</div>



		<!-- ================================== View books============================ -->

		<div class="row" id="viewbooks">
			<div class="col-10">
				<fieldset>
					<legend>Books</legend>
					<form class="col-lg-12"
						action="/SpringMVCProject/member_homepage/viewBooks" method="post">
						<div class="form-group">
							<input type="radio" id="title" name="viewBy" value="title"
								onclick="viewBooksByTitle()"> <label for="title">Title</label><br>
							<input type="radio" id="author" name="viewBy" value="author"
								onclick="viewBooksByAuthor()"> <label for="author">Author</label><br>
							<input type="radio" id="accessionNo" name="viewBy"
								value="accessionNumber" onclick="viewBooksByAccessionNo()">
							<label for="accessionNumber">Accession No</label><br>
						</div>
						<div class="form-group" id="Title">
							<label for="title">Title</label> <input type="text" name="title"
								class="form-control" placeholder="Enter Title" />
						</div>
						<div class="form-group" id="Author">
							<label for="author">Author</label> <input type="text"
								name="author" class="form-control" placeholder="Enter Author" />
						</div>
						<div class="form-group" id="AccessionNo">
							<label for="accessionNo">Accession No</label> <input type="text"
								name="accessionNumber" class="form-control"
								placeholder="Enter Accession No" />
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-success" value="View" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>

		<!-- ================================== View Borrowed books============================ -->

		<div class="row" id="borrowedbooks">
			<div class="col-10">
				<fieldset>
					<legend>Borrowed Books</legend>
					<table class="col-lg-12 table">
						<tr>
							<th>Accession No</th>
							<th>Book Title</th>
							<th>Book Author</th>
							<th>Book Status</th>
						</tr>
						<c:forEach var="book" items="${ booksBorrowed }">
							<tr>
								<td>Accession No</td>
								<td>Book Title</td>
								<td>Book Title</td>
								<td>Book Title</td>
							</tr>
						</c:forEach>
					</table>
				</fieldset>
			</div>
		</div>

		<!-- ================================== View Details============================ -->

		<div class="row" id="personaldetails">
			<div class="col-10">
				<fieldset>
					<legend>Personal Details</legend>
					<table class="col-lg-12 table">
						<tr>
							<th>Member Id</th>
							<th>Member Name</th>
							<th>Member Address</th>
							<th>Member Type</th>
						</tr>
						<tr>
							<td>Member Id</td>
							<td>Member Name</td>
							<td>Member Address</td>
							<td>Member Type</td>
						</tr>
					</table>
				</fieldset>
			</div>
		</div>


		<!-- ================================== Change Password ============================ -->

		<div class="row" id="changepassword">
			<div class="col-10">
				<fieldset>
					<legend>Change Password</legend>
					<form class="col-lg-12"
						action="/SpringMVCProject/changepassword" method="post">
						<div class="form-group">
							<label for="memberId">Member Id</label> <input type="number"
								name="memberId" class="form-control"
								placeholder="Enter Member Id" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								name="password" class="form-control"
								placeholder="Enter Password" />
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-success"
								value="Change" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>





		<!-- ====================================================================================== -->

	</div>
	</div>
	</div>
	<div class="container"></div>


	<script>
	
	document.getElementById("changepassword").style.display="none";
	document.getElementById("viewbooks").style.display="none";
	document.getElementById("personaldetails").style.display="none";
	document.getElementById("borrowedbooks").style.display="none";
	document.getElementById("Title").style.display="none";
	document.getElementById("Author").style.display="none";
	document.getElementById("AccessionNo").style.display="none";
	
	
	function viewBooks(){
		document.getElementById("changepassword").style.display="none";
		document.getElementById("personaldetails").style.display="none";
		document.getElementById("borrowedbooks").style.display="none";
		document.getElementById("viewbooks").style.display="block";
	}
	function viewBorrowedeBooks(){
		document.getElementById("changepassword").style.display="none";
		document.getElementById("personaldetails").style.display="none";
		document.getElementById("borrowedbooks").style.display="block";
		document.getElementById("viewbooks").style.display="none";
	}
	function viewDetails(){
		document.getElementById("changepassword").style.display="none";
		document.getElementById("personaldetails").style.display="block";
		document.getElementById("borrowedbooks").style.display="none";
		document.getElementById("viewbooks").style.display="none";
	}
	function changePassword(){
		document.getElementById("changepassword").style.display="block";
		document.getElementById("personaldetails").style.display="none";
		document.getElementById("borrowedbooks").style.display="none";
		document.getElementById("viewbooks").style.display="none";
	}
	
	function viewBooksByTitle(){
		document.getElementById("Title").style.display="block";
		document.getElementById("Author").style.display="none";
		document.getElementById("AccessionNo").style.display="none";
	}
	function viewBooksByAuthor(){
		document.getElementById("Title").style.display="none";
		document.getElementById("Author").style.display="block";
		document.getElementById("AccessionNo").style.display="none";
	}
	function viewBooksByAccessionNo(){
		document.getElementById("Title").style.display="none";
		document.getElementById("Author").style.display="none";
		document.getElementById("AccessionNo").style.display="block";
	}
	
	
	</script>

</body>
</html>