
//load plugins de fullcalendar sur la page stage.php





var container = $("<div>");
//listen the events of adding events by drag and poser
document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('stage');


    // initialize the calendar
    // -----------------------------------------------------------------

    var calendar = new FullCalendar.Calendar(calendarEl, {
        //ajuste the head
        header: {
            left: 'timeGridWeek', // buttons for switching between views
        },

        //add the plugins
        plugins: ['dayGrid', 'timeGrid', 'interaction'],

        //set View default
        defaultView: 'timeGridWeek',

        //set the period of the time
        slotDuration: '00:30:00',
        minTime: '08:00:00', // a start time
        maxTime: '22:00:00',// an end time

        //shut the allDay events
        allDaySlot: false,
        nowIndicator: true,

        //set editable
        editable: true,

        //set selectable
        selectable: true,
        selectHelper: true,
        eventOverlap:false,
        //set droppable
        droppable: true,
        dragScroll:true,
        //load the events from the database
        events: function (info, successCallback, failureCallback) {
            $.ajax({
                url: 'libs/load_stage.php',
                method: 'POST',
                error: function () {
                    alert("error");
                },
                success: function (context) {
                    var res=JSON.parse(context);
                    console.log(res);
                    var events = [];
                    var i = 0;

                    for (i in res) {
                        var timeStart = new Date(res[i].date +"T"+res[i].startTime);
                        var timeEnd = new Date(res[i].date +"T"+res[i].endTime);
                        events.push({
                            id:res[i].idStage,

                            start: timeStart,
                            end:timeEnd,
                            title:"stage   "+res[i].description,
                            description: res[i].description+" ",
                            color:"orange"
                        });
                    }
                    successCallback(events);
                }


            });


        },

        //delete the event by click the events
        eventClick: function (info) {
            if (confirm("Choisir cette formation?")) {
                var id = info.event.id;
                console.log(id);

                //  console.log(info.event.extendedProps.idUser);
                $.ajax({
                    url: "libs/select_stage.php",
                    type: "POST",
                    data: {id: id,

                    },
                    success: function () {
                        // calendar.fullCalendar('refetchEvents');
                        calendar.refetchEvents();
                        alert("select succesfully");
                    }
                })
            }


        },



    });
    calendar.render();
});
