import React, { Component } from 'react';
import { HashRouter as Router, Route, Switch } from 'react-router-dom';
import Content from './Content';
import NavBar from './NavBar';
import './css/App.css';
class App extends Component {
  render() {
    return(
      <Router>
      <div className="triangle">
        <NavBar/>
          <Switch>  
            <Route exact path="/" component={Content} />
            {/* <Route path="/about" component={About} /> */}
            {/* <Route path="/contact" component={Contact} /> */}
          </Switch>
      </div>
      </Router>
    )
  }
}


export default App;
