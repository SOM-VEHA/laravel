<nav id="sidebar" class="sidebar js-sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="index.html">
            <span class="align-middle">AdminKit</span>
        </a>

        <ul class="sidebar-nav">
            <li class="sidebar-header">
                Pages
            </li>
            <li class="sidebar-item {{ request()->routeIs('index') ? 'active' : '' }}">
                <a class="sidebar-link" href="{{route('index')}}">
                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                </a>
            </li>

            <li class="sidebar-item {{ request()->routeIs('slides.*') ? 'active' : '' }}">
                <a class="sidebar-link" href="{{ route('slides.index') }}">
                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Slide</span>
                </a>
            </li>

            <li class="sidebar-item {{ request()->routeIs('users.*') ? 'active' : '' }}">
                <a class="sidebar-link" href="{{route('users.index')}}">
                    <i class="align-middle" data-feather="user"></i> <span class="align-middle">User</span>
                </a>
            </li>

            <li class="sidebar-item {{ request()->routeIs('categories.*') ? 'active' : '' }}">
                <a class="sidebar-link" href="{{route('categories.index')}}">
                    <i class="align-middle" data-feather="user"></i> <span class="align-middle">Category</span>
                </a>
            </li>

            <li class="sidebar-item {{ request()->routeIs('categories.*') ? 'active' : '' }}">
                <a class="sidebar-link" href="{{route('categories.index')}}">
                    <i class="align-middle" data-feather="user"></i> <span class="align-middle">Movie</span>
                </a>
            </li>
        </ul>
    </div>
</nav>
