(*                                      
                         CS 51 Problem Set 6
                                Search
 
                             Collections
 *)

(*======================================================================
Before working on this problem set, read the problem set 6 writeup in
the textbook. It provides context and crucial information for
completing the problems. In addition, make sure that you are familiar
with the problem set procedures in the document "Problem set
procedures for CS51". 

You are allowed (and encouraged) to work with a partner on this
problem set. You are also allowed to work alone, if you prefer. See
https://cs51.io/guides/procedures/pset-instructions/#working-with-a-partner
for further information on working with partners on problem sets.
======================================================================*)

(* The `COLLECTION` module signature is a generic data structure
   generalizing stacks, queues, and priority queues, allowing adding
   and taking elements. This file provides the signature and several
   functors implementing specific collections (stacks, queues,
   etc.).
 *)
module type COLLECTION = 
sig

  (* Empty -- Exception indicates attempt to take from an empty
     collection *)
  exception Empty
              
  (* elements in the collection *)
  type elt
         
  (* collections themselves *)
  type collection
         
  (* empty -- the empty collection, collection with no elements *)
  val empty : collection 
                
  (* length col -- Returns number of elements in the collection col *)
  val length : collection -> int
                              
  (* is_empty col -- Returns true if and only if the collection col is
     empty *)
  val is_empty : collection -> bool
                                
  (* add elt col -- Returns a collection like col but with an element
     elt added *)
  val add : elt -> collection -> collection
                                  
  (* take col -- Returns a pair of an element from the collection and
     the collection of the remaining elements; raises Empty if the
     collection is empty. Which element is taken is determined by the
     implementation. *)
  val take : collection -> elt * collection
                                  
end
  
(*----------------------------------------------------------------------
  Some useful collections

  To think about: For each of these implementations, what is the time
  complexity for adding and taking elements in this kind of
  collection?  *)

(*......................................................................
  Stacks implemented as lists 
 *)
    
module MakeStackList (Element : sig type t end)
       : (COLLECTION with type elt = Element.t) = 
  struct
    exception Empty

    type elt = Element.t
    type collection = elt list

    let empty : collection = []

    let is_empty (d : collection) : bool = 
      d = empty 
            
    let length (d : collection) : int = 
      List.length d
                  
    let add (e : elt) (d : collection) : collection = 
      e :: d;;
      
    let take (d : collection) :  elt * collection = 
      match d with 
      | hd :: tl -> (hd, tl)
      | _ -> raise Empty
end

(*......................................................................
  Queues implemented as lists 
 *)
  
module MakeQueueList (Element : sig type t end)
       : (COLLECTION with type elt = Element.t) =
  struct        
    exception Empty
                
    type elt = Element.t
    type collection = elt list
                          
    let empty : collection = []
                               
    let length (d : collection) : int = 
      List.length d
                  
    let is_empty (d : collection) : bool = 
      d = empty 
            
    let add (e : elt) (d : collection) : collection = 
      d @ [e];;
      
    let take (d : collection)  :  elt * collection = 
      match d with 
      | hd :: tl -> (hd, tl)
      | _ -> raise Empty
  end

(*......................................................................
  Queues implemented as two stacks
  
  In this implementation, the queue is implemented as a pair of stacks
  (s1, s2) where the elements in the queue from highest to lowest
  priority (first to last to be taken) are given by s1 @ s2R (where
  s2R is the reversal of s2). Elements are added (in stack regime) to
  s2, and taken from s1. When s1 is empty, s2 is reversed onto s1. See
  Section 15.5.2 in Chapter 15 for more information on this
  technique. *)


module MakeQueueStack (Element : sig type t end) 
       : (COLLECTION with type elt = Element.t) =
  struct
    (* ...your implementation goes here... *)
    exception Empty

    type elt = Element.t
    type collection = {stk1: elt list; stk2 : elt list}

    let empty : collection = {stk1 = []; stk2 = []}

    let is_empty (d : collection) : bool = 
      d = empty 
            
    let length ({stk1 : elt list; stk2 : elt list}) : int = 
      List.length (stk1 @ stk2)
                  
    let add (e : elt) ({stk1 : elt list; stk2 : elt list}) : collection = 
      {stk1 = stk1; stk2 = e :: stk2}
      
    let take ({stk1 : elt list; stk2 : elt list}) :  elt * collection = 
      match stk1 with 
      | hd :: tl -> hd, {stk1 = tl; stk2 = stk2}
      | [] -> match List.rev stk2 with
              | hd :: tl -> hd, {stk1 = tl; stk2 = []}
              | [] -> raise Empty
    

  end

(*======================================================================
Reflection on the problem set

After each problem set, we'll ask you to reflect on your experience.
We care about your responses and will use them to help guide us in
creating and improving future assignments.

........................................................................
Please give us an honest (if approximate) estimate of how long (in
minutes) this problem set (in total, not just this file) took you to
complete. (If you worked with a partner, we're asking for how much time
each of you (on average) spent on the problem set, not in total.)
......................................................................*)

let minutes_spent_on_pset () : int =
  600 ;;

(*......................................................................
It's worth reflecting on the work you did on this problem set. Where
did you run into problems and how did you end up resolving them? What
might you have done in retrospect that would have allowed you to
generate as good a submission in less time? Please provide us your
thoughts on these questions and any other reflections in the string
below.
......................................................................*)

let reflection () : string =
  "This pset I cruised pretty quickly through the collections portion
  of the pset. And then, when I got to puzzle solve I struggled with
  working through the logic of how to solve the puzzle. I wish that I 
  would have more closely read the text and some of the examples 
  because I would have been able to work out the logic of solving
  the puzzles in a quicker and more organized fashion. I felt like I 
  reverted back to my old habits of jumping into the code too quick
  rather than planning out my logic in a clean and readable way before
  attacking the code." ;;
