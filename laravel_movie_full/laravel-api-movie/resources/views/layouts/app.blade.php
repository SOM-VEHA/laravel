<!DOCTYPE html>
<html lang="en">
@include('components.head')
<body>
<div class="wrapper">
    @include('components.sidebar')
    <div class="main">
        @include('components.navbar')
        @yield('content')
        @include('components.footer')
    </div>
</div>
</body>
</html>
