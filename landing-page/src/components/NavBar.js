import React, { Component } from 'react';
import './css/NavBar.css';
import { Button } from 'react-bootstrap'

class NavBar extends Component {
  render() {
    return(
      <div>
        <Button>about</Button>
        <Button>contact</Button>

      </div>
    )
  }
}


export default NavBar;
