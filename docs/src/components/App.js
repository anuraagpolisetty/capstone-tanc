import React, { Component } from 'react';
import { HashRouter as Router, Route, Switch } from 'react-router-dom';
import Content from './Content';
import NavBar from './NavBar';
import About from './About';
import './css/App.css';

const Main = () => (
  <main>
    <Switch>
      <Route exact path='/' component={Content} />
      <Route exact path='/about' component={About} />
    </Switch>
  </main>
)

class App extends Component {
  render() {
    return(
      <Router>
        <div className="triangle">
          <NavBar/>
          <Main />
        </div>
      </Router>
    )
  }
}


export default App;
