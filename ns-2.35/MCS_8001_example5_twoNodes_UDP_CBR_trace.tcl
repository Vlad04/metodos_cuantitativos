#Create a simulator object
set ns [new Simulator]

#Open the nam trace file
set nf [open out1.nam w]
$ns namtrace-all $nf

#Enabling tracing of all events of the simulation
set f [open out.all w]
$ns trace-all $f

#Define a 'finish' procedure
proc finish {} {
        global ns nf f
        $ns flush-trace
	#Close the trace file
        close $nf
        close $f
	#Execute nam on the trace file
        exec nam out1.nam &
        exit 0
}

#Create two nodes
set n0 [$ns node]
set n1 [$ns node]

#Create a duplex link between the nodes
$ns duplex-link $n0 $n1 1Mb 10ms DropTail

$ns duplex-link-op $n0 $n1 orient right

#Create a UDP agent and attach it to node n0
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

# Create a CBR traffic source and attach it to udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0

#Null agent which acts as traffic sink
set null0 [new Agent/Null] 
$ns attach-agent $n1 $null0

# the two agents have to be connected with each other
$ns connect $udp0 $null0

$ns at 0.5 "$cbr0 start"
$ns at 4.5 "$cbr0 stop"

#Call the finish procedure after 5 seconds of simulation time
$ns at 5.0 "finish"

#Run the simulation
$ns run

