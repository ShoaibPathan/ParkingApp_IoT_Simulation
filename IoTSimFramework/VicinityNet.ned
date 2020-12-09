package vicinityparking.simulations;

import vicinityparking.ioDevice;
import vicinityparking.Switch;



//VICINITYPARKING
import virtualVicinity.Adapter.VicinityAccesspoint;


import inet.node.inet.StandardHost;
import inet.visualizer.integrated.IntegratedVisualizer;

network VicinityNet
{
    parameters:
        @display("bgb=899,358;i=background/streetmap");
		int numHosts;

    submodules:
      
        car[numHosts]: StandardHost {
            @display("i=misc/car;p=706.5975,199.78874;is=vl");
        }
        visualizer: IntegratedVisualizer {
           @display("p=50,50");
        }
      
        Switch: Switch {
            parameters:
                propDelay = 1ms;

                @display("p=221,256");
            gates:
                gate[4];
        }

        VicinityAccesspoint: VicinityAccesspoint {
            @display("p=82,256");
            gates:
                gate;
        }

        floorSensor: ioDevice {
            @display("p=426,257");
            gates:
                gate;
        }

        visualIndicator: ioDevice {
            @display("i=block/wtx;p=221,36");
            gates:
                gate;
        }


        accessCamera: ioDevice {
            @display("i=misc/securitycamera;p=579.04877,49.665");
            gates:
                gate;
        }


    connections:
        VicinityAccesspoint.gate <--> Switch.gate[0];
        accessCamera.gate <--> Switch.gate[1];
        visualIndicator.gate <--> Switch.gate[2];
        floorSensor.gate <--> Switch.gate[3];
}


