<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Items</h2>
        <a href="<?php echo e(route('banners.create')); ?>" class="btn btn-primary">
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
            <?php $__empty_1 = true; $__currentLoopData = $banners; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $banner): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <tr>
                    <td><?php echo e($banner->id); ?></td>

                    <td>
                        <img src="<?php echo e(asset('storage/' . $banner->image)); ?>" width="80" class="img-thumbnail">
                    </td>

                    <td><?php echo e($banner->title); ?></td>

                    <td>
                        <?php echo e(Str::limit($banner->description, 50)); ?>

                    </td>

                    <td>
                        <?php if($banner->status): ?>
                            <span class="badge bg-success">Active</span>
                        <?php else: ?>
                            <span class="badge bg-danger">Inactive</span>
                        <?php endif; ?>
                    </td>

                    <td><?php echo e($banner->created_at->format('d M Y')); ?></td>

                    <td>
                        <a href="<?php echo e(route('banners.show', $banner->id)); ?>" class="btn btn-info btn-sm">
                            View
                        </a>

                        <a href="<?php echo e(route('banners.edit', $banner->id)); ?>" class="btn btn-warning btn-sm">
                            Edit
                        </a>

                        <form action="<?php echo e(route('banners.destroy', $banner->id)); ?>" method="POST" class="d-inline">
                            <?php echo csrf_field(); ?>
                            <?php echo method_field('DELETE'); ?>

                            <button class="btn btn-danger btn-sm" onclick="return confirm('Delete this item?')">
                                Delete
                            </button>
                        </form>
                    </td>
                </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <tr>
                    <td colspan="7" class="text-center">
                        No records found.
                    </td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>
<?php /**PATH C:\Users\admin\Desktop\laravel\ecommerce-project\resources\views/admin/banner/index.blade.php ENDPATH**/ ?>