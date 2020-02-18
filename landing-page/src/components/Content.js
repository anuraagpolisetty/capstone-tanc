import React, { Component } from 'react';
import Splash from './Splash';
import NavBar from './NavBar';
import scene2 from '../img/Scene2.png';
import scene3 from '../img/Scene3.png';
import './css/Content.css';

class Content extends Component {
  render() {
    return(
      <div>
        {/* <NavBar /> */}
        <Splash/>
        <div className='content-2 text'>
          <Text 
            heading="Why does it matter?"
            paragraph="That's a good question! Locally, 1 in 4 people in
                      King County will be 60 years or older by 2035. We 
                      want to be able to properly serve that growing
                      number by using data driven distribution of funds."
          />
          <img src={scene2} className="background-logo" alt="Background for People" />
        </div>
        <div className='content-3 text'>
          <img src={scene3} className="background-logo" alt="Background for People" />
          <Text2/>
        </div>
      </div>
    )
  }
}

export class Text extends Component {
  render() {
    let div = <div className='container'>
    <h2>
      {this.props.heading}
    </h2>
    <p>
      {this.props.paragraph}
    </p>
  </div>
  return div;
  }
}


export class Text2 extends Component {
  render() {
    let div = <div className='container2'>
    <h2>
    "How can we help you?"
    </h2>
    <p>
    Our team has designed an improved workflow for collecting survey responses
            from the elderly. No more need for manual input! We have proposed digitized
            solutions that will  ensure that no human errors can be found. From these 
            results, we have an automated dashboard where key findings from our 
            survey results can be hosted.
    </p>
  </div>
  return div;
  }
}


export default Content;
