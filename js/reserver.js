

//load plugins de fullcalendar sur la page repair.php





var container = $("<div>");
var dragElement = $("<div class='fc-event' data-type=''>");
//listen the events of adding events by drag and poser
document.addEventListener('DOMContentLoaded', function() {

            var d = dragElement.clone()
                .html("reservation")
                .data("descirption","reserver")
            .data("date","2019-08-08")
            .data("start","08:00:00")
            .data("end","09:00:00");

            $("p").after(d);

    var Draggable = FullCalendarInteraction.Draggable;

    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');

    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
        itemSelector: '.fc-event',
        eventData: function(eventEl) {
            return {
                title: eventEl.innerText,

            };
        }
    });

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
                maxTime: '23:00:00',// an end time

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
                url: 'libs/load_event.php',
                method: 'POST',
                error: function () {
                    alert("error");
                },
                success: function (context) {
                    console.log(context);
                    var res=JSON.parse(context);
                    console.log(res);
                    var events = [];
                    var i = 0;

                    for (i in res) {
                            var timeStart = new Date(res[i].date +"T"+res[i].startTime);
                            var timeEnd = new Date(res[i].date +"T"+res[i].endTime);
                            events.push({
                                id:res[i].idRepair,
                                title:"reservation  "+res[i].description,
                                idUser: res[i].idUser,
                                start: timeStart,
                                end:timeEnd,
                                description: res[i].description+" ",
                                color:'lightblue',
                            });
                        }
                        successCallback(events);
                    }


            });


        },

        //delete the event by click the events
        eventClick: function (info) {
            if (confirm("Supprimer la réservation?")) {
                var id = info.event.id;
                console.log(id);
                var idUser=info.event.extendedProps.idUser;
              //  console.log(info.event.extendedProps.idUser);
                    $.ajax({
                        url: "libs//delete_event.php",
                        type: "POST",
                        data: {id: id,
                            idUser:idUser
                        },
                        error: function () {
                            alert("fail to delete this event ");
                        },
                        success: function () {
                            // calendar.fullCalendar('refetchEvents');
                            calendar.refetchEvents();

                        }
                    })
                }


        },

        //add the event by drop the event
        drop: function (info) {
           console.log(info);
           var time=info.dateStr;
            var date = time.substr(0,10 );
           // console.log(date);
            var timeStart=time.substr(11,8);
           //console.log(timeStart);

            var dateUse = new Date(info.date);
            var seconds =  60 * 60;
            dateUse.setSeconds(dateUse.getSeconds() + seconds);
            var timeEnd=[
                [dateUse.getHours(), dateUse.getMinutes(), dateUse.getSeconds()].join(':')
            ].join(' ').replace(/(?=\b\d\b)/g, '0');
   // console.log(timeEnd);
            $.ajax({
                url: "libs/add_event.php",
                type: "POST",
                data: {
                    date: date,
                    start:timeStart,
                    end:timeEnd,
                    description: "mon reservation"
                },
                error: function () {
                    alert("error");
                },
                success: function () {
                    alert("reservation added successfully ");

                   // calendar.refetchEvents();
                }
            })
        },
        eventResize: function(info) {
            var event = info["event"];
            var start = calendar.formatDate(event.start, {
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: false

            });
            var end = calendar.formatDate(event.end, {
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: false
            });
            console.log(start);
            console.log(end);
            $.ajax({
                url: 'libs/update_event.php',
                data: {
                    id: event.id,
                    start: start,
                    end: end
                },
                type: "POST",
                success: function (json) {
                    alert("update successfully ");
                    calendar.refetchEvents();
                }
            })
        }
        });
    calendar.render();
});