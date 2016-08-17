import React, {PropTypes} from 'react';
import {Link, logging} from 'react-server';

import TrelloList from './TrelloList.jsx'
import IncomingListStatus from './IncomingListStatus.jsx'

import './dashboard.scss'

const logger = logging.getLogger(__LOGGER__);

export default class Dashboard extends React.Component {
  render() {
    const { cards } = this.props

    return (
      <div>
        <h2>Jashboard 2</h2>
        <IncomingListStatus numItems={cards.length} />
        <TrelloList cards={cards} />
        <Link path='/' reuseDom>Back</Link>
      </div>
    );
  }
}

Dashboard.propTypes = {
  cards: PropTypes.array,
}
