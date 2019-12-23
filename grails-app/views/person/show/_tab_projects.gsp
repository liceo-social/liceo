<div class="tab-pane fade show active card-info" role="tabpanel" id="custom-tabs-one-projects" role="tabpanel" aria-labelledby="custom-tabs-one-projects-tab">
    <div class="card-body">
        <div class="card card-primary">
            <div class="card-header">
               <h3 class="card-title">Proyectos</h3>
            </div>
            <div class="card-body">
                <f:table collection="${person?.projects}" properties="name"/>
            </div>
        </div>
    </div>
</div>