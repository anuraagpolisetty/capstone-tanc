import React, { Component } from 'react';
import naved from '../img/NavedTemp.jpg';
import anuraag from '../img/AnuraagTemp.jpg';
import chris from '../img/ChrisTemp.jpg';
import tabitha from '../img/TabithaTemp.jpg';
import './css/About.css';
class About extends Component{
render(){
let heading = "Who we are."
return(
<body className = "about-container">
   <div>
      <h2>{heading}</h2>
      <p>We are a group of engineers and a designer from Seattle. We have a passion
         for creating tools that help streamline production so people can spend more
         time doing what they love. If you would like to know more about our project
         or how we can help you, you can contact us at any of our emails.
      </p>
   </div>
   <div class = "item">
      <img src={chris} alt="Avatar"></img>
      <span class="caption">Christopher Vitalis</span>
      <br></br>
      <span class ="job">UX Designer</span>
      <br></br>
      <span class ="job">cvitalis@uw.edu</span>
   </div>
   <div class = "item">
      <img src={naved} alt="Avatar"></img>
      <span class="caption">Naved Krishnamurthy</span>
      <br></br>
      <span class ="job">Data Scientist</span>
      <br></br>
      <span class ="job">navedk@uw.edu</span>
   </div>
   <div class = "item">
      <img src={anuraag} alt="Avatar"></img>
      <span class="caption">Anuraag Polisetty</span>
      <br></br>
      <span class ="job">Software Engineer</span>
      <br></br>
      <span class ="job">anuraag@uw.edu</span>
   </div>
   <div class = "item">
      <img src={tabitha} alt="Avatar"></img>
      <span class="caption">Tabitha Anderson</span>
      <br></br>
      <span class ="job">Software Engineer</span>
      <br></br>
      <span class ="job">andert97@uw.edu</span>
   </div>
   <div>
      <p class = "message">Want to see how we can help you?</p>
   </div>
   <div class = "message">
      <form action="" method="POST">
         <div>
            <p>Name: </p>
         </div>
         <label>
         <input id="name" type="text" name="name" size="50"></input>
         </label>
         <br></br>
         <div>
            <p>Email: </p>
         </div>
         <label>
         <input id="email" type="email" name="_replyto" size="50"></input>
         </label>
         <br></br>
         <br></br>
         <textarea class="textarea" name="message" rows="10" cols="54" placeholder="Your message here..."></textarea>
         <br/>
         <input id="submit" type="submit" value="Send" ></input>
      </form>
   </div>
</body>
);
}
}
export default About;