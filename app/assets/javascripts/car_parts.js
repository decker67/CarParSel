var image_urls = [
    '<img src="/assets/ball_0.png">',
    '<img src="/assets/ball_1.png">',
    '<img src="/assets/ball_2.png">',
    '<img src="/assets/ball_3.png">',
    '<img src="/assets/ball_4.png">'
];

var multipleChangeMode;



function checkAllClicked(checkbox) {
    var checked = checkbox.checked;
    $('[id^=check_]').prop('checked', checked);
    multipleChangeMode = (checked === true);
}

function checkOneClicked() {
    multipleChangeMode = true;
}

function id2addKeyUpHandler(event) {
    if (event.keyCode === 13) {
        $('#paging_count').submit();
    }
}

function limitOnChangeHandler() {
    $('#paging_count').submit();
}

function stateOnDoubleClickHandler(element) {
    if (multipleChangeMode) {
        var state = element.src.split('ball_')[1].split('.png')[0];
        $('[id^=check_]').each(function (index, element) {
            element = $(element)[0];
            if (element.checked) {
                var id = element.id.split('_')[1];
                if (id !== 'all') {
                    element = $('[data-id=ball_' + id + ']')[0];
                    //console.log(element);
                    changeState(element, state);
                }
            }
        });
    } else {
        changeState(element);
    }
}

function changeState(element, state) {
    var imageTag = $(element);
    var car_part_id = imageTag.attr('data-id').substring(5);
    var requestForState = '/toggle_car_part_state?car_part_id=' + car_part_id;
    if (state) {
        requestForState = requestForState + '&state=' + state;
    }
    $.get(requestForState).done(function (result) {
        var srcOfImageTag = imageTag.attr('src');
        var image_tag_for_state = image_urls[result.state];
        element.src = image_tag_for_state.split('src="')[1].split('"')[0];
        element.title = result.state_as_string;
        element.alt = result.state_as_string;
    });
}

function rejectClickHandler(node) {
    var tag = $(node);
    var car_part_id = tag.attr('data-id');
    var request = '/reject_car_part?car_part_id=' + car_part_id;
    $.get(request).done(function (result) {
        changeDescription(car_part_id, result.description);
    });
}

function separateClickHandler(node) {
    var tag = $(node);
    var car_part_id = tag.attr('data-id');
    var request = '/separate_car_part?car_part_id=' + car_part_id;
    $.get(request).done(function (result) {
        changeDescription(car_part_id, result.description);
    });
}

function changeDescription(id, value) {
    var tag = $('#' + id + '_description');
    //console.log(id, value, tag);
    tag[0].innerHTML = value;
}