angular.module('jashboard').factory('trello', ->
  trello = new MyTrello()
)

class MyTrello
  # TODO, replace with getList('TODO', 'Incoming!')
  getIncomingList: ->
    deferred = Q.defer()
    @getBoards().then( (boards) =>
      todoBoard = _.find(boards, (board) -> board.name == 'TODO')
      @getBoardLists(todoBoard.id).then( (lists) ->
        incomingList = _.find(lists, (list) -> list.name == 'Incoming!')
        deferred.resolve(incomingList)
      ).done()
    ).done()

    deferred.promise

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
