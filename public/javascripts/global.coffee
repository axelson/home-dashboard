console.log "Global coffee!"
$ ->
  Trello.authorize
    interactive:false,
    success: onAuthorize

  $("#connectLink").click ->
    Trello.authorize
      type: "popup"
      success: onAuthorize

onAuthorize = ->
  $content = $('#content').empty()
  console.log "on auth"
  Trello.members.get 'me', (member) ->
    console.log "got member"
    $cards = $('<div>').text('Loading Cards...').appendTo($content)

    Trello.get 'members/me/cards', (cards) ->
      $cards.empty()
      for card in cards
        $('<a>')
          .attr(href: card.url, target: 'trello')
          .addClass('card')
          .text(card.name)
          .appendTo($cards)
