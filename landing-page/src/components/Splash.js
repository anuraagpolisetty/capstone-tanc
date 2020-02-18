import React, { Component } from 'react';
import scene3 from '../img/Scene1.png'
import './css/Splash.css';

class Splash extends Component {

  render() {
    let heading = "Working with data sucks."

    return(
      <div>
        <div>
          {/* <Navbar /> */}
        </div>
        <div className="content-1">
          <div className="text">
            <h2>{heading}</h2>
            <p>
                We're working to help small governments achieve better survey practices,
                workflow, and evaluation of data to help facilitate funding decisions. 
                Currently, we're helping the City of Seattle Aging and Disability Services.
                TLDR: Making working with data not suck. 
            </p>
          </div>
          <img src={scene3} className="content-1" alt="Background for People" />
        </div>
      </div>
    )
  }
}

export default Splash