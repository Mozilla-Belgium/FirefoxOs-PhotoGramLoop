class App

  @capturedImage
  @layerImage
  @canvas
  @imageWidth
  @imageHeight
  @pictureSrc

  constructor: () ->
    @canvas = $("canvas")
    @imageWidth = @canvas.width()
    @imageHeight = @canvas.height()
    @pictureSrc = "images/demo.jpg"

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
    @ctx = @canvas.get(0).getContext("2d")
    @capturedImage = @loadImage(@pictureSrc, @onLoad)
    @layerImage1 = @loadImage('images/layerfox-1.png', @onLoad)
    @layerImage2 = @loadImage('images/layerfox-2.png', @onLoad)
    @layerColor = @loadImage('images/layerfox-blue.png', @onLoad)
    @imagesLoaded = 0

  onLoad: () =>
    @imagesLoaded += 1

    console.log(@imageWidth)
    console.log(@imageHeight)    

    if @imagesLoaded == 3
        @ctx.drawImage(@capturedImage, 0, 0, @imageWidth, @imageHeight)
        @ctx.globalAlpha = 0.7
        @ctx.drawImage(@layerColor, 0, 0, @imageWidth, @imageHeight)        
        @ctx.globalAlpha = 0.7
        @ctx.drawImage(@layerImage1, 0, 0, @imageWidth, @imageHeight)
        @ctx.globalAlpha = 1
        @ctx.drawImage(@layerImage2, 0, 0, @imageWidth, @imageHeight)
        @imagesLoaded = 0
      
  loadImage: (src, onload) ->
    img = new Image();
    img.onload = onload;
    img.src = src;
    return img

  loadPicture: (src) ->
    @pictureSrc = src
    @screenPicture()

# Document ready
$ ->
  app = new App()
  app.init()