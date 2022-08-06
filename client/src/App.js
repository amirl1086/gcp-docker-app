import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import './App.css';
import Fib from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          {/* <img src={logo} className="App-logo" alt="logo" />
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
          <Link to="/">Home</Link>
          <Link to="/otherpage">Other Page</Link> */}
          Fibonacci sequence calculator
        </header>
        <div>
          <Route exact path="/" component={Fib} />
          {/* <Route path="/otherpage" component={OtherPage} /> */}
        </div>
      </div>
    </Router>
  );
}

export default App;
