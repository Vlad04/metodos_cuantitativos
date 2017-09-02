# TCL code
if { $argc < 1 } {
 puts stderr " Need packet size parameter "
 exit 0
}
set packet_size [lindex $argv 1]
puts $packet_size
#Create a simulator object
set ns [new Simulator]
#Enabling tracing of all events of the simulation
set f [open out6.all w]
$ns trace-all $f
puts "CBR packet size = $packet_size"
