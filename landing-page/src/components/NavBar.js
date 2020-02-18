import React, { Component } from 'react';
import {Link, withRouter } from 'react-router-dom';
import { Nav, NavItem } from 'reactstrap'
import './css/NavBar.css';

class NavBar extends Component {
  render() {
    return(
      <div className="navigation-bar">
        {/* <Button>about</Button>
        <Button>contact</Button> */}
        <Nav>
          <NavItem>
            <Link to={{pathname: "/about"}}>about</Link>
          </NavItem>
          <NavItem>
            <Link to={{pathname: "/contact"}}>contact</Link>
          </NavItem>
        </Nav>
        

      </div>
    )
  }
}


export default withRouter(NavBar);
