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

background: linear-gradient(-180deg, rgba(255,255,255,0.50) 0%, rgba(0,0,0,0.50) 100%);
</style>
<body>
	<div class="sidebar-container">
		<div class="sidebar-logo">Library Management System</div>
		<ul class="sidebar-navigation">
			<li class="header">Navigation</li>
			<li onclick=homePage() ><a > <i class="fa fa-info-circle"
					aria-hidden="true"></i> Home
			</a></li>
			<li onclick=addBook() ><a > <i class="fa fa-info-circle"
					aria-hidden="true"></i> Add Book
			</a></li>
			<li onclick=updateBook()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> Update Book
			</a></li>
			<li onclick=deleteBook()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> Delete Book
			</a></li>
			<li onclick=viewBooks()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> View Book
			</a></li>
			<li onclick=issueBook()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> Issue Book
			</a></li>
			<li onclick=returnBook()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> Return Book
			</a></li>
			<li onclick=addMember()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> Add Member
			</a></li>
			<li onclick=updateMember()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> Update Member
			</a></li>
			<li onclick=deleteMember()><a> <i class="fa fa-info-circle"
					aria-hidden="true"></i> Delete Member
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
					<form class="col-lg-12" action="/SpringMVCProject/homepage_librarian"
						method="post">
						<li class="navbar-brand">You have logged in as librarian</li>
					</form>
				</fieldset>
			</div>
		</div>

		<!-- ================================== Add book============================ -->

		<div class="row" id="addbook">
			<div class="col-10">
				<fieldset>
					<legend>Add Book</legend>
					<form class="col-lg-12" action="/SpringMVCProject/addBook"
						method="post">
						<div class="form-group">
							<label for="accessionNumber">Accession No</label> <input type="text"
								name="accessionNumber" class="form-control"
								placeholder="Enter Accession No" />
						</div>
						<div class="form-group">
							<label for="title">Book Title</label> <input type="text"
								name="title" class="form-control"
								placeholder="Enter Book Title" />
						</div>
						<div class="form-group">
							<label for="author">Book Author</label> <input type="text"
								name="author" class="form-control"
								placeholder="Enter Book Author" />
						</div>
						<div class="form-group">
							<label for="status">Book Status</label> <select
								class="status" name="status">
								<option value="available">Available</option>
								<option value="borrowed">Borrowed</option>
							</select>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-success" value="Submit" />
							<input type="button" class="btn btn-lg btn-danger" value="Cancel" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>

		<!-- ================================== Update book============================ -->

		<div class="row" id="updatebook">
			<div class="col-10">
				<fieldset>
					<legend>Update Book</legend>
					<form class="col-lg-12"
						action="/SpringMVCProject/updateBook" method="post">
						<div class="form-group">
							<label for="accessionNumber">Accession No</label> <input type="text"
								name="accessionNumber" class="form-control"
								placeholder="Enter Accession No" />
						</div>
						<div class="form-group">
							<label for="status">Book Status</label> <select
								class="form-control" name="status">
								<option value="available">Available</option>
								<option value="borrowed">Borrowed</option>
							</select>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-success"
								value="Update" /> <input type="button"
								class="btn btn-lg btn-danger" value="Cancel" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>

		<!-- ================================== Delete book============================ -->

		<div class="row" id="deletebook">
			<div class="col-10">
				<fieldset>
					<legend>Delete Book</legend>
					<form class="col-lg-12"
						action="/SpringMVCProject/deleteBook" method="post">
						<div class="form-group">
							<label for="accessionNumber">Accession No</label> <input type="text"
								name="accessionNumber" class="form-control"
								placeholder="Enter Accession No" />
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-danger" value="Delete" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>


		<!-- ================================== View books============================ -->

		<div class="row" id="viewbooks">
			<div class="col-10">
				<fieldset>
					<legend>Books</legend>

					<table class="col-lg-12 table">
						<tr>
							<th>Accession No</th>
							<th>Book Title</th>
							<th>Book Author</th>
							<th>Book Status</th>
						</tr>
						<c:forEach var="book" items="${listBooks}">
							<tr>
								<td>${ book.bookAccessionNumber }</td>
								<td>${ book.bookTitle }</td>
								<td>${ book.bookAuthor }</td>
								<td>${ book.bookStatus }</td>
							</tr>
						</c:forEach>
					</table>

				</fieldset>
			</div>
		</div>

		<!-- ================================== Issue book============================ -->

		<div class="row" id="issuebook">
			<div class="col-10">
				<fieldset>
					<legend>Issue Book</legend>
					<form class="col-lg-12" action="/SpringMVCProject/issueBook"
						method="post">
						<div class="form-group">
							<label for="memberId">Member Id</label> <input type="number"
								name="memberId" class="form-control"
								placeholder="Enter Member Id" />
						</div>
						<div class="form-group">
							<label for="accessionNumber">Accession No</label> <input type="text"
								name="accessionNumber" class="form-control"
								placeholder="Enter Accession No" />
						</div>
						<div class="form-group">
							<label for="dueDate">Due Date</label> <input type="date"
								name="dueDate" class="form-control"
								placeholder="Enter Return Date" />
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-success" value="Issue" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>

		<!-- ================================== Return book============================ -->

		<div class="row" id="returnbook">
			<div class="col-10">
				<fieldset>
					<legend>Return Book</legend>
					<form class="col-lg-12"
						action="/SpringMVCProject/returnBook" method="post">
						<div class="form-group">
							<label for="memberId">Member Id</label> <input type="number"
								name="memberId" class="form-control"
								placeholder="Enter Member Id" />
						</div>
						<div class="form-group">
							<label for="accessionNumber">Accession No</label> <input type="text"
								name="accessionNumber" class="form-control"
								placeholder="Enter Accession No" />
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-success"
								value="Return" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>

		<!-- ================================== Add member============================ -->

		<div class="row" id="addmember">
			<div class="col-10">
				<fieldset>
					<legend>Add Member</legend>
					<form class="col-lg-12" action="/SpringMVCProject/addMember"
						method="post">
						<div class="form-group">
							<label for="memberName">Member Name</label> <input type="text"
								name="memberName" class="form-control"
								placeholder="Enter Member Name" />
						</div>
						<div class="form-group">
							<label for="memberAddress">Member Address</label> <input
								type="text" name="memberAddress" class="form-control"
								placeholder="Enter Member Address" />
						</div>
						<div class="form-group">
							<label for="memberType">Member Type</label> <select
								class="form-control" name="memberType">
								<option value="student">Student</option>
								<option value="staff">Staff</option>
							</select>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								name="password" class="form-control"
								placeholder="Enter Password" />
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-success" value="Add" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>


		<!-- ================================== Update member============================ -->

		<div class="row" id="updatemember">
			<div class="col-10">
				<fieldset>
					<legend>Update Member</legend>
					<form class="col-lg-12"
						action="/SpringMVCProject/updateMember" method="post">
						<div class="form-group">
							<label for="memberId">Member Id</label> <input type="number"
								name="memberId" class="form-control"
								placeholder="Enter Member Id" />
						</div>
						
						<div class="form-group">
							<label for="memberAddress">Member Address</label> <input
								type="text" name="memberAddress" class="form-control"
								placeholder="Enter Member Address" />
						</div>
						
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-success"
								value="Update" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>


		<!-- ================================== Delete member============================ -->

		<div class="row" id="deletemember">
			<div class="col-10">
				<fieldset>
					<legend>Delete Member</legend>
					<form class="col-lg-12"
						action="/SpringMVCProject/deleteMember" method="post">
						<div class="form-group">
							<label for="memberId">Accession No</label> <input type="number"
								name="memberId" class="form-control"
								placeholder="Enter Member Id" />
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-lg btn-danger" value="Delete" />
						</div>
					</form>
				</fieldset>
			</div>
		</div>

		<!-- ====================================================================================== -->

	</div>
	<div class="container"></div>


	<script>
		document.getElementById("deletebook").style.display = "none";
		document.getElementById("updatebook").style.display = "none";
		document.getElementById("addbook").style.display = "none";
		document.getElementById("issuebook").style.display = "none";
		document.getElementById("returnbook").style.display = "none";
		document.getElementById("addmember").style.display = "none";
		document.getElementById("updatemember").style.display = "none";
		document.getElementById("deletemember").style.display = "none";
		document.getElementById("viewbooks").style.display = "none";

		function homePage() {
			document.getElementById("homepage").style.display = "block";
			document.getElementById("deletebook").style.display = "none";
			document.getElementById("updatebook").style.display = "none";
			document.getElementById("addbook").style.display = "none";
			document.getElementById("issuebook").style.display = "none";
			document.getElementById("returnbook").style.display = "none";
			document.getElementById("addmember").style.display = "none";
			document.getElementById("updatemember").style.display = "none";
			document.getElementById("deletemember").style.display = "none";
			document.getElementById("viewbooks").style.display = "none";
		}
		function addBook() {
			document.getElementById("homepage").style.display = "none";
			document.getElementById("deletebook").style.display = "none";
			document.getElementById("updatebook").style.display = "none";
			document.getElementById("addbook").style.display = "block";
			document.getElementById("issuebook").style.display = "none";
			document.getElementById("returnbook").style.display = "none";
			document.getElementById("addmember").style.display = "none";
			document.getElementById("updatemember").style.display = "none";
			document.getElementById("deletemember").style.display = "none";
			document.getElementById("viewbooks").style.display = "none";
		}
		function updateBook() {
			document.getElementById("homepage").style.display = "none";
			document.getElementById("deletebook").style.display = "none";
			document.getElementById("updatebook").style.display = "block";
			document.getElementById("addbook").style.display = "none";
			document.getElementById("issuebook").style.display = "none";
			document.getElementById("returnbook").style.display = "none";
			document.getElementById("addmember").style.display = "none";
			document.getElementById("updatemember").style.display = "none";
			document.getElementById("deletemember").style.display = "none";
			document.getElementById("viewbooks").style.display = "none";
		}
		function deleteBook() {
			document.getElementById("homepage").style.display = "none";
			document.getElementById("deletebook").style.display = "block";
			document.getElementById("updatebook").style.display = "none";
			document.getElementById("addbook").style.display = "none";
			document.getElementById("issuebook").style.display = "none";
			document.getElementById("returnbook").style.display = "none";
			document.getElementById("addmember").style.display = "none";
			document.getElementById("updatemember").style.display = "none";
			document.getElementById("deletemember").style.display = "none";
			document.getElementById("viewbooks").style.display = "none";
		}
		function viewBooks() {
			document.getElementById("homepage").style.display = "none";
			document.getElementById("deletebook").style.display = "none";
			document.getElementById("updatebook").style.display = "none";
			document.getElementById("addbook").style.display = "none";
			document.getElementById("issuebook").style.display = "none";
			document.getElementById("returnbook").style.display = "none";
			document.getElementById("addmember").style.display = "none";
			document.getElementById("updatemember").style.display = "none";
			document.getElementById("deletemember").style.display = "none";
			document.getElementById("viewbooks").style.display = "block";
		}
		function issueBook() {
			document.getElementById("homepage").style.display = "none";
			document.getElementById("deletebook").style.display = "none";
			document.getElementById("updatebook").style.display = "none";
			document.getElementById("addbook").style.display = "none";
			document.getElementById("issuebook").style.display = "block";
			document.getElementById("returnbook").style.display = "none";
			document.getElementById("addmember").style.display = "none";
			document.getElementById("updatemember").style.display = "none";
			document.getElementById("deletemember").style.display = "none";
			document.getElementById("viewbooks").style.display = "none";
		}
		function returnBook() {
			document.getElementById("homepage").style.display = "none";
			document.getElementById("deletebook").style.display = "none";
			document.getElementById("updatebook").style.display = "none";
			document.getElementById("addbook").style.display = "none";
			document.getElementById("issuebook").style.display = "none";
			document.getElementById("returnbook").style.display = "block";
			document.getElementById("addmember").style.display = "none";
			document.getElementById("updatemember").style.display = "none";
			document.getElementById("deletemember").style.display = "none";
			document.getElementById("viewbooks").style.display = "none";
		}
		function addMember() {
			document.getElementById("homepage").style.display = "none";
			document.getElementById("deletebook").style.display = "none";
			document.getElementById("updatebook").style.display = "none";
			document.getElementById("addbook").style.display = "none";
			document.getElementById("issuebook").style.display = "none";
			document.getElementById("returnbook").style.display = "none";
			document.getElementById("addmember").style.display = "block";
			document.getElementById("updatemember").style.display = "none";
			document.getElementById("deletemember").style.display = "none";
			document.getElementById("viewbooks").style.display = "none";
		}
		function updateMember() {
			document.getElementById("homepage").style.display = "none";
			document.getElementById("deletebook").style.display = "none";
			document.getElementById("updatebook").style.display = "none";
			document.getElementById("addbook").style.display = "none";
			document.getElementById("issuebook").style.display = "none";
			document.getElementById("returnbook").style.display = "none";
			document.getElementById("addmember").style.display = "none";
			document.getElementById("updatemember").style.display = "block";
			document.getElementById("deletemember").style.display = "none";
			document.getElementById("viewbooks").style.display = "none";
		}
		function deleteMember() {
			document.getElementById("homepage").style.display = "none";
			document.getElementById("deletebook").style.display = "none";
			document.getElementById("updatebook").style.display = "none";
			document.getElementById("addbook").style.display = "none";
			document.getElementById("issuebook").style.display = "none";
			document.getElementById("returnbook").style.display = "none";
			document.getElementById("addmember").style.display = "none";
			document.getElementById("updatemember").style.display = "none";
			document.getElementById("deletemember").style.display = "block";
			document.getElementById("viewbooks").style.display = "none";
		}
	</script>
</body>
</html>