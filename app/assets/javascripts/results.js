  $(document).ready(function() {
    var type = $('#type').data('type');
    $('.roundabout-holder').roundabout();
    if(type == 'movie'){
      setMovieBackgroundImage();
    }else{
      setGameBackgroundImage();
    }
    initializeRoundaboutClick(type);
  });

  // On click, set the background image to the image in focus.
  function initializeRoundaboutClick(type){
    $('.roundabout-image').click(function(){
      if(type=='movie'){
        setMovieBackgroundImage();
      }else{
        setGameBackgroundImage();
      }
    });
  }

  function setBackgroundImage(type){
    var frontImage = $('.roundabout-in-focus img');
    if(type == 'game'){
      var url = frontImage.attr('src').replace('thumb','original');
    }else if(type == 'movie'){
      var url = frontImage.data('backdrop');
    }
  }

  function setMovieBackgroundImage(){
    setTimeout(function(){
      var frontImage = $('.roundabout-in-focus img');
      var url = frontImage.data('backdrop');
      $('body').css('background-image', 'url('+url+')');
      $('body').css('background-size', 'cover');
      $('body').css('background-repeat', 'no-repeat');
      $('#game-movie-music-title').html(frontImage.data('title'));
    }, 1000);
  }

  function setGameBackgroundImage(){
    setTimeout(function(){
      var frontImage = $('.roundabout-in-focus img');
      var url = frontImage.attr('src').replace('thumb','original');
      $('body').css('background-image', 'url('+url+')');
      $('body').css('background-size', 'cover');
      $('body').css('background-repeat', 'no-repeat');
      $('#game-movie-music-title').html(frontImage.data('title'));
    }, 1000);
  }