⍝ Generating an empty grid (0) with random start (1) and end (2)
gen←{
     floor←⍵⍴0
     ((?⍵)⌷floor)←1
     ((?⍵)⌷floor)←2
     floor
 }
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
     ×/⍺=⍵:⊂⍵
     A←5 5 ⍝ Hard-coded 5x5 grid for now
     adjs←A adj ⍺
     targs←,(⍴adjs)⍴⊂⍵
     (X Y)←↓[1]↑↑targs-adjs
     nxt←⊃adjs[⊃⍋((X*2)+(Y*2))*0.5]
     (⊂⍺),nxt ∇ ⍵
}
⍝ Solving a generated grid ⍵
slv←{
     grd←⍵
     grd[¯1↓1↓(⊃⍸1=grd)astar(⊃⍸2=grd)]←3
     grd
}
⍝ Solve & draw next floor
nxt←{
     ⍺←5 5
     '·AB×'[1+slv gen ⍺]
 }
⍝ Examples
)copy display
PP←DISPLAY
PP a←5 5            ⍝ Area of grid
PP grid←gen a       ⍝ Generated grid w/ 0 (empty) 1 (start) 2 (end) tiles
PP solved←slv grid  ⍝ Added path (3) to grid from 1 (start) to 2 (end)
PP nxt a            ⍝ Solve & draw the next floor   