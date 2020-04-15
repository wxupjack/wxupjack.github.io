var audio = new Audio('chou.mp3');
var interval = 500;
var pressCount = 0;
// var playing = false;
var combo = { count: 0 };
Object.defineProperty(combo,'count',{
    set: function (value) {
        document.getElementById('combo').innerText = '臭气值：' + value;
        audio.volume = Math.max(Math.min(value / 30, 1), 0);
    }
})

function shout(params) {
    // if key pressed when playing, mark it
    pressCount++;
    combo.count = pressCount;
    if (audio.paused) {
        // paused state: audio is played form the start
        audio.currentTime = 0;
        // turn to playing state
        audio.play();
    }
    self.setTimeout(function () {
        // check if key pressed 
        pressCount--;
        combo.count = pressCount;
        if (pressCount <= 0) {
            // turn back to paused state
            // audio.currentTime = 0;
            audio.pause();
        }
    },
        timeout = interval)
    // console.log('playing: ', playing, 'pressCount: ', pressCount);
    return true
}