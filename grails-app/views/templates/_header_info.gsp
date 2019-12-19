<div class="card card-widget widget-user-2">
  <!-- Add the bg color to the header using any of the bg-* classes -->
  <div class="widget-user-header bg-warning">
    <div class="widget-user-image">
    <g:img class="img-circle elevation-2" dir="images" file="default_user.jpg" />
    </div>
    <!-- /.widget-user-image -->
    <h3 class="widget-user-username">${person?.name}</h3>
    <h5 class="widget-user-desc">${project?.name ?: 'Sin proyecto'}</h5>
  </div>
  <div class="card-footer p-0">

    </ul>
  </div>
</div>