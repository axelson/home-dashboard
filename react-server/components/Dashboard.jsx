import React, {PropTypes} from 'react';
import {Link, logging} from 'react-server';

import TrelloList from './TrelloList.jsx'
import IncomingListStatus from './IncomingListStatus.jsx'

import './dashboard.scss'

const logger = logging.getLogger(__LOGGER__);

export default class Dashboard extends React.Component {
  render() {
    const { incomingCards, todoCards } = this.props

    return (
      <div className='dashboard'>
        <h1>Jashboard</h1>
        <div className='dashboard-body'>
          <div className='dashboard-column'>
            <h2>Incoming!</h2>
            <IncomingListStatus numItems={incomingCards.length} />
            <TrelloList cards={incomingCards} />
          </div>
          <div className='dashboard-column'>
            <h2>TODO</h2>
            <IncomingListStatus numItems={todoCards.length} />
            <TrelloList cards={todoCards} />
          </div>
        </div>
        <Link path='/' reuseDom>Back</Link>
      </div>
    );
  }
}

Dashboard.propTypes = {
  incomingCards: PropTypes.array,
  todoCards: PropTypes.array,
}
