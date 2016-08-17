import React, {PropTypes} from 'react';

import TrelloCard from './TrelloCard.jsx'

import './trello-list.scss'

export default class TrelloList extends React.Component {
  render() {
    const { cards } = this.props

    return (
      <div className='trello-list'>
        {cards.map((card) => {
          return <TrelloCard key={card.id} trelloCard={card} />
        })}
      </div>
    )
  }
}

TrelloList.propTypes = {
  cards: PropTypes.array.isRequired,
}
