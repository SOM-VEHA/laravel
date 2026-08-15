@extends('admin.layouts.app')
@section('content')
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid my-2">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Create User</h1>
				</div>
				<div class="col-sm-6 text-right">
					<a href="users.html" class="btn btn-primary">Back</a>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<!-- Default box -->
		<div class="container-fluid">
			@if (session('error'))
			<div class="alert alert-danger">
				{{ session('error') }}
			</div>
			@endif
			<form action="{{ route('users.store') }}" method="post" enctype="multipart/form-data">
				@csrf
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<div class="mb-3">
									<label for="name">Name</label>
									<input type="text" name="name" class="form-control" placeholder="Name">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<label for="email">Email</label>
									<input type="text" name="email" id="email" class="form-control" placeholder="Email">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<label for="phone">Phone</label>
									<input type="text" name="phone" id="phone" class="form-control" placeholder="Phone">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<label for="password">Password</label>
									<input type="password" name="password" id="password" class="form-control" placeholder="Password">
								</div>
							</div>
							<div class="col-md-12">
								<div class="mb-3">
									<label for="phone">Address</label>
									<textarea name="address" id="address" class="form-control" cols="30" rows="5"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="pb-5 pt-3">
					<button type="submit" class="btn btn-primary">Create</button>
					<a href="{{ route('users.index') }}" class="btn btn-outline-dark ml-3">Cancel</a>
				</div>
			</form>
		</div>
	</section>
</div>
@endsection