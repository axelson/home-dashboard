import React, {PropTypes} from 'react';

import {shortLink} from '../services/trello'

import './trello-card.scss'

export default class TrelloCard extends React.Component {
  render() {
    const { trelloCard } = this.props

    return (
      <div className='trello-card'>
        <a href={shortLink(trelloCard)} target='_blank'>
          {trelloCard.name}
        </a>
      </div>
    )
  }
}

TrelloCard.propTypes = {
  trelloCard: PropTypes.object.isRequired,
}
