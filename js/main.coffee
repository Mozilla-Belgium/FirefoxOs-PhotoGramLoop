class App

  @capturedImage
  @layerImage
  @canvas

  constructor: () ->

  init: () ->

  gramify: (onSuccess) ->
    @canvas = document.getElementById("canvas")
    @ctx = canvas.getContext("2d")
    @capturedImage = @loadImage('images/demo.jpg', @onLoad)
    @layerImage = @loadImage('images/layer-1.png', @onLoad)
    @imagesLoaded = 0

  onLoad: () =>
      @imagesLoaded += 1

      if @imagesLoaded == 2
          @ctx.drawImage(@capturedImage, 0, 0, 320,240)          
          @ctx.globalAlpha = 0.5
          @ctx.drawImage(@layerImage, 0, 0)
      
  loadImage: (src, onload) ->
      img = new Image();
      img.onload = onload;
      img.src = src;
      return img

# Document ready
$ ->
  app = new App()
  app.init()
  app.gramify()