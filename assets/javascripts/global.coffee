# Note sure what the responsiblities of this class should be
class Jashboard
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
    @getBoards()

  getBoards: ->
    $content = $('#cards').empty()
    $boardsContainer = $('#boards')
    Trello.members.get 'me', (member) ->
      $cards = $('<div>').text('Loading Cards...').appendTo($content)
      $boards = $('<div>').text('Loading Boards...').appendTo($boardsContainer)

      # TODO: store this in a promise
      Trello.get 'members/me/boards', (boards) ->
        $boards.empty()
        for board in boards
          html = ich.board(board)
          $boards.append(html)

        board = _.find(boards, (board) -> board.name == 'TODO')

        Trello.get "boards/#{board.id}/lists", (lists) ->
          list = lists.filter( (list) -> list.name == 'Incoming!' )[0]

          Trello.get "lists/#{list.id}/cards", (cards) ->
            $cards.empty()
            for card in cards
              html = ich.card(card)
              $cards.append(html)

$ ->
  jashboard = new Jashboard()
  console.log "created jashboard"
