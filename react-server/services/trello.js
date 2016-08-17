import {ReactServerAgent} from 'react-server'

import {TRELLO_KEY, TRELLO_TOKEN} from './constants'

export function fetchLists () {
  return queryTrello('/lists')
  .then(resp => resp.body)
}

export function fetchCards (idList) {
  return queryTrello(`/lists/${idList}/cards`, {queryParameters: {fields: 'name,desc,shortLink'}})
  .then(resp => resp.body )
}

function queryTrello (route, options = {}) {
  const { queryParameters } = options
  const baseUrl = 'https://api.trello.com/1'
  const defaultQueryParameters = {
    key: TRELLO_KEY,
    token: TRELLO_TOKEN,
  }
  return ReactServerAgent
  .get(baseUrl + route)
  .query({...defaultQueryParameters, ...queryParameters})
}

export function shortLink (card) {
  return `https://trello.com/c/${card.shortLink}`
}
