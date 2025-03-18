const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('pt-BR');
};

const formatTime = (timeString) => {
    const [hours, minutes] = timeString.split(':');
    return `${hours}:${minutes}`;
};

const fetchEventDetails = async () => {
    const urlParams = new URLSearchParams(window.location.search);
    const eventId = urlParams.get('id');
    if (!eventId) return;
    
    try {
        const response = await fetch(`http://localhost:3321/role/view/${eventId}`);
        const event = await response.json();
        displayEvent(event);
    } catch (error) {
        console.error('Erro ao buscar evento:', error);
    }
};

const displayEvent = (event) => {
    const { nome: title, descricao: summary, local: place, dia: date, hora: time } = event;

    document.querySelector('.event-title').innerText = title;
    document.querySelector('.event-summary p').innerText = summary;
    document.querySelector('.event-place').innerHTML = `<button class="span"><span class="material-icons-outlined">location_on</span></button> ${place}`;
    document.querySelector('.event-date').innerHTML = `${formatDate(date)} <button class="span"><span class="material-icons-outlined">calendar_today</span></button>`;
    document.querySelector('.event-time').innerHTML = `${formatTime(time)} <button class="span"><span class="material-icons-outlined">schedule</span></button>`;
    
    // limitEventDetails(document.querySelector('.event-box'));
};

document.addEventListener('DOMContentLoaded', fetchEventDetails);
