class App

  constructor: () ->

    @canvas = document.getElementById("canvas")
    @ctx = canvas.getContext("2d")
    @img1 = @loadImage('images/demo-1.jpg', @onLoad)
    @img2 = @loadImage('images/layer-1.png', @onLoad)
    @imagesLoaded = 0

  onLoad: () =>
      @imagesLoaded += 1

      if @imagesLoaded == 2
          @ctx.drawImage(@img1, 0, 0)          
          @ctx.globalAlpha = 0.5
          @ctx.drawImage(@img2, 0, 0)
      
  loadImage: (src, onload) ->
      img = new Image();
      img.onload = onload;
      img.src = src;
      return img

# Document ready
$ ->
  app = new App()