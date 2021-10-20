(* Program obliczajacy stopien parzystosci liczby tzn. najwieksza potege dwojki taka ze dzieli ona liczbe *)

let sp x = 
    let rec helper x accu = 
        if x mod 2 = 1
        then accu
        else helper (x / 2) (accu + 1)
    in if x = 0 then -1 else helper x 0;;