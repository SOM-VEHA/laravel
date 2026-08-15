<!DOCTYPE html>
<html lang="en">
	@include('admin.components.head')
	<body class="hold-transition sidebar-mini">
		<!-- Site wrapper -->
		<div class="wrapper">
			<!-- Navbar -->
			 @include('admin.components.navbar')
			<!-- /.navbar -->
			<!-- Main Sidebar Container -->
			@include('admin.components.logo')
			<!-- Content Wrapper. Contains page content -->
			@yield('content')
			<!-- /.content-wrapper -->
			@include('admin.components.footer')
		</div>
		<!-- ./wrapper -->
		<!-- jQuery -->
		<script src="{{asset('admin/plugins/jquery/jquery.min.js')}}"></script>
		<!-- Bootstrap 4 -->
		<script src="{{asset('admin/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
		<!-- AdminLTE App -->
		<script src="{{asset('admin/js/adminlte.min.js')}}"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="{{asset('admin/js/demo.js')}}"></script>
	</body>
</html>