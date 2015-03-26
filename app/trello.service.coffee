angular.module('jashboard').factory('trello', ->
  trello = new MyTrello()
)

class MyTrello
  getBoards: _.memoize ->
    @getMember().then( (member) ->
      Q(Trello.get 'members/me/boards')
    )

  getBoard: _.memoize (boardName) ->
    @getBoards().then( (boards) ->
      board = _.find(boards, (board) -> board.name == boardName )
    )

  getList: _.memoize (boardId, listName) ->
    @getBoardLists(boardId).then( (lists) ->
      list = _.find(lists, (list) -> list.name = listName )
    )

  getMember: _.memoize ->
    Q(Trello.members.get 'me')

  getBoardLists: _.memoize (boardId) ->
    Q(Trello.get "boards/#{boardId}/lists")

  getListCards: _.memoize (listId) ->
    Q(Trello.get "lists/#{listId}/cards")
