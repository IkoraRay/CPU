onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu/Clock
add wave -noupdate /cpu/Resetn
add wave -noupdate /cpu/Address
add wave -noupdate /cpu/instruction
add wave -noupdate /cpu/Ri
add wave -noupdate /cpu/Rj
add wave -noupdate /cpu/Rk_ime
add wave -noupdate /cpu/Result
add wave -noupdate /cpu/ime_ext
add wave -noupdate /cpu/Operator2
add wave -noupdate /cpu/RegDst
add wave -noupdate /cpu/RegWrite
add wave -noupdate /cpu/MovCond
add wave -noupdate /cpu/MemtoReg
add wave -noupdate /cpu/MemWrite
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 500ps -dutycycle 50 -starttime 0ps -endtime 5000ps sim:/cpu/Clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 5000ps sim:/cpu/Resetn 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps Edit:/cpu/Resetn 
WaveCollapseAll -1
wave clipboard restore
