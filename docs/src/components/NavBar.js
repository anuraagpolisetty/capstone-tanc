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
        {path: "projects", text: "Projects", isActive: false},
        {path: "about", text: "About", isActive: false},
      ]

    }
  }

  handleClick(i) {
    // const links = this.state.links.slice(); 
    console.log(i.target.name)
    if(i.target.name == "Home") {
      
    }
    // for (const j in links) {
    //   links[j].isActive = i === j ;
    // }
    // this.setState({links: links});
  }

  render() {
    return(
      <div className="navigation-bar">
        <Nav>
          <NavItem>
            <Link to={{pathname: "./"}} name="Home" onClick={this.handleClick}>home</Link>
          </NavItem>
          <NavItem>
            <Link to={{pathname: "./projects"}} name="Projects" onClick={this.handleClick}>project</Link>
          </NavItem>
          <NavItem>
            <Link to={{pathname: "./about"}} name="Contact" value="Contact" onClick={this.handleClick}>contact</Link>
          </NavItem>
        </Nav>
        

      </div>
    )
  }
}


export default withRouter(NavBar);