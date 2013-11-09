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
    @layerImage1 = @loadImage('images/layerfox-1.png', @onLoad)
    @layerImage2 = @loadImage('images/layerfox-2.png', @onLoad)
    @layerColor = @loadImage('images/layerfox-blue.png', @onLoad)
    @imagesLoaded = 0

  onLoad: () =>
    @imagesLoaded += 1

    if @imagesLoaded == 3
        @ctx.drawImage(@capturedImage, 0, 0, 320, 240)
        @ctx.globalAlpha = 0.7
        @ctx.drawImage(@layerColor, 0, 0, 320, 240)        
        @ctx.globalAlpha = 0.7
        @ctx.drawImage(@layerImage1, 0, 0, 320, 240)
        @ctx.globalAlpha = 1
        @ctx.drawImage(@layerImage2, 0, 0, 320, 240)
      
  loadImage: (src, onload) ->
    img = new Image();
    img.onload = onload;
    img.src = src;
    return img    

# Document ready
$ ->
  app = new App()
  app.init()