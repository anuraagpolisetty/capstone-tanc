import React, { Component } from 'react';
import scene3 from '../img/Scene1.png'
import './css/Project.css';

class Project extends Component {

  render() {
    let heading = "Solutions will go here:"

    return(
      <div>
        <div>
          {/* <Navbar /> */}
        </div>
        <div className="content-1">
          <div className="text">
            <h2 className='strike'>{heading}</h2>
            <p>
                1234
            </p>
          </div>
        </div>
      </div>
    )
  }
}

export default Project