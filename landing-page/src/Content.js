import React, { Component } from 'react';
import person from './img/Person.png'
import person2 from './img/Person2.png'
import wheelchair from './img/Wheelchair.png'
import sitting from './img/Sitting.png'
import background from './img/Background.png'
import background2 from './img/Background2.png'
import './Content.css';

// function App() {
//   return (
//     <div className="Content">
//       <header className="Content-header">
//         <img src={logo} className="App-logo" alt="logo" />
//         <p>
//           Edit <code>src/App.js</code> and save to reload.
//         </p>
//         <a
//           className="App-link"
//           href="https://reactjs.org"
//           target="_blank"
//           rel="noopener noreferrer"
//         >
//           Learn React
//         </a>
//       </header>
//     </div>
//   );
// }

export class App extends Component {
  render() {
    return(
      <div>
        <Text/>
        <Scene/>
        <Text2/>
        <Scene2/>
      </div>
    )
  }
}

export class Text extends Component {
  render() {
    let div = <div className='container'>
    <h2>
      Why does it matter?
    </h2>
    <p>
      That's a good question! Locally, 1 in 4 people in
      King County will be 60 years or older by 2035. We 
      want to be able to properly serve that growing
      number by using data driven distribution of funds.
    </p>
  </div>
  return div;
  }
}

export class Scene extends Component {
  render() {
    let div = <div className='scene'>
      <img src={background} className="background-logo" alt="Background for People" />
      <img src={person} className="person-logo" alt="Old lady" />
      <img src={wheelchair} className="wheelchair-logo" alt="Person in Wheelchair" />
    </div>
    return div
  }
}

export class Text2 extends Component {
  render() {
    let div = <div className='container2'>
    <h2>
      How can we help you?
    </h2>
    <p>
      Our team has designed an improved workflow for collecting survey responses
      from the elderly. No more need for manual input! We have proposed digitized
      solutions that will  ensure that no human errors can be found. From these 
      results, we have an automated dashboard where key findings from our 
      survey results can be hosted.
    </p>
  </div>
  return div;
  }
}

export class Scene2 extends Component {
  render() {
    let div2 = <div className='scene2'>
      <img src={background2} className="background2-logo" alt="Background for People" />
      <img src={person2} className="person2-logo" alt="Old lady" />
      <img src={sitting} className="sitting-logo" alt="Person in Wheelchair" />
    </div>
    return div2
  }
}


export default App;
