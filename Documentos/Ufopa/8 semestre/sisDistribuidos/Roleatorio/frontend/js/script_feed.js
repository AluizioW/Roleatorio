const limitText = (element, maxLength) => {
    let text = element.innerText || element.textContent;

    // Quenra o texto e coloca "..."
    if (text.length > maxLength) {
        text = text.substring(0, maxLength) + '...';  
    }

    element.innerText = text;
};

const limitEventDetails = (event) => {
    const eventSummary = event.querySelector('.event-summary');
    const eventPlace = event.querySelector('.event-place');
    const eventTitle = event.querySelector('.event-title')

    if (eventSummary) {
        limitText(eventSummary, 100);
    }

    if (eventPlace) {
        limitText(eventPlace, 10);
    }

    if (eventTitle) {
        limitText(eventTitle, 50)
    }
};

const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('pt-BR');
};

const formatTime = (timeString) => {
    const [hours, minutes] = timeString.split(':');
    return `${hours}:${minutes}`;
};


// -----------------------------------------------------

const eventList = document.querySelector('.event-list');

const fetchEvents = async () => {
    const response = await fetch('http://localhost:3321/role');
    const events = await response.json();
    return events;
};

const createElement = (tag, className = '', innerText = '', innerHTML = '') => {
    const element = document.createElement(tag);
    if (className) element.classList.add(className);
    if (innerText) element.innerText = innerText;
    if (innerHTML) element.innerHTML = innerHTML;
    return element;
};

const createEventBox = (event) => {
    const {id:id, nome:title, descricao:summary, local:place, dia:date, hora:time } = event;

    const formattedDate = formatDate(date);
    const formattedTime = formatTime(time);

    const eventBox = createElement('div', 'event-box');

    // pega o id mas não exibe
    eventBox.setAttribute('data-id', id);

    const eventImg = createElement('div', 'event-img');
    const img = createElement('img');
    img.src = '';
    img.alt = 'Evento';
    eventImg.appendChild(img);

    const eventTitle = createElement('div', 'event-title', title);
    const eventSummary = createElement('div', 'event-summary', '', `<p>${summary}</p>`);
    
    const eventInfo = createElement('div', 'event-info');
    const eventPlaceButton = createElement('button', 'span', '', '<span class="material-icons-outlined">location_on</span>');
    const eventPlace = createElement('div', 'event-place', place);
    const eventDateTime = createElement('div', 'event-date-time');
    // const eventTime = createElement('div', 'event-time', time);
    // const eventDate = createElement('div', 'event-date', date);
    const eventTime = createElement('div', 'event-time', formattedTime);
    const eventTimeButton = createElement('button', 'span', '', '<span class="material-icons-outlined">schedule</span>');
    const eventDate = createElement('div', 'event-date', formattedDate);
    const eventDateButton = createElement('button', 'span','', '<span class="material-icons-outlined">calendar_today</span>')
    
    eventDateTime.appendChild(eventTime);
    eventTime.appendChild(eventTimeButton);
    eventDateTime.appendChild(eventDate);
    eventDate.appendChild(eventDateButton);
    eventInfo.appendChild(eventPlaceButton);
    eventInfo.appendChild(eventPlace);
    eventInfo.appendChild(eventDateTime);
    
    eventBox.appendChild(eventImg);
    eventBox.appendChild(eventTitle);
    eventBox.appendChild(eventSummary);
    eventBox.appendChild(eventInfo);

    limitEventDetails(eventBox);

    eventBox.addEventListener('click', () => {
        window.location.href = `../frontend/visualizar_evento.html?id=${id}`; 
    });

    
    return eventBox;
};



const loadEvents = async () => {
    const events = await fetchEvents();
    eventList.innerHTML = '';
    events.forEach(event => {
        const eventBox = createEventBox(event);
        eventList.appendChild(eventBox);
    });
};

loadEvents();
