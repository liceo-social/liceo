<div class="card card-info card-widget widget-user-2">
  <!-- Add the bg color to the header using any of the bg-* classes -->
  <div class="widget-user-header">
    <div class="widget-user-image">
    <g:img class="img-circle elevation-2" dir="images" file="default_user.jpg" />
    </div>
    <!-- /.widget-user-image -->
    <h3 class="widget-user-username">Persona: ${person?.name}</h3>
    <h5 class="widget-user-desc">Proyecto: ${project?.name ?: 'Sin proyecto'}</h5>
  </div>
</div>
