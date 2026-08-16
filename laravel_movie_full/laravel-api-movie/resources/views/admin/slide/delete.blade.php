<div
    class="modal fade"
    id="slideDelete{{ $slide->id }}"
    tabindex="-1"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    Delete Movie
                </h5>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete
                <strong>{{ $slide->title }}</strong>?
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal">
                    Cancel
                </button>
                <form
                    action="{{ route('slides.destroy', $slide->id) }}" method="POST">
                    @csrf
                    @method('DELETE')
                    <input
                        type="hidden"
                        name="page"
                        value="{{ $slides->currentPage() }}"
                    >
                    <button
                        type="submit"
                        class="btn btn-danger">
                        Confirm Delete
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
