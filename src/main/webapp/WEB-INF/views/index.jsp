<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Keep-Board</title>
</head>

<body>
	<!-- Create a form which will have text boxes for Note title, content and status along with a Add 
		 button. Handle errors like empty fields.  (Use dropdown-list for NoteStatus) -->

	<div class="container">
		<div class="jumbotron" style="margin: 20px 0px">
			<h2 class="text-center">Notes CRUD APP</h2>
		</div>
		<c:if test="${not empty error}">
			<p style="color: red">Error :  ${error}</p>
		</c:if>
		<!-- modelAttribute="Notes" -->
		<form method="POST" action="add">
			<div class="form-group">
				<label for="noteId">Note Id :</label> <input type="number"
					class="form-control" id="noteId" placeholder="Enter Note Id"
					value="0" name="noteId">
			</div>
			<div class="form-group">
				<label for="noteTitle">NoteTitle</label> <input type="text"
					class="form-control" id="noteTitle" placeholder="Enter Note Title"
					name="noteTitle">
			</div>
			<div class="form-group">
				<label for="noteContent">Note Content</label> <input type="text"
					name="noteContent" class="form-control" id="noteContent"
					placeholder="Enter Note Content">
			</div>
			<div class="form-group">
				<label for="noteStatus">Note Status</label> 
				<select class="form-control" id="noteStatus" name="noteStatus">
					<option class="dropdown-item" value="Active" selected>Active</option>
					<option class="dropdown-item" value="InActive">InActive</option>
					<option class="dropdown-item" value="NotStarted">NotStarted</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		

	<!-- display all existing notes in a tabular structure with Title,Content,Status, Created Date and Action -->

		<div style="margin-top: 1em; text-align: center">
			<h2>All Notes Information</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Notes ID</th>
						<th scope="col">Notes Title</th>
						<th scope="col">Notes Content</th>
						<th scope="col">Notes Status</th>
						<th scope="col">Created Date</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody id='table-body'>
					<c:forEach items="${notesList}" var="notesobj">
						<tr>
							<td>${notesobj.noteId}</td>
							<td>${notesobj.noteTitle}</td>
							<td>${notesobj.noteContent}</td>
							<td>${notesobj.noteStatus}</td>
							<td>${notesobj.createdAt}</td>
							<td>
								<form action="delete" method="post">
									<input type="hidden" id="noteId" name="noteId"
										value="${notesobj.noteId}" />
									<button type="submit" class="btn btn-primary">Delete</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<style>
		.jumbotron {
			padding: 1rem 2rem;
		}
	</style>
</body>

</html>