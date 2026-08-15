<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Items</h2>
        <a href="{{ route('banners.create') }}" class="btn btn-primary">
            Add Banner
        </a>
    </div>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Title</th>
                <th>Description</th>
                <th>Status</th>
                <th>Created At</th>
                <th width="180">Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($banners as $banner)
                <tr>
                    <td>{{ $banner->id }}</td>

                    <td>
                        <img src="{{ asset('storage/' . $banner->image) }}" width="80" class="img-thumbnail">
                    </td>

                    <td>{{ $banner->title }}</td>

                    <td>
                        {{ Str::limit($banner->description, 50) }}
                    </td>

                    <td>
                        @if($banner->status)
                            <span class="badge bg-success">Active</span>
                        @else
                            <span class="badge bg-danger">Inactive</span>
                        @endif
                    </td>

                    <td>{{ $banner->created_at->format('d M Y') }}</td>

                    <td>
                        <a href="{{ route('banners.show', $banner->id) }}" class="btn btn-info btn-sm">
                            View
                        </a>

                        <a href="{{ route('banners.edit', $banner->id) }}" class="btn btn-warning btn-sm">
                            Edit
                        </a>

                        <form action="{{ route('banners.destroy', $banner->id) }}" method="POST" class="d-inline">
                            @csrf
                            @method('DELETE')

                            <button class="btn btn-danger btn-sm" onclick="return confirm('Delete this item?')">
                                Delete
                            </button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="7" class="text-center">
                        No records found.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
