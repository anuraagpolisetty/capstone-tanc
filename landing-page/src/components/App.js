import React, { Component } from 'react';
import Content from './Content'
import './css/App.css'
class App extends Component {
  render() {
    return(
      <div className="triangle">
        {/* <div class="triangle"></div> */}
        <Content />
      </div>
    )
  }
}


export default App;
