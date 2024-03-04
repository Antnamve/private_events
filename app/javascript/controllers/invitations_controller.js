import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="invitations"
export default class extends Controller {
  connect() {
    console.log('Invitations connected!')
  }

  sendInvitation(e) {
    e.preventDefault()

    console.log('Hello from sendInvitation!')

    const params = {
      event_id: this.element.dataset.eventId,
      user_id: this.element.dataset.userId
    }

    const options = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(params)
    }

    fetch('/api/events', options)
      .then(response => {
        if (!response.ok) {
          console.log(response.status);
        }
        return response.json();
      })
      .then(data => {
        console.log(data);
      })
  }

  rescindInvitation(e) {
    e.preventDefault()

    console.log('Hello from rescindInvitation!')
    console.log('eventId', this.element.dataset.eventId)
    console.log('userId', this.element.dataset.userId)

    const params = {
      event_id: this.element.dataset.eventId,
      user_id: this.element.dataset.userId
    }

    fetch(`/api/events/${this.element.dataset.eventId}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(params)
    })
  }
}
