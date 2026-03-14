jQuery(document).ready( () => {

  var windowXArray = [], windowYArray = [];

  for (var i = 0; i < $(window).innerWidth(); i++) {
    windowXArray.push(i);
  }

  for (var i = 0; i < $(window).innerHeight(); i++) {
    windowYArray.push(i);
  }

  randomPlacement = (array) => array[Math.floor(Math.random() * array.length)];

  var canvas = oCanvas.create({
    canvas: '#canvas',
    background: '#111',
    fps: 60 
  });


  setInterval(function () {
    var rectangle = canvas.display.ellipse({
      x: randomPlacement(windowXArray),
      y: randomPlacement(windowYArray),
      origin: { x: 'center', y: 'center' },
      radius: 0,
      fill: '#27ae60',
      opacity: 1 
    });

    canvas.addChild(rectangle);

    rectangle.animate(
      {
        radius: 12,
        opacity: 0 
      },
      {
        duration: '1000',
        easing: 'linear',
        callback: () => { }
      }
    );
  }, 100);


  $(window).resize( () => {
    canvas.width = $(window).innerWidth();
    canvas.height = $(window).innerHeight();
  });

  $(window).resize();
});