(* Program odwracajacy kolejnosc cyfr w liczbie naturalnej *)

let odw x =
    let rec helper x accu =
        if x = 0
        then 
            accu
        else 
            let accumulate x accu = 10 * accu + x mod 10
            in helper (x / 10) (accumulate x accu)
    in helper x 0;;