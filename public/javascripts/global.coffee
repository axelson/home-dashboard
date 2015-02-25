$ ->
  Trello.authorize
    interactive:false
    success: onAuthorize

  $("#connectLink").click ->
    Trello.authorize
      type: "popup"
      success: onAuthorize

onAuthorize = ->
  $content = $('#cards').empty()
  $boardsContainer = $('#boards')
  $('#connectLink').hide()
  Trello.members.get 'me', (member) ->
    $cards = $('<div>').text('Loading Cards...').appendTo($content)
    $boards = $('<div>').text('Loading Boards...').appendTo($boardsContainer)

    # TODO: store this in a promise
    Trello.get 'members/me/boards', (boards) ->
      $boards.empty()
      for board in boards
        html = ich.board(board)
        $boards.append(html)

      # TODO: extract into method
      board = boards.filter( (board) -> board.name == 'TODO')[0]

      Trello.get "boards/#{board.id}/lists", (lists) ->
        list = lists.filter( (list) -> list.name == 'Incoming!' )[0]

        Trello.get "lists/#{list.id}/cards", (cards) ->
          $cards.empty()
          for card in cards
            html = ich.card(card)
            $cards.append(html)
