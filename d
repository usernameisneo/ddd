 

Now, let's get to the code:

**index.html**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Tracker Sampler</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="section">
            <h2>Sample Loader</h2>
            <input type="file" id="fileInput" multiple accept="audio/*">
            <ul id="sampleList"></ul>
        </div>

         <div class="section">
            <h2>Controls</h2>
            <div class="controls">
                <button id="playBtn">Play</button>
                <button id="pauseBtn">Pause</button>
                 <button id="stopBtn">Stop</button>
                <label for="tempo">Tempo:</label>
                <input type="number" id="tempo" value="120">
                 <button id="recordBtn">Record</button>
                 <button id="clearBtn">Clear</button>
            </div>
            <div id="currentStepDisplay">Current Step: 0</div>
        </div>

        <div class="section">
          <h2>Tracker</h2>
          <div id="trackerContainer">
             <table id="trackerGrid"></table>
          </div>
        </div>
      
         <div class="section">
            <h2>Advanced Features</h2>
             <div class="section">
                 <h3>Effects</h3>
                <label for="reverbDryWet">Reverb Dry/Wet:</label>
                 <input type="range" id="reverbDryWet" min="0" max="1" step="0.01" value="0">
                 <label for="reverbTime">Reverb Time:</label>
                 <input type="range" id="reverbTime" min="0.1" max="5" step="0.1" value="0.5">
                 <label for="delayTime">Delay Time:</label>
                  <input type="range" id="delayTime" min="0" max="1" step="0.01" value="0">
                  <label for="delayFeedback">Delay Feedback:</label>
                 <input type="range" id="delayFeedback" min="0" max="0.9" step="0.01" value="0.5">
                  <label for="delayDryWet">Delay Dry/Wet:</label>
                 <input type="range" id="delayDryWet" min="0" max="1" step="0.01" value="0">
             </div>
              <div class="section">
                    <h3>Synthesis</h3>
                    <label for="synthWave">Wave Type:</label>
                    <select id="synthWave">
                       <option value="sine">Sine</option>
                       <option value="square">Square</option>
                        <option value="sawtooth">Sawtooth</option>
                        <option value="triangle">Triangle</option>
                     </select>
                     <label for="synthFrequency">Frequency:</label>
                     <input type="number" id="synthFrequency" value="440">
                       <button id="synthPlay">Play Synth</button>
                       <button id="synthStop">Stop Synth</button>
               </div>
              <div class="section">
                   <h3>Sample Manipulation</h3>
                   <label for="sampleStart">Sample Start:</label>
                   <input type="range" id="sampleStart" min="0" max="1" step="0.01" value="0">
                    <label for="sampleEnd">Sample End:</label>
                    <input type="range" id="sampleEnd" min="0" max="1" step="0.01" value="1">
                    <button id="loopToggle">Toggle Loop</button>
                    <button id="reverseToggle">Toggle Reverse</button>
             </div>
             <div class="section">
                  <h3>Custom Code Execution</h3>
                   <textarea id="codeEditor" rows="10" cols="50"></textarea>
                   <button id="executeCodeBtn">Execute Code</button>
              </div>
               <div class="section">
                   <h3>Visualizations</h3>
                    <canvas id="oscilloscopeCanvas" width="300" height="100"></canvas>
                    <canvas id="spectrumCanvas" width="300" height="100"></canvas>
                     <canvas id="frequencyCanvas" width="300" height="100"></canvas>
               </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
```

**style.css**

```css
body {
    font-family: monospace;
    background-color: #f0f0f0;
    color: #333;
    margin: 20px;
    padding: 0;
}

.container {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.section {
    background-color: #ffffff;
    padding: 15px;
    border: 2px solid #add8e6;
}

h2 {
    color: #000080;
    margin-top: 0;
}

h3{
     color: #000080;
     margin-top: 0;
}

input[type="file"] {
    margin-bottom: 10px;
    border: 1px solid #000080;
    padding: 5px;
    background-color: #e0ffff;
}

ul {
    list-style: none;
    padding: 0;
}

ul li {
    background-color: #e0ffff;
    padding: 8px;
    margin-bottom: 5px;
    border: 1px solid #000080;
    cursor: pointer;
}

ul li.selected {
    background-color: #7cfc00;
    font-weight: bold;
    color: #000080
}

.controls button {
    background-color: #add8e6;
    color: #000080;
    border: 1px solid #000080;
    padding: 10px 15px;
    margin: 5px;
    cursor: pointer;
}

.controls label, .controls input {
  margin: 5px;
}

#trackerContainer {
    overflow-x: auto;
    border: 1px solid #add8e6;
    margin-top:10px;
}

#trackerGrid {
    border-collapse: collapse;
}

#trackerGrid th, #trackerGrid td {
    border: 1px solid #add8e6;
    padding: 5px;
    text-align: center;
    min-width: 30px;
    background-color: #ffffff;
}

#trackerGrid td.active {
    background-color: #7cfc00;
}

#currentStepDisplay {
    margin-top: 10px;
    color: #000080;
    font-weight: bold;
}

textarea {
    border: 1px solid #000080;
    background-color:#e0ffff
}
select{
  border: 1px solid #000080;
  background-color:#e0ffff
}
input[type="number"]{
  border: 1px solid #000080;
    background-color:#e0ffff
}
input[type="range"] {
  -webkit-appearance: none;
    width: 150px;
    height: 10px;
    background: #add8e6;
    outline: none;
     border: 1px solid #000080
}

input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
    appearance: none;
    width: 15px;
    height: 15px;
    background: #000080;
    cursor: pointer;
}
```

**script.js**

```javascript
// Audio Context and variables
const audioContext = new (window.AudioContext || window.webkitAudioContext)();
let samples = {};
let currentSample = null;
let sequencerData = [];
let currentStep = 0;
let isPlaying = false;
let isRecording = false;
let intervalId;
let steps = 16;
let tracks = 4;
let tempo = 120;
let recordingData = [];
let synthOscillator;
let synthGainNode;
let isSynthPlaying = false;

// HTML Elements
const fileInput = document.getElementById('fileInput');
const sampleList = document.getElementById('sampleList');
const playBtn = document.getElementById('playBtn');
const pauseBtn = document.getElementById('pauseBtn');
const stopBtn = document.getElementById('stopBtn');
const tempoInput = document.getElementById('tempo');
const trackerGrid = document.getElementById('trackerGrid');
const currentStepDisplay = document.getElementById('currentStepDisplay');
const recordBtn = document.getElementById('recordBtn');
const clearBtn = document.getElementById('clearBtn');
const reverbDryWetSlider = document.getElementById('reverbDryWet');
const reverbTimeSlider = document.getElementById('reverbTime');
const delayTimeSlider = document.getElementById('delayTime');
const delayFeedbackSlider = document.getElementById('delayFeedback');
const delayDryWetSlider = document.getElementById('delayDryWet');
const synthWaveSelect = document.getElementById('synthWave');
const synthFrequencyInput = document.getElementById('synthFrequency');
const synthPlayBtn = document.getElementById('synthPlay');
const synthStopBtn = document.getElementById('synthStop');
const sampleStartSlider = document.getElementById('sampleStart');
const sampleEndSlider = document.getElementById('sampleEnd');
const loopToggleBtn = document.getElementById('loopToggle');
const reverseToggleBtn = document.getElementById('reverseToggle');
const codeEditor = document.getElementById('codeEditor');
const executeCodeBtn = document.getElementById('executeCodeBtn');
const oscilloscopeCanvas = document.getElementById('oscilloscopeCanvas');
const spectrumCanvas = document.getElementById('spectrumCanvas');
const frequencyCanvas = document.getElementById('frequencyCanvas');
const oscilloscopeCtx = oscilloscopeCanvas.getContext('2d');
const spectrumCtx = spectrumCanvas.getContext('2d');
const frequencyCtx = frequencyCanvas.getContext('2d');


// Initialize the grid on page load
window.onload = function() {
    createGrid();
    initVisualizers();
};

// --- Sample Loading Module ---
function loadSamples(files) {
  for (const file of files) {
    const reader = new FileReader();
    reader.onload = (e) => {
       audioContext.decodeAudioData(e.target.result).then(buffer => {
           const sampleName = file.name;
           samples[sampleName] = buffer;
           addSampleToList(sampleName);
      });
    };
    reader.readAsArrayBuffer(file);
  }
}

function addSampleToList(sampleName) {
    const listItem = document.createElement('li');
    listItem.textContent = sampleName;
    listItem.addEventListener('click', () => selectSample(sampleName, listItem));
    sampleList.appendChild(listItem);
}

function selectSample(sampleName, listItem) {
    if (currentSample) {
        const prevSelected = document.querySelector('#sampleList li.selected');
        if (prevSelected) {
            prevSelected.classList.remove('selected');
        }
    }
    listItem.classList.add('selected');
    currentSample = sampleName;
}

// --- Tracker Grid Module ---
function createGrid() {
    trackerGrid.innerHTML = '';
    const headerRow = document.createElement('tr');
      const headerCell = document.createElement('th');
        headerCell.textContent = "Track";
        headerRow.appendChild(headerCell)

    for (let i = 0; i < steps; i++) {
        const headerCell = document.createElement('th');
        headerCell.textContent = i + 1;
        headerRow.appendChild(headerCell);
    }
    trackerGrid.appendChild(headerRow);

    for (let track = 0; track < tracks; track++) {
        const row = document.createElement('tr');
         const trackHeaderCell = document.createElement('th')
          trackHeaderCell.textContent = track+1;
          row.appendChild(trackHeaderCell)
        sequencerData[track] = sequencerData[track] || Array(steps).fill(null);
        for (let step = 0; step < steps; step++) {
            const cell = document.createElement('td');
            cell.dataset.track = track;
            cell.dataset.step = step;
            cell.addEventListener('click', () => toggleStep(cell));
             if (sequencerData[track][step] !== null) {
                cell.textContent = sequencerData[track][step];
            }

             row.appendChild(cell);
        }
        trackerGrid.appendChild(row);
    }
}

function toggleStep(cell) {
    const track = parseInt(cell.dataset.track);
    const step = parseInt(cell.dataset.step);

    if (currentSample) {
        sequencerData[track][step] = currentSample;
        cell.textContent = currentSample;
        console.log("Track:", track, "Step:", step, "Sample:", currentSample);
    } else {
        sequencerData[track][step] = null;
         cell.textContent = "";
        console.log("Track:", track, "Step:", step, "Cleared");
    }
}

// --- Sequencer Engine Module ---
function startSequencer() {
    if (isPlaying) return;
    isPlaying = true;
    intervalId = setInterval(() => {
        playStep();
        currentStep++;
        if (currentStep >= steps) {
            currentStep = 0;
        }
    }, 60000 / tempo / 4); // 16th note timing

}

function playStep() {
    highlightCurrentStep();
    for (let track = 0; track < tracks; track++){
       const sampleName = sequencerData[track][currentStep];
       if (sampleName) {
            playSample(sampleName, track);
           if(isRecording){
              recordStep(track, currentStep, sampleName)
          }

       }
    }
}


function highlightCurrentStep() {
    const cells = document.querySelectorAll('#trackerGrid td');
    cells.forEach(cell => cell.classList.remove('active'));
    const currentStepCells = document.querySelectorAll(`#trackerGrid td[data-step="${currentStep}"]`)
    currentStepCells.forEach(cell => cell.classList.add('active'));
    currentStepDisplay.textContent = `Current Step: ${currentStep + 1}`;
}

function stopSequencer() {
    if (!isPlaying) return;
    isPlaying = false;
    clearInterval(intervalId);
     currentStep = 0;
     highlightCurrentStep();
}

function pauseSequencer() {
    if (!isPlaying) return;
    isPlaying = false;
    clearInterval(intervalId);
}


// --- Transport Controls Module ---
playBtn.addEventListener('click', () => {
    startSequencer();
});
pauseBtn.addEventListener('click', () => {
    pauseSequencer();
});
stopBtn.addEventListener('click', () => {
  stopSequencer();
  if (isRecording) {
      isRecording = false;
      recordBtn.textContent = 'Record';
  }
});

tempoInput.addEventListener('change', () => {
    tempo = parseInt(tempoInput.value);
    if(isPlaying){
      stopSequencer();
      startSequencer()
    }
});

// --- Recording Module ---

recordBtn.addEventListener('click', () => {
     isRecording = !isRecording;
    recordBtn.textContent = isRecording ? 'Stop Recording' : 'Record';
      if(!isRecording) {
       console.log("recordingData", recordingData)
      }
    recordingData = [];
})
function recordStep(track, step, sampleName){
    recordingData.push({track, step, sampleName})
}

// -- Clear module ---
clearBtn.addEventListener('click', () => {
   clearSequencer();
});

function clearSequencer(){
     sequencerData = [];
        createGrid();
       stopSequencer();
        if (isRecording) {
            isRecording = false;
            recordBtn.textContent = 'Record';
        }
       recordingData = []

}
// --- Audio Playback Module ---
function playSample(sampleName, track) {
    if (!samples[sampleName]) return;

    const source = audioContext.createBufferSource();
    source.buffer = samples[sampleName];

    const gainNode = audioContext.createGain();
    gainNode.gain.value = 0.5

    const reverb = audioContext.createConvolver();
    createReverbImpulse(reverbTimeSlider.value).then(buffer => {
      reverb.buffer = buffer
      const reverbGain = audioContext.createGain();
      reverbGain.gain.value = reverbDryWetSlider.value;
      source.connect(reverb);
      reverb.connect(reverbGain)
      reverbGain.connect(gainNode)
    })



    const delay = audioContext.createDelay(1);
    delay.delayTime.value = delayTimeSlider.value
    const delayFeedback = audioContext.createGain();
     delayFeedback.gain.value = delayFeedbackSlider.value;
    const delayGain = audioContext.createGain()
    delayGain.gain.value = delayDryWetSlider.value;


    source.connect(delay);
      delay.connect(delayFeedback)
      delayFeedback.connect(delay);
    delay.connect(delayGain);
    delayGain.connect(gainNode)

    source.connect(gainNode);

   gainNode.connect(audioContext.destination);

    // Apply Sample Manipulation
     const startTime = source.buffer.duration * parseFloat(sampleStartSlider.value);
     const endTime = source.buffer.duration * parseFloat(sampleEndSlider.value);

   if (reverseToggleBtn.classList.contains('active')) {
       reverseBuffer(source.buffer)
     }

      source.start(0, startTime, endTime - startTime);
   if (loopToggleBtn.classList.contains('active')) {
     source.loop = true;
   }

  startVisualizers(source);
}
// --- Effects Module ---
async function createReverbImpulse(duration) {
  const sampleRate = audioContext.sampleRate;
  const length = sampleRate * duration;
  const buffer = audioContext.createBuffer(1, length, sampleRate);
  const data = buffer.getChannelData(0);
  for (let i = 0; i < length; i++) {
    data[i] = (Math.random() * 2 - 1) * (1 - i / length);
  }
  return buffer;
}
reverbDryWetSlider.addEventListener('input', () => {
});
reverbTimeSlider.addEventListener('input', () => {
});
delayTimeSlider.addEventListener('input', () => {
});
delayFeedbackSlider.addEventListener('input', () => {
});
delayDryWetSlider.addEventListener('input', () => {
});
// --- Synthesis Module ---
function startSynth() {
    if(isSynthPlaying) return;
    isSynthPlaying = true
    synthOscillator = audioContext.createOscillator();
    synthGainNode = audioContext.createGain();

    synthOscillator.type = synthWaveSelect.value;
    synthOscillator.frequency.value = synthFrequencyInput.value;
     synthGainNode.gain.value = 0.3
    synthOscillator.connect(synthGainNode)
    synthGainNode.connect(audioContext.destination)
    synthOscillator.start();
    startVisualizers(synthOscillator)
}
function stopSynth(){
    if(!isSynthPlaying) return;
     isSynthPlaying = false
     synthOscillator.stop();
     synthOscillator.disconnect();
    synthGainNode.disconnect();
    synthOscillator = null;
    synthGainNode = null
}

synthPlayBtn.addEventListener('click', () => startSynth());
synthStopBtn.addEventListener('click', () => stopSynth());

synthWaveSelect.addEventListener('change', () => {
    if(synthOscillator){
       synthOscillator.type = synthWaveSelect.value
    }
});

synthFrequencyInput.addEventListener('change', () => {
   if(synthOscillator){
        synthOscillator.frequency.value = synthFrequencyInput.value
   }
});

// --- Sample Manipulation Module ---
sampleStartSlider.addEventListener('input', () => {
});
sampleEndSlider.addEventListener('input', () => {
});
loopToggleBtn.addEventListener('click', () => {
  loopToggleBtn.classList.toggle('active');
});
reverseToggleBtn.addEventListener('click', () => {
   reverseToggleBtn.classList.toggle('active');
});
function reverseBuffer(buffer){
  for (let channel = 0; channel < buffer.numberOfChannels; channel++) {
     const data = buffer.getChannelData(channel);
       data.reverse();
  }
}
// --- Code Execution Module ---
executeCodeBtn.addEventListener('click', () => {
   try {
    eval(codeEditor.value);
  } catch (error) {
      console.error('Error executing code:', error);
     }
});

// --- File Input Module ---
fileInput.addEventListener('change', (e) => {
  const files = e.target.files;
   loadSamples(files);
});
// --- Visualizer Module ---
function initVisualizers() {
  oscilloscopeCtx.fillStyle = 'rgb(255, 255, 255)';
  oscilloscopeCtx.fillRect(0, 0, oscilloscopeCanvas.width, oscilloscopeCanvas.height);
  spectrumCtx.fillStyle = 'rgb(255, 255, 255)';
  spectrumCtx.fillRect(0, 0, spectrumCanvas.width, spectrumCanvas.height);
   frequencyCtx.fillStyle = 'rgb(255, 255, 255)';
  frequencyCtx.fillRect(0, 0, frequencyCanvas.width, frequencyCanvas.height);

}
function startVisualizers(source) {
   const analyser = audioContext.createAnalyser();
  analyser.fftSize = 2048;
    source.connect(analyser)
  visualizeOscilloscope(analyser);
   visualizeSpectrum(analyser);
   visualizeFrequency(analyser);
}

function visualizeOscilloscope(analyser) {
   const bufferLength = analyser.fftSize;
  const dataArray = new Float32Array(bufferLength);

  function draw() {
    requestAnimationFrame(draw);
    analyser.getFloatTimeDomainData(dataArray);

    oscilloscopeCtx.fillStyle = 'rgb(255, 255, 255)';
     oscilloscopeCtx.fillRect(0, 0, oscilloscopeCanvas.width, oscilloscopeCanvas.height);

    oscilloscopeCtx.lineWidth = 1;
    oscilloscopeCtx.strokeStyle = 'rgb(0,0,0)';

    oscilloscopeCtx.beginPath();

    const sliceWidth = oscilloscopeCanvas.width * 1.0 / bufferLength;
    let x = 0;

    for (let i = 0; i < bufferLength; i++) {
      const v = dataArray[i] * oscilloscopeCanvas.height / 2;
      const y = oscilloscopeCanvas.height / 2 + v;

      if (i === 0) {
        oscilloscopeCtx.moveTo(x, y);
      } else {
        oscilloscopeCtx.lineTo(x, y);
      }

      x += sliceWidth;
    }

    oscilloscopeCtx.lineTo(oscilloscopeCanvas.width, oscilloscopeCanvas.height / 2);
    oscilloscopeCtx.stroke();
  }
  draw();
}
function visualizeSpectrum(analyser) {
    const bufferLength = analyser.frequencyBinCount;
    const dataArray = new Uint8Array(bufferLength);

     function draw() {
    requestAnimationFrame(draw);
    analyser.getByteFrequencyData(dataArray);

    spectrumCtx.fillStyle = 'rgb(255, 255, 255)';
       spectrumCtx.fillRect(0, 0, spectrumCanvas.width, spectrumCanvas.height);
    const barWidth = (spectrumCanvas.width / bufferLength);
    let x = 0;

     for (let i = 0; i < bufferLength; i++) {
      const barHeight = (dataArray[i] / 255) * spectrumCanvas.height;
      spectrumCtx.fillStyle = 'rgb(0, 0, 0)';
      spectrumCtx.fillRect(x, spectrumCanvas.height - barHeight, barWidth, barHeight);
       x += barWidth;
    }
  }
     draw();
}
 function visualizeFrequency(analyser) {
   const bufferLength = analyser.frequencyBinCount;
    const dataArray = new Uint8Array(bufferLength);

    function draw() {
       requestAnimationFrame(draw);
      analyser.getByteFrequencyData(dataArray);

       frequencyCtx.fillStyle = 'rgb(255, 255, 255)';
       frequencyCtx.fillRect(0, 0, frequencyCanvas.width, frequencyCanvas.height);
       frequencyCtx.lineWidth = 2;
        frequencyCtx.strokeStyle = 'rgb(0,0,0)';
      frequencyCtx.beginPath();

    const sliceWidth = frequencyCanvas.width / bufferLength;
      let x = 0;

     for (let i = 0; i < bufferLength; i++) {
       const v = (dataArray[i] / 255) * frequencyCanvas.height;
        const y = frequencyCanvas.height - v
        if (i === 0) {
        frequencyCtx.moveTo(x, y);
      } else {
        frequencyCtx.lineTo(x, y);
      }
      x += sliceWidth;
      }

    frequencyCtx.stroke();
  }
  draw();
}