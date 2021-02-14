<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/contact" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
</head>
<body>
	<div class="row">

		<!-- contact -->
		<div class="col-md-12">

			<div class="card mb-12" style="padding: 20px;">

				<h2>Contact me</h2>
				<form:form class="form-horizontal" role="form" id="formSubmit">
					<div class="messages"></div>

					<div class="controls">

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="form_name">Firstname *</label> 
									<input
										id="form_name" type="text" name="firstname" class="form-control"
										placeholder="Please enter your firstname *"
										required="required" data-error="Firstname is required.">
									<div class="help-block with-errors"></div>
								</div>

							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="form_lastname">Lastname *</label> <input
										id="form_lastname" type="text" name="surname"
										class="form-control"
										placeholder="Please enter your lastname *" required="required"
										data-error="Lastname is required.">
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="form_email">Email *</label> <input id="form_email"
										type="email" name="email" class="form-control"
										placeholder="Please enter your email *" required="required"
										data-error="Valid email is required.">
									<div class="help-block with-errors"></div>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="form_message">Message *</label>
									<textarea id="form_message" name="message" class="form-control"
										placeholder="Message for me *" rows="4" required="required"
										data-error="Please, leave us a message."></textarea>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="col-md-12">
								<input type="submit" class="btn btn-success btn-send"
									value="Send message" id="sendMessage">
							</div>
						</div>

					</div>

				</form:form>

			</div>




		</div>



	</div>
	
	<script>
	
		$('#sendMessage').click(function(e){
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			
			data["name"] = data["firstname"] + " " + data["surname"];
			
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					location.reload();
					alert("Send successfully");
				},
				error : function(error) {
					location.reload();
					alert("Send failed");
				}
			});
		});
		
	</script>
</body>
</html>