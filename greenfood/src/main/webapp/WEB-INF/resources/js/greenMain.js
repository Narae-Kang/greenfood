//메인 슬라이드 제이쿼리
$(function(){
    var container = $('.mainSlide'),
        slideGroup = container.find('.slideImg'),
        slides = slideGroup.find('a'),
        nav = container.find('.slideNav'),
        indicator = container.find('.slideIndicator'),
        slideCount = slides.length,
        indicatorHtml = '',
        currentIndex = 0,
        duration = 500,
        easing = 'easeInOutExpo',
        inerval = 2000,
        timer;
  
    slides.each(function(i){
        var newLeft = i * 100 + '%';
        $(this).css({left: newLeft });
        indicatorHtml += '<a href="">' +(i+1)+ '</a>';
        //console.log(indicatorHtml);
    }); //slides.each 끝

    indicator.html(indicatorHtml); 
    
    //슬라이드 이동함수
    function goToSlide(index) {
        slideGroup.animate({left: -100 * index + '%'}, duration, easing);
        currentIndex = index;
        //console.log(currentIndex); 
        updateNav();
    } // goToSlide 끝

    function updateNav() {
        var navPrev = nav.find('.prev');
        var navNext = nav.find('.next');
        if(currentIndex == 0) {
            navPrev.addClass('disabled');
        }else {
            navPrev.removeClass('disabled');
        }    
        if(currentIndex == slideCount -1) {
            navNext.addClass('disabled');
        }else {
            navNext.removeClass('disabled');
        }

        indicator.find('a').eq(currentIndex).addClass('active').
        siblings().removeClass('active');
    } // updateNav 끝

    //인디케이터로 이동하기
    indicator.find('a').click(function(e){
        e.preventDefault();
        var idx = $(this).index();
        goToSlide(idx);

        
    });
    nav.find('a').click(function(e) {
        e.preventDefault();
        if($(this).hasClass('prev')) {
            goToSlide(currentIndex - 1);
        } else {
            goToSlide(currentIndex + 1);
        }
    });
    updateNav();
    //자동 슬라이드
    function startTimer() {
        timer = setInterval(function(){
            var nextIndex = (currentIndex + 1) % slideCount; 
            goToSlide(nextIndex);
        }, inerval);
    }
    startTimer();

    function stopTimer() {
        clearInterval(timer);
    }
    container.mouseenter(function(){
        stopTimer()
    })
    .mouseleave(function(){
        startTimer()
    });
  });  // 메인 슬라이드 제이쿼리 끝