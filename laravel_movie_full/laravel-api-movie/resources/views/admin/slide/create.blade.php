@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')

    <main class="content">
        <div class="container-fluid p-0">

            <div class="mb-3">
                <a class="badge bg-dark text-white ms-2" href="{{route('slides.index')}}">
                    Back to Slide
                </a>
            </div>
            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Create Slide</h5>
                        </div>

                        <div class="card-body">
                            <form action="{{ route('slides.store') }}" method="POST" enctype="multipart/form-data">
                                <!-- Title -->
                                <div class="mb-3">
                                    <label class="form-label">Title</label>
                                    <input
                                        type="text"
                                        name="title"
                                        class="form-control"
                                        placeholder="Enter slide title"
                                    >
                                </div>

                                <!-- Image -->
                                <div class="mb-3">
                                    <label class="form-label">Image</label>
                                    <input
                                        type="file"
                                        name="image"
                                        class="form-control"
                                    >
                                </div>

                                <!-- Description -->
                                <div class="mb-3">
                                    <label class="form-label">Description</label>
                                    <textarea
                                        name="description"
                                        class="form-control"
                                        rows="4"
                                        placeholder="Enter description"
                                    ></textarea>
                                </div>

                                <!-- Status -->
                                <div class="mb-3">
                                    <label class="form-label">Status</label>

                                    <select name="is_active" class="form-select">
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                </div>

                                <!-- Submit -->
                                <button type="submit" class="btn btn-danger px-4">
                                    Create Slide
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>

@endsection

<script src="{{ asset('js/app.js') }}"></script>


