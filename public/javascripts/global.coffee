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
    console.log "got member"
    $cards = $('<div>').text('Loading Cards...').appendTo($content)
    $boards = $('<div>').text('Loading Boards...').appendTo($boardsContainer)

    Trello.get 'members/me/boards', (boards) ->
      $boards.empty()
      for board in boards
        html = ich.board(board)
        $boards.append(html)

    Trello.get 'members/me/cards', (cards) ->
      $cards.empty()
      for card in cards
        html = ich.card(card)
        $cards.append(html)
