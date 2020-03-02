import React, { Component } from 'react';
import scene3 from '../img/Scene1.png'
import './css/Project.css';

class Projects extends Component {

  render() {
    let heading = "Solutions will go here: "

    return(
      <div>
        <div className="project-1">
          <div className="project-1-text">
            <h2 className='project-1-header'>{heading}</h2>
          </div>
        </div>
      </div>
    )
  }
}

export default Projects
