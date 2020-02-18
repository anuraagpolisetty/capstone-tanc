import React, { Component } from 'react';
import {Link, withRouter } from 'react-router-dom';
import { Nav, NavItem } from 'reactstrap'
import './css/NavBar.css';

class NavBar extends Component {
  constructor(props) {
    super(props);
    this.state = {
      links: [
        {path: "", text: "Home", isActive: false},
        {path: "about", text: "About", isActive: false},
      ]
    }
  }

  handleClick(i) {
    const links = this.state.links.slice(); 
    for (const j in links) {
      links[j].isActive = i === j ;
    }
    this.setState({links: links});
  }

  render() {
    return(
      <div className="navigation-bar">
        {/* <Button>about</Button>
        <Button>contact</Button> */}
        <Nav>
          <NavItem>
            <Link to={{pathname: "./"}}>home</Link>
          </NavItem>
          <NavItem>
            <Link to={{pathname: "./about"}}>about</Link>
          </NavItem>
        </Nav>
        

      </div>
    )
  }
}


export default withRouter(NavBar);
