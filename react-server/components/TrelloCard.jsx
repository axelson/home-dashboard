import React, {PropTypes} from 'react';

import './trello-card.scss'

export default class TrelloCard extends React.Component {
  render() {
    const { trelloCard } = this.props

    return (
      <div className='trello-card'>
        {trelloCard.name}
      </div>
    )
  }
}

TrelloCard.propTypes = {
  trelloCard: PropTypes.object.isRequired,
}
