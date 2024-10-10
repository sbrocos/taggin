import Sound from '@stimulus-components/sound'

export default class extends Sound {
	static targets = ['audios', 'play', 'mute', 'title']
	play = false
	position = 0

	connect() {
		super.connect()

		this.#setSong()
		this.play_button()
		this.unmute_button()

		// The HTMLAudioElement instance.
		// See: https://developer.mozilla.org/en-US/docs/Web/API/HTMLAudioElement
		// You can fetch any attribute on it if needed.
		this.sound
	}

	playToggle() {
		if (this.play == false) {
			this.playAction()
		} else {
			this.sound.pause()
			this.play_button()
			this.play = false
		}
	}

	playPosition({params}) {

		this.position = params.position
		this.sound.pause()
		this.#setSong()
		this.playAction()
	}

	muteToggle({params}) {
		let mute_state = ! params.muted

		if (mute_state) this.mute_button()
		else this.unmute_button()

		this.sound.muted = mute_state
		this.muteTarget.dataset.soundMutedParam = mute_state;
	}
	stop() {
		this.sound.pause()
		this.play = false
		this.play_button()
		this.sound.load()
	}

	next() {
		if (this.position < this.audiosTargets.length + 1) {
			this.position += 1
		} else this.position = 0

		this.sound.pause()
		this.#setSong()
		this.playAction()
	}

	backward() {
		if (this.position > 0) {
			this.position -= 1
		}
		this.sound.pause()
		this.#setSong()
		this.playAction()
	}

	play_button() {
		this.playTarget.children[0].innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" d="M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />\n' +
			'<path stroke-linecap="round" stroke-linejoin="round" d="M15.91 11.672a.375.375 0 0 1 0 .656l-5.603 3.113a.375.375 0 0 1-.557-.328V8.887c0-.286.307-.466.557-.327l5.603 3.112Z" />\n'
	}

	pause_button() {
		this.playTarget.children[0].innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" d="M14.25 9v6m-4.5 0V9M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />\n'
	}

	mute_button() {
		this.muteTarget.children[0].innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" d="M17.25 9.75 19.5 12m0 0 2.25 2.25M19.5 12l2.25-2.25M19.5 12l-2.25 2.25m-10.5-6 4.72-4.72a.75.75 0 0 1 1.28.53v15.88a.75.75 0 0 1-1.28.53l-4.72-4.72H4.51c-.88 0-1.704-.507-1.938-1.354A9.009 9.009 0 0 1 2.25 12c0-.83.112-1.633.322-2.396C2.806 8.756 3.63 8.25 4.51 8.25H6.75Z" />\n'
	}

	unmute_button() {
		this.muteTarget.children[0].innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" d="M19.114 5.636a9 9 0 0 1 0 12.728M16.463 8.288a5.25 5.25 0 0 1 0 7.424M6.75 8.25l4.72-4.72a.75.75 0 0 1 1.28.53v15.88a.75.75 0 0 1-1.28.53l-4.72-4.72H4.51c-.88 0-1.704-.507-1.938-1.354A9.009 9.009 0 0 1 2.25 12c0-.83.112-1.633.322-2.396C2.806 8.756 3.63 8.25 4.51 8.25H6.75Z" />\n'
	}

	#setSong(){
		window.audios = this.audiosTargets
		window.position = this.position
		this.sound = new Audio(this.audiosTargets[this.position].src)
	}

	playAction() {
		this.sound.play()
		this.pause_button()
		this.play = true
		this.titleTarget.innerHTML = this.audiosTargets[this.position].dataset.soundName
	}
}