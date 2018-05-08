//VOL ON STYLOPHONE ALL THE WAY UP, SET TO TONE 3, TUNED UP AS HIGH AS YOU CAN GO
//VOL ON 02 INPUT ON FOCUSRITE AT MINIMUM, SET SWITCH TO LINE
//SHOULD SEE NICE GREEN PULSES WITH EACH TAP

import ddf.minim.*; 
import ddf.minim.analysis.*; 
import themidibus.*; 

MidiBus myBus;
Minim minim;
AudioInput in;
FFT fft;
float noteCode = 0;

public void setup() {
    size(512, 200);
    
    minim = new Minim(this);
    in = minim.getLineIn();
    fft = new FFT(in.bufferSize(), in.sampleRate());

    myBus = new MidiBus(this, -1, "loopMIDI Port");
    
    stroke(255);
    
    fft.noAverages();
}

public void draw() {
    background(0);

    fft.forward(in.right);
    int maxBand = 0;

    for (int i = 0; i < fft.specSize(); i++) {
        line(i, height, i, height - fft.getBand(i) * 4);
        if (fft.getBand(i) > fft.getBand(maxBand) && fft.getBand(i) > 1) {
            maxBand = i;
        }
    }

   //println(maxBand);

    if (maxBand == 19 || maxBand == 96) {
        if (noteCode != 1) {
            myBus.sendNoteOn(1, 45, 100);
            noteCode = 1;
        }
        println("1 key is being played");
    } else if (maxBand == 20 || maxBand == 101) {
        if (noteCode != 1.5) {
            myBus.sendNoteOn(1, 46, 100);
            noteCode = 1.5;
        }
        println("1.5 key is being played");
    } else if (maxBand == 107) {
        if (noteCode != 2) {
            myBus.sendNoteOn(1,47, 100);
            noteCode = 2;
        }
        println("2 key is being played");
    } else if (maxBand == 23 || maxBand == 114) {
        if (noteCode != 3) {
            myBus.sendNoteOn(1, 48, 100);
            noteCode = 3;
        }
        println("3 key is being played");
    } else if (maxBand == 24) {
        if (noteCode != 3.5) {
            myBus.sendNoteOn(1,49, 100);
            noteCode = 3.5;
        }
        println("3.5 key is being played");
    } else if (maxBand == 128) {
        if (noteCode != 4) {
            myBus.sendNoteOn(1, 50, 100);
            noteCode = 4;
        }
        println("4 key is being played");
    } else if (maxBand == 27 || maxBand == 135) {
        if (noteCode != 4.5) {
            myBus.sendNoteOn(1, 51, 100);
            noteCode = 4.5;
        }
        println("4.5 key is being played");
    } else if (maxBand == 29 || maxBand == 143) {
        if (noteCode != 5) {
            myBus.sendNoteOn(1, 52, 100);
            noteCode = 5;
        }
        println("5 key is being played");
    } else if (maxBand == 152) {
        if (noteCode != 6) {
            myBus.sendNoteOn(1, 53, 100);
            noteCode = 6;
        }
        println("6 key is being played");
    } else if (maxBand == 32 || maxBand == 161) {
        if (noteCode != 6.5) {
            myBus.sendNoteOn(1, 54, 100);
            noteCode = 6.5;
        }
        println("6.5 key is being played");
    } else if (maxBand == 34 || maxBand == 170) {
        if (noteCode != 7) {
            myBus.sendNoteOn(1, 55, 100);
            noteCode = 7;
        }
        println("7 key is being played");
    } else if (maxBand == 36 || maxBand == 181) {
        if (noteCode != 7.5) {
            myBus.sendNoteOn(1, 56, 100);
            noteCode = 7.5;
        }
        println("7.5 key is being played");
    } else if (maxBand == 38 || maxBand == 191) {
        if (noteCode != 8) {
            myBus.sendNoteOn(1, 57, 100);
            noteCode = 8;
        }
        println("8 key is being played");
    } else if (maxBand == 41 || maxBand == 203) {
        if (noteCode != 8.5) {
            myBus.sendNoteOn(1, 58, 100);
            noteCode = 8.5;
        }
        println("8.5 key is being played");
    } else if (maxBand == 43 || maxBand == 215) {
        if (noteCode != 9) {
            myBus.sendNoteOn(1, 59, 100);
            noteCode = 9;
        }
        println("9 key is being played");
    } else if (maxBand == 45 || maxBand == 46 || maxBand == 228) {
        if (noteCode != 10) {
            myBus.sendNoteOn(1, 60, 100);
            noteCode = 10;
        }
        println("10 key is being played");
    } else if (maxBand == 48 || maxBand == 241) {
        if (noteCode != 10.5) {
            myBus.sendNoteOn(1, 61, 100);
            noteCode = 10.5;
        }
        println("10.5 key is being played");
    } else if (maxBand == 51) {
        if (noteCode != 11) {
            myBus.sendNoteOn(1, 62, 100);
            noteCode = 11;
        }
        println("11 key is being played");
    } else if (maxBand == 54) {
        if (noteCode != 11.5) {
            myBus.sendNoteOn(1, 63, 100);
            noteCode = 11.5;
        }
        println("11.5 key is being played");
    } else if (maxBand == 57 || maxBand == 287) {
        if (noteCode != 12) {
            myBus.sendNoteOn(1, 64, 100);
            noteCode = 12;
        }
        println("12 key is being played");
    } else {
        println("No keys are being played!");
        if (noteCode == 1) {
            myBus.sendNoteOff(1, 45, 100);
        } else if (noteCode == 1.5) {
            myBus.sendNoteOff(1, 46, 100);
        } else if (noteCode == 2) {
            myBus.sendNoteOff(1,47, 100);
        } else if (noteCode == 3) {
            myBus.sendNoteOff(1, 48, 100);
        } else if (noteCode == 3.5) {
            myBus.sendNoteOff(1, 49, 100);
        } else if (noteCode == 4) {
            myBus.sendNoteOff(1, 50, 100);
        } else if (noteCode == 4.5) {
            myBus.sendNoteOff(1, 51, 100);
        } else if (noteCode == 5) {
            myBus.sendNoteOff(1, 52, 100);
        } else if (noteCode == 6) {
            myBus.sendNoteOff(1, 53, 100);
        } else if (noteCode == 6.5) {
            myBus.sendNoteOff(1, 54, 100);
        } else if (noteCode == 7) {
            myBus.sendNoteOff(1, 55, 100);
        } else if (noteCode == 7.5) {
            myBus.sendNoteOff(1,56, 100);
        } else if (noteCode == 8) {
            myBus.sendNoteOff(1, 57, 100);
        } else if (noteCode == 8.5) {
            myBus.sendNoteOff(1, 58, 100);
        } else if (noteCode == 9) {
            myBus.sendNoteOff(1, 59, 100);
        } else if (noteCode == 10) {
            myBus.sendNoteOff(1, 60, 100);
        } else if (noteCode == 10.5) {
            myBus.sendNoteOff(1, 61, 100);
        } else if (noteCode == 11) {
            myBus.sendNoteOff(1, 62, 100);
        } else if (noteCode == 11.5) {
            myBus.sendNoteOff(1, 63, 100);
        } else if (noteCode == 12) {
            myBus.sendNoteOff(1, 64, 100);
        }
        noteCode = 0;
    }
}