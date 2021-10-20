(* Program obliczajacy podloge z pierwiastka kwadratowego liczby *)

let sqrt x = 
    let rec helper suma ostatni_dodany =
        if suma > x
        then ostatni_dodany - 1
        else helper (suma + 2 * ostatni_dodany + 1) (ostatni_dodany + 1)
    in helper 0 0;;