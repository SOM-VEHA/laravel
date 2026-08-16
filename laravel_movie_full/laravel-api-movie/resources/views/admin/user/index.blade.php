
@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')

    <main class="content">
        <div class="container-fluid p-0">
            <div class="d-flex justify-content-between align-items-center mb-5">
                <h1 class="h3 mb-0">Blank Page</h1>
                <a href="{{ route('slides.create') }}" class="btn btn-danger px-4 py-2">
                    Create Slide
                </a>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Empty card</h5>
                        </div>
                        <div class="card-body">
                            @if(session('success'))
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    {{ session('success') }}

                                    <button type="button"
                                            class="btn-close"
                                            data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                </div>
                            @endif
                            <!-- Search -->
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="mb-0">Movies</h5>

                                <form class="d-flex" style="width: 300px;">
                                    <input
                                        type="text"
                                        class="form-control me-2"
                                        placeholder="Search movie..."
                                    >
                                    <button type="submit" class="btn btn-primary">
                                        Search
                                    </button>
                                </form>
                            </div>


                            <!-- Table -->
                            <table class="table  table-hover align-middle">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Active</th>
                                    <th>Action</th>
                                </tr>
                                </thead>

                                <tbody>
                                @foreach ($users as $user)
                                    <tr>
                                        <td class="text-start">{{ $user->id }}</td>

                                        <td class="text-start">
                                            {{ $user->name }}
                                        </td>

                                        <td class="text-start">
                                            {{ $user->email }}
                                        </td>

                                        <td class="text-start">
                                            {{ $user->phone }}
                                        </td>

                                        <td class="text-start">
                                            {{ $user->role->name }}
                                        </td>

                                        <td class="text-start" style="white-space: nowrap;">
                                            <a
                                                href="{{ route('slides.show', $user->id) }}"
                                                class="btn btn-sm btn-warning">
                                                View {{ $user->id }}
                                            </a>
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-danger"
                                                data-bs-toggle="modal"
                                                data-bs-target="#slideDelete{{ $user->id }}">
                                                Delete
                                            </button>

                                        </td>
                                        @include('admin.user.delete')
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                            <!-- Pagination -->
                                <div class="d-flex gap-1">

                                    {{-- Previous --}}
                                    @if ($users->onFirstPage())
                                        <button class="btn btn-primary" disabled>
                                            Previous
                                        </button>
                                    @else
                                        <a href="{{ $users->previousPageUrl() }}"
                                           class="btn btn-primary">
                                            Previous
                                        </a>
                                    @endif


                                    {{-- Page Numbers --}}
                                    @for ($page = 1; $page <= $users->lastPage(); $page++)

                                        @if ($page == $users->currentPage())

                                            <a href="{{ $users->url($page) }}"
                                               class="btn btn-primary">
                                                {{ $page }}
                                            </a>

                                        @else

                                            <a href="{{ $users->url($page) }}"
                                               class="btn btn-primary">
                                                {{ $page }}
                                            </a>

                                        @endif

                                    @endfor


                                    {{-- Next --}}
                                    @if ($users->hasMorePages())
                                        <a href="{{ $users->nextPageUrl() }}"
                                           class="btn btn-primary">
                                            Next
                                        </a>
                                    @else
                                        <button class="btn btn-primary" disabled>
                                            Next
                                        </button>
                                    @endif

                                </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>
@endsection
<script src="{{ asset('js/app.js') }}"></script>


