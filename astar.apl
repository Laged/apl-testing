⍝ Adjacent tiles in a ⍺ sized grid for given position ⍵
adj←{
     cmpts←⍉↑¯1 0 1∘.,¯1 0 1
     dirs←,⊂[⎕IO]cmpts
     locs←9⍴⊂⍵
     tops←9⍴⊂⍺
     all←locs+dirs
     top←{0≤⌊/⍵}¨tops-all
     bot←0≠×/¨all
     (top∧bot) / all
}
⍝ Recursion towards goal
astar←{
     ×/⊃⍺=⍵:⍵
     A←5 5 ⍝ Hard-coded 5x5 grid for now
     adjs←A adj ⍺
     targs←,(⍴adjs)⍴⊂⍵
     (X Y)←↓[1]↑↑,/¨(targs-adjs)
     nxt←⊃adjs[⊃⍋((X*2)+(Y*2))*0.5]
     ,⍺,⊂nxt ∇ ⍵
}
⍝ Pretty-print with PP
)copy display
PP←DISPLAY
⍝ Examples
PP 1 1 astar 5 5
PP 2 2 astar 5 4
