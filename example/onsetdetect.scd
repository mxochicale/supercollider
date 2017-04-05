


(

// boot server, allocate buffers, load synth definition, start synth
s = Server.local;

s.boot.doWhenBooted {

    // use a file (MONO !) file to analyse, absolute path, for starting,
    // file can be changed later
    d = Buffer.read(s, "/home/map479-admin/mxochicale/supercollider/example/drumloop.wav");

    b = Buffer.alloc(s, 512);

    s.bootSync;

    SynthDef(\detectonsets, { arg buf, treshold=0.9, listen=1;
        var sig, chain, onsets, pips;

        // using a soundfile
        //sig = PlayBuf.ar(1, buf, BufRateScale.kr(buf), loop: 1);

        // or, use live input instead
        sig = SoundIn.ar(0);

        // Onsets works on the bins of an fft analysis
        chain = FFT(b, sig);

        onsets = Onsets.kr(chain, treshold, \rcomplex);
        // You'll hear percussive "ticks" whenever an onset is detected

        // This send to "/tr" which the OSC client can register to (see below)
        SendTrig.kr(onsets,0,1);

        pips = WhiteNoise.ar(EnvGen.kr(Env.perc(0.001, 0.1, 0.2), onsets));
        Out.ar(0, (Pan2.ar(sig, -0.75, 0.2) + Pan2.ar(pips, 0.75, 1)) * listen);

    }).add;

    // start the synth
    x = Synth(\detectonsets, [\buf, d])

};
)

x.free



// tune the synth --------------------------------------------------------------------

// change buffer while detector is running
f = "/home/map479-admin/mxochicale/supercollider/example/"
d = Buffer.read(s, f ++ "speech.wav");
x.set(\buf, d)
d = Buffer.read(s, f ++ "drumloop.wav");
x.set(\buf, d)


// detection treshold
x.set(\treshold, 0.5)
x.set(\treshold, 1)
x.set(\treshold, 2)
x.set(\treshold, 3)


// just for monitoring, if treshold is ok, then listen can be 0
x.set(\listen, 1)
x.set(\listen, 0) // be silent



// start sending OSC data ----------------------------------------------------------------------


(

// m and p are just for testing (the osc reception) locally
m = NetAddr("127.0.0.1", 57120); // localhost, default sclang port
p = OSCFunc({ "onset received".scramble.postln },'/test', m);

// actual receiver of OSC data, address (ip, port)
// listen to 'onsettrigger' osc message in your osc receiver (choose another port number)
n = NetAddr("127.0.0.1", 57120);

// register a function to be called upon receiving onsets from the synth through the SendTrig UGen (listen to /tr)
// send them over OSC
o = OSCFunc({ arg msg, time;
    [time, msg].postln;
    m.sendMsg('/test'); // for test
    n.sendMsg('/onsettrigger'); // receiver at 'n' should be listening to '/onsettrigger' tagged messages
},'/tr', s.addr);
)



s.quit

s.makeWindow


// clean up ----------------------------------------------------------------------
[x, o, p].do(_.free)
// [d, b].do(_.remove) // vv: jan-kees told me, i can't use free here, need to test it though

