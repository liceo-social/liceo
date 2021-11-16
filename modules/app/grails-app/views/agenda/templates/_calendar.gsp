<div class="row">
    <div class="col-12">
        <div class="card card-primary">
            <div class="card-body">
                <div id="calendar"></div>
            </div>
        </div>
    </div>
</div>
<g:javascript>
    $(() => {
        var eventLink = '<g:createLink
            controller="agenda"
            action="events"
            params="[
                onlyMines: filter.onlyMines,
                selectedPeople: filter.selectedPeople,
                selectedProjects: filter.selectedProjects,
                selectedProcessTypes: filter.selectedProcessTypes
            ]" />'
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'timeGridWeek',
            initialDate: '${g.formatDate(format:"yyyy-MM-dd", date: new Date())}',
            locale: 'es',
            firstDay: 1,
            height: 775,
            fixedWeekCount: false,
            headerToolbar: {
                start: 'prev,next today',
                center: 'title',
                end: 'timeGridWeek dayGridMonth'
            },
            buttonText: {
                today:    'Hoy',
                month:    'mes',
                week:     'semana',
                day:      'dia',
                list:     'lista'
            },
            eventDidMount: function(info) {
                if (info.event.extendedProps) {
                    $(info.el).tooltip({ title: info.event.extendedProps.description, delay: 1000 });
                }
            },
            eventClick: function(info) {
                if (info.event.extendedProps) {
                    window.location.href = info.event.extendedProps.url;
                }
            },
            events: (info, successCallback, failureCallback) => {
                const helper    = new FullCalendar.Calendar()
                const dateOpts  = {month: 'numeric', year: 'numeric', day: 'numeric'}
                const startDate = helper.formatDate(info.start, dateOpts);
                const endDate   = helper.formatDate(info.end, dateOpts);

                $.get(eventLink, { start: startDate, end: endDate })
                    .done((data) => successCallback(data.events))
                    .fail((err) => console.log(err));
            }
        });

        calendar.render();
    });
</g:javascript>
