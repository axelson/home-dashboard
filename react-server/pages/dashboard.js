import React from 'react';
import {RootContainer, RootElement, TheFold, logging} from 'react-server';

import {
  INCOMING_LIST_ID,
  TODO_LIST_ID,
  TYPOGRAPHY_CSS,
} from '../services/constants'
import {fetchCards} from '../services/trello'

import Header from '../components/common/Header.jsx';
import Dashboard from '../components/Dashboard.jsx';

const logger = logging.getLogger(__LOGGER__);

export default class SimplePage {

  getScripts() {
    return [
    ]
  }

  getHeadStylesheets() {
    return [
      TYPOGRAPHY_CSS,
    ]
  }

  handleRoute(next) {
    const incomingCardsPr = fetchCards(INCOMING_LIST_ID)
    const todoCardsPr = fetchCards(TODO_LIST_ID)
    this.data = Promise.all([incomingCardsPr, todoCardsPr])
    .then(data => {
      return {incomingCards: data[0], todoCards: data[1]}
    })

    return next();
  }

  getElements() {
    return <RootContainer>
      <RootElement>
        <Header />
      </RootElement>
      <RootElement when={this.data}>
        <Dashboard/>
      </RootElement>
      <TheFold />
    </RootContainer>
  }

  getMetaTags() {
    return [
      {charset: 'utf8'},
      {'http-equiv': 'x-ua-compatible', 'content': 'ie=edge'},
      {name: 'viewport', content: 'width=device-width, initial-scale=1'},
      {name: 'description', content: "Jason's Dashboard"},
    ];
  }
}
