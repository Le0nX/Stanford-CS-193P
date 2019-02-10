struct Card {
    var x: Int
}

var xx = [Card]()

var y = Card(x: 5)

xx += [y ,y]

xx[0].x = 6

xx

