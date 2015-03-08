Q.longStackSupport = true

# Note sure what the responsiblities of this class should be
class Connect
  constructor: ->
    @authorize()

    $("#connectLink").click =>
      Trello.authorize
        type: "popup"
        success: @onAuthorize

  authorize: ->
    Trello.authorize
      interactive:false
      success: @onAuthorize

  onAuthorize: =>
    $('#connectLink').hide()
    jashboard = new Jashboard()
    jashboard.display()


class Jashboard
  # Requires Trello to already be authorized
  constructor: ->

  # Display the dashboard
  display: ->
    @getIncomingList().done (incomingList) =>
      @displayCards(incomingList)
    @displayBoards()

  displayBoards: ->
    $boards= $('#boards')
    @getBoards().done (boards) ->
      $boards.empty()
      for board in boards
        html = ich.board(board)
        $boards.append(html)

  displayCards: (list) ->
    $cards = $('#cards')
    @getListCards(list.id).then( (cards) ->
      $cards.empty()
      for card in cards
        html = ich.card(card)
        $cards.append(html)
    ).done()

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

  getMember: _.memoize ->
    Q(Trello.members.get 'me')

  getBoardLists: _.memoize (boardId) ->
    Q(Trello.get "boards/#{boardId}/lists")

  getListCards: _.memoize (listId) ->
    Q(Trello.get "lists/#{listId}/cards")


$ ->
  connect = new Connect()
