(* szybkie potegowanie *)

let rec pot a b =
  if b = 0 then 1
  else if b = 1 then a
  else if b mod 2 = 0 then pot (a * a) (b / 2)
  else pot (a * a) (b / 2) * a

(* szybkie potegowanie ogonowo *)

let pot a b =
  let rec pom x y z =
    if y <= 1 then if y = 0 then 1 else z
    else pom (x * x) (y / 2) (if y mod 2 = 0 then z * x else z * x * x) in
  pom a b a

(* lista pierwszych n liczb naturalnych *)

let f n =
  let rec pom x y = if x = y then [] else x :: pom (x + 1) y in
  pom 0 n

(* zdubluj elementy listy *)

let rec f l = match l with [] -> [] | h :: t -> h :: h :: f t

(* ostatni element listy *)

let rec f l = if List.length l = 1 then List.hd l else f (List.tl l)

(* rozpakuj *)

let rec f l =
  match l with
  | [] -> []
  | [(a, 0)] -> []
  | [(a, b)] -> a :: f [(a, b - 1)]
  | (a, 0) :: x -> f (List.tl l)
  | (a, b) :: x -> a :: f ((a, b - 1) :: List.tl l)

(* mieszanie *)

let rec f x y =
  match (x, y) with
  | [], [] -> []
  | [], ay :: by -> by
  | ax :: bx, [] -> bx
  | ax :: bx, ay :: by -> ax :: ay :: f bx by

(* lista wszystkich ogonow *)

let rec f l = match l with [] -> [[]] | x -> x :: f (List.tl x)

(* para min i max z listy *)

let f l =
  let rec pom l a b =
    match l with
    | [] -> (a, b)
    | [x] -> (min a x, max b x)
    | x :: y :: t ->
        if x < y then pom (List.tl l) (min a x) (max b y)
        else pom (List.tl l) (min a y) (max b x) in
  pom (List.tl l) (List.hd l) (List.hd l)

(* znalezc lidera *)

let lid l =
  let rec pom c k l =
    match l with
    | [] -> c
    | h :: t ->
        if h = c then pom c (k + 1) t
        else if k = 0 then pom h 1 t
        else pom c (k - 1) t in
  pom 0 0 l

(* dzielenie na kolejne listy *)

let f l =
  let rec pom l m k =
    match l with
    | [] -> []
    | h :: t ->
        let m = max m h in
        let k = k + 1 in
        let p = pom t m k in
        if m = k then [h] :: p else (h :: List.hd p) :: List.tl p in
  pom l 0 0

type 'a tree = Node of 'a * 'a tree list

let p x = x mod 2 = 0
let exist p l = List.filter p l <> []

let exist p l =
  try List.fold_left (fun a x -> if p x then failwith "asdf" else a) false l
  with _ -> true

let non p x = not (p x)
let for_all p l = not (exist (non p) l)
let append la lb = List.fold_right (fun x a -> x :: a) la lb

(* let rec list_compose l =
   match l with [] -> fun x -> x | h :: t -> h list_compose t *)

let list_compose l = List.fold_right ( @@ ) l

let heads l =
  l |> List.map (function h :: _ -> [h] | [] -> []) |> List.flatten

let heads l = List.flatten (List.map (function h :: _ -> [h] | [] -> []) l)

let sumy l =
  List.fold_left (fun a x -> (x + List.hd a) :: a) [0] l |> List.rev |> List.tl

let codrugi l =
  List.fold_left
    (fun (p, a) x -> if p then (not p, x :: a) else (not p, a))
    (true, []) l
  |> (function _, x -> x)
  |> List.rev

let ciekawa l =
  List.fold_right
    (fun x a ->
      match List.hd a with
      | h :: _ -> if h <> x then (x :: List.hd a) :: List.tl a else [x] :: a
      | [] -> [x] :: List.tl a )
    l [[]]

let wzrost l =
  let f x a =
    match a with
    | nl, nd, al, ad ->
        if ad = 0 then if nd = 0 then ([x], 1, [x], 1) else (nl, nd, [x], 1)
        else if x < List.hd al then
          if ad + 1 > nd then (x :: al, ad + 1, x :: al, ad + 1)
          else (nl, nd, x :: al, ad + 1)
        else (nl, nd, [x], 1) in
  match List.fold_right f l ([], 0, [], 0) with ans, _, _, _ -> ans

let ekstrema l =
  let f a x =
    match a with
    | mi, mic, ma, mac ->
        if x = mi && x = ma then (mi, mic + 1, ma, mac + 1)
        else if x > ma then (mi, mic, x, 1)
        else if x = ma then (mi, mic, ma, mac + 1)
        else if x < mi then (x, 1, ma, mac)
        else if x = mi then (mi, mic + 1, ma, mac)
        else a in
  match List.fold_left f (List.hd l, 1, List.hd l, 1) (List.tl l) with
  | a, b, c, d -> if a = c then b else b + d

type tree = Node of tree list

let skok3 t =
  let rec fa a (Node l as t) = List.fold_left fb (t :: a) l
  and fb a (Node l as t) = t :: List.fold_left fa a l in
  fa [] t
