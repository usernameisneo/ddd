// This file contains the JavaScript functionality for the web tracker sampler application.

document.addEventListener('DOMContentLoaded', () => {
    const fileInput = document.getElementById('fileInput');
    const sampleList = document.getElementById('sampleList');
    const playButton = document.getElementById('playButton');
    const stopButton = document.getElementById('stopButton');
    const tempoInput = document.getElementById('tempoInput');
    const audioContext = new (window.AudioContext || window.webkitAudioContext)();
    let audioBuffers = [];
    let currentSampleIndex = 0;
    let isPlaying = false;
    let tempo = 120; // BPM

    fileInput.addEventListener('change', handleFileSelect);
    playButton.addEventListener('click', playSamples);
    stopButton.addEventListener('click', stopSamples);
    tempoInput.addEventListener('input', updateTempo);

    function handleFileSelect(event) {
        const files = event.target.files;
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const reader = new FileReader();
            reader.onload = (e) => {
                audioContext.decodeAudioData(e.target.result, (buffer) => {
                    audioBuffers.push(buffer);
                    const listItem = document.createElement('li');
                    listItem.textContent = file.name;
                    sampleList.appendChild(listItem);
                });
            };
            reader.readAsArrayBuffer(file);
        }
    }

    function playSamples() {
        if (isPlaying) return;
        isPlaying = true;
        currentSampleIndex = 0;
        playNextSample();
    }

    function playNextSample() {
        if (currentSampleIndex < audioBuffers.length) {
            const source = audioContext.createBufferSource();
            source.buffer = audioBuffers[currentSampleIndex];
            source.connect(audioContext.destination);
            source.start();
            currentSampleIndex++;
            const interval = (60 / tempo) * 1000; // Convert BPM to milliseconds
            setTimeout(playNextSample, interval);
        } else {
            isPlaying = false;
        }
    }

    function stopSamples() {
        isPlaying = false;
    }

    function updateTempo(event) {
        tempo = event.target.value;
    }
});