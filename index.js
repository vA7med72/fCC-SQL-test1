import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import reportWebVitals from './reportWebVitals';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlus, faMinus, faArrowsRotate, faPlay, faPause } from '@fortawesome/free-solid-svg-icons'

class App extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      session: 25,
      break: 5,
      played: false,
      sessionOn: true,
      get time(){
        let display = this.sessionOn ? this.session : this.break
        return `${display < 10 ? `0${display}`: display}:00`
      },
      currentMin: 0,
      currentSec: 0,
      hasPaused: true,
      juststarted: true
    }
    this.handleReset = this.handleReset.bind(this);
    this.handlePlay = this.handlePlay.bind(this);
    this.handlePause = this.handlePause.bind(this);
    this.handleSInc = this.handleSInc.bind(this);
    this.handleSDec = this.handleSDec.bind(this);
    this.handleBInc = this.handleBInc.bind(this);
    this.handleBDec = this.handleBDec.bind(this);
  }

  handleSInc(){
    this.setState(state => ({
      session: state.session < 60 ? state.session + 1 : state.session,
      played: false,
    }));
    if(this.state.sessionOn){
      this.setState(state => ({
        get time(){
          return `${state.session < 10 ? `0${state.session}`: state.session}:00`
        },
        hasPaused: true,
        juststarted: true
      }))
      document.getElementById('time-left').textContent = this.state.time;
    }
  }
  handleSDec(){
    this.setState(state => ({
      session: state.session > 1 ? state.session - 1 : state.session,
      played: false,
    }));
    if(this.state.sessionOn){
      this.setState(state => ({
        get time(){
          return `${state.session < 10 ? `0${state.session}`: state.session}:00`
        },
        hasPaused: true,
        juststarted: true
      }))
      document.getElementById('time-left').textContent = this.state.time;
    }
  }
  handleBInc(){
    this.setState(state => ({
      break: state.break < 60 ? state.break + 1 : state.break,
      played: false,
    }));
    if(!this.state.sessionOn){
      this.setState(state => ({
        get time(){
          return `${state.break < 10 ? `0${state.break}`: state.break}:00`
       },
        hasPaused: true,
        juststarted: true
      }))
      document.getElementById('time-left').textContent = this.state.time;
    }
  }
  handleBDec(){
    this.setState(state => ({
      break: state.break > 1 ? state.break - 1 : state.break,
      played: false,
    }));
    if(!this.state.sessionOn){
      this.setState(state => ({
        get time(){
          return `${state.break < 10 ? `0${state.break}`: state.break}:00`
        },
        hasPaused: true,
        juststarted: true
      }));
      document.getElementById('time-left').textContent = this.state.time;
    }
  }



  handlePlay(){
    this.setState({
      played: true,
      hasPaused: false,
    })
    let minTime;
    let secTime = 0;
    if(!this.state.played){
      minTime = this.state.sessionOn ? this.state.session : this.state.break;
    } else if(this.state.hasPaused){
      minTime = this.state.currentMin;
      secTime = this.state.currentSec;
    } 
    let label = document.getElementById('time-left');
   if(this.state.juststarted){
    this.setState({
      juststarted: false
    })
    setTimeout(() => {
      secTime = 59
      minTime--
      label.textContent = `${minTime < 10 ? `0${minTime}` : minTime}:${secTime < 10 ? `0${secTime}` : secTime === 60 ? '00' : secTime}`
    }, 1000);
   }
    let miniInterval = setInterval(() => {
      if(this.state.hasPaused){
        this.setState({
          currentMin: minTime,
          currentSec: secTime
        })
        clearInterval(miniInterval)
        return;
      } 
      if(secTime == 60){
        this.setState({
          sessionOn: !this.state.sessionOn
        });
      }
      label.textContent = `${minTime < 10 ? `0${minTime}` : minTime}:${secTime < 10 ? `0${secTime}` : secTime === 60 ? '00' : secTime}`
      if(secTime == 0 && minTime == 0){
        document.getElementById('beep').play()
        minTime = !this.state.sessionOn ? this.state.session : this.state.break; 
        secTime = 61;
      }
      secTime--
      if(secTime < 0 && minTime > 0){
        secTime = 59;
      }
      if(secTime == 59 && minTime > 0){
        minTime--
      }
      
    }, 1000)
    if(this.state.hasPaused) {
      return;
    }; 
  }

  handlePause(){
    this.setState({
      hasPaused: true
    })
  }

  handleReset(){
    this.setState({
      session: 25,
      break: 5,
      played: false,
      sessionOn: true,
      get time(){
        let display = this.sessionOn ? this.session : this.break
        return `${display < 10 ? `0${display}`: display}:00`
      },
      hasPaused: true,
      juststarted: true
    });
    document.getElementById('time-left').textContent = this.state.time;
    const audio = document.getElementById('beep');
    audio.currentTime = 0
  }

  render(){
    return(
      <div>
        <h1>25 + 5 Clock</h1>
        <div id="displayer">
          <div id="time-display">
            <p id="timer-label">{this.state.sessionOn ? "Session" : "Break"}</p>
            <p id="time-left">{this.state.time}</p>
            {/* Borrowed the audio source from the fcc project displayed on https://codepen.io/freeCodeCamp/pen/XpKrrW */}
             <audio id="beep" src='"https://raw.githubusercontent.com/freeCodeCamp/cdn/master/build/testable-projects-fcc/audio/BeepSound.wav"'></audio>
          </div>
          <div id="timer-buttons">
            <button id="start_stop" onClick={this.state.hasPaused ? this.handlePlay : this.handlePause}>
            {this.state.hasPaused ? <FontAwesomeIcon icon={faPlay} /> : <FontAwesomeIcon icon={faPause} />}  
            </button>
            <button id="reset" onClick={this.handleReset}><FontAwesomeIcon icon={faArrowsRotate} /></button>
          </div>
        </div>
        <div id="time-setters">
          <div id="break-setter">
          <p id="break-label">Break Length</p>
            <div id="break-lengthers">
              <button id="break-decrement" onClick={this.handleBDec}><FontAwesomeIcon icon={faMinus} /></button>
              <p id="break-length">{this.state.break}</p>
              <button id="break-increment" onClick={this.handleBInc}><FontAwesomeIcon icon={faPlus} /></button>
            </div>
          </div>
          <div id="session-setter">
            <p id="session-label">Session Length</p>
            <div id="session-lengthers">
              <button id="session-decrement" onClick={this.handleSDec}><FontAwesomeIcon icon={faMinus} /></button>
              <p id="session-length">{this.state.session}</p>
              <button id="session-increment" onClick={this.handleSInc}><FontAwesomeIcon icon={faPlus} /></button>
            </div>
          </div>
        </div>
      </div>
    )
  }

}



const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
