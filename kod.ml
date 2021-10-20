(* Program kodujacy dwie liczby naturalne w jedna *)

let zakoduj l1 l2 =
    let rec helper res l1 l2 =
        if l1 = 0 && l2 = 0
        then res
        else helper (100 * res + 10 * (l1 mod 10) + l2 mod 10) (l1 / 10) (l2 / 10)
    in helper 0 l1 l2

let odkoduj2 kod =
    let rec helper kod l2 =
        if kod = 0
        then l2
        else helper (kod / 100) (10 * l2 + kod mod 10)
    in helper kod 0

let odkoduj1 kod = 
    odkoduj2 (kod / 10)

let odkoduj3 x = x;;