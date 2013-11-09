class App

  @capturedImage
  @layerImage
  @canvas

  @imageWidth = 320
  @imageHeight = 240

  constructor: () ->

  init: () ->
    @bind()
    @screenList()

  bind: () ->
    $('body').on('click','#home', () =>
        @screenList()
    )

    $('body').on('click','#addPic', () =>
        @screenPicture()
    )

    $('body').on('click','#help', () =>
        @screenHelp()
    )

  screenList: () ->
    @displayScreen('#screen-list')

  screenPicture: () ->
    @displayScreen('#screen-picture')
    @gramify()

  screenHelp: () ->
    @displayScreen('#screen-help')    

  displayScreen: (selector) ->
    $('.screen').hide()
    $(selector).show()

  gramify: (onSuccess) ->
    console.log('gramify')
    @canvas = document.getElementById("canvas")
    @ctx = canvas.getContext("2d")
    @capturedImage = @loadImage('images/demo.jpg', @onLoad)
    @layerImage = @loadImage('images/layer-1.png', @onLoad)
    @imagesLoaded = 0

  onLoad: () =>
    @imagesLoaded += 1

    if @imagesLoaded == 2
        @ctx.drawImage(@capturedImage, 0, 0, 320, 240)          
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