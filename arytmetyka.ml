(************************************************)
(* Zadanie o arytmetyce niedokładnych wartości. *)
(************************************************)

(* Autor: Michał Kimborowicz *)
(* Sprawdzający: Paweł Dec *)

type wartosc = float * float

(* Przyda się w niedalekiej przyszłości *)

let zero : wartosc = ((0., 0.) : wartosc)

let minus1 : wartosc = ((-1., -1.) : wartosc)

let wszystko = ((neg_infinity, infinity) : wartosc)

let jest_zle (x : wartosc) : bool =
  if compare nan (fst x) = 0 || compare nan (fst x) = 0 then true else false

let rec ok (x : wartosc) : wartosc =
  if fst x = infinity then ok (neg_infinity, snd x)
  else if snd x = neg_infinity then ok (fst x, infinity)
  else if 1. /. fst x = neg_infinity then ok (0., snd x)
  else if 1. /. snd x = neg_infinity then ok (fst x, 0.)
  else x

let lepsze_mnozenie (x : float) (y : float) : float =
  if x = 0. || y = 0. then 0. else x *. y

let przypadki_mnozenia (x : wartosc) (y : wartosc) : wartosc =
  if fst x > 0. then
    if snd y >= 0. then
      if lepsze_mnozenie (snd x) (snd y) < lepsze_mnozenie (fst x) (fst y) then
        ok (lepsze_mnozenie (fst x) (fst y), lepsze_mnozenie (snd x) (snd y))
      else wszystko
    else ok (lepsze_mnozenie (fst x) (fst y), lepsze_mnozenie (fst x) (snd y))
  else wszystko

(* Konstruktory *)

let wartosc_dokladnosc (x : float) (p : float) : wartosc =
  ( min (x -. lepsze_mnozenie (p /. 100.) x) (x +. lepsze_mnozenie (p /. 100.) x)
  , max (x -. lepsze_mnozenie (p /. 100.) x) (x +. lepsze_mnozenie (p /. 100.) x)
  )

let wartosc_od_do (x : float) (y : float) : wartosc = (x, y)

let wartosc_dokladna (x : float) : wartosc = (x, x)

(* Selektory *)

let in_wartosc (x : wartosc) (y : float) : bool =
  if jest_zle x then false
  else if fst x <= snd x then y >= fst x && y <= snd x
  else y <= snd x || y >= fst x

let min_wartosc (x : wartosc) : float =
  if jest_zle x then nan
  else if fst x <= snd x then fst x
  else min neg_infinity (fst x)

let max_wartosc (x : wartosc) : float =
  if jest_zle x then nan
  else if fst x <= snd x then snd x
  else max infinity (fst x)

let sr_wartosc (x : wartosc) : float =
  if jest_zle x then nan else (min_wartosc x +. max_wartosc x) /. 2.

(* Modyfikatory *)

let rec plus (x : wartosc) (y : wartosc) : wartosc =
  if jest_zle x || jest_zle y then (nan, nan)
  else if fst x <= snd x then
    if fst y <= snd y then ok (fst x +. fst y, snd x +. snd y)
    else if fst x +. fst y <= snd x +. snd y then (neg_infinity, infinity)
    else ok (fst x +. fst y, snd x +. snd y)
  else if fst y <= snd y then ok (plus y x)
  else wszystko

let minus (x : wartosc) (y : wartosc) : wartosc =
  if jest_zle x || jest_zle y then (nan, nan)
  else ok (plus x (-.snd y, -.fst y))

let rec razy (x : wartosc) (y : wartosc) : wartosc =
  if jest_zle x || jest_zle y then (nan, nan)
  else if x = zero || y = zero then zero
  else if x = minus1 then ok (-1. *. snd y, -1. *. fst y)
  else if y = minus1 then ok (-1. *. snd x, -1. *. fst x)
  else if fst x <= snd x then
    if fst y <= snd y then
      ok
        ( ( min
              (min
                 (lepsze_mnozenie (fst x) (fst y))
                 (lepsze_mnozenie (fst x) (snd y)) )
              (min
                 (lepsze_mnozenie (snd x) (fst y))
                 (lepsze_mnozenie (snd x) (snd y)) )
          , max
              (max
                 (lepsze_mnozenie (fst x) (fst y))
                 (lepsze_mnozenie (fst x) (snd y)) )
              (max
                 (lepsze_mnozenie (snd x) (fst y))
                 (lepsze_mnozenie (snd x) (snd y)) ) )
          : wartosc )
    else if snd x < 0. then ok (razy minus1 (razy (razy minus1 x) y))
    else if fst y < 0. then ok (razy minus1 (razy x (razy minus1 y)))
    else ok (przypadki_mnozenia x y)
  else if fst y <= snd y then ok (razy y x)
  else if in_wartosc x 0. || in_wartosc y 0. then wszystko
  else
    ok
      ( min (lepsze_mnozenie (fst x) (fst y)) (lepsze_mnozenie (snd x) (snd y))
      , max (lepsze_mnozenie (fst x) (snd y)) (lepsze_mnozenie (snd x) (fst y))
      )

let podzielic (x : wartosc) (y : wartosc) : wartosc =
  if jest_zle x || jest_zle y then (nan, nan)
  else if y = wszystko then ok (razy x y)
  else if y = zero then (nan, nan)
  else ok (razy x (ok (1. /. snd y, 1. /. fst y)))
