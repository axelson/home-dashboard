import React from 'react';
import {RootContainer, RootElement, TheFold} from 'react-server';

import Header from '../components/common/Header.jsx';
import HelloWorld from '../components/hello-world';

export default class SimplePage {
  getElements() {
    return <RootContainer>
      <RootElement>
        <Header />
      </RootElement>
      <RootElement>
        <HelloWorld/>
      </RootElement>
      <TheFold />
    </RootContainer>
  }

  getMetaTags() {
    return [
      {charset: 'utf8'},
      {'http-equiv': 'x-ua-compatible', 'content': 'ie=edge'},
      {name: 'viewport', content: 'width=device-width, initial-scale=1'},
      {name: 'description', content: 'hello world, powered by React Server'},
      {name: 'generator', content: 'React Server'},
    ];
  }
}
