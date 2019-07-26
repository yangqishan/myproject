<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>Bootstrap Admin Template </title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/apps/calendar.css">
</head>

<body> 

<!--====================================================
                         MAIN NAVBAR
======================================================-->
<jsp:include page="head.jsp"></jsp:include>


<!--====================================================
                        PAGE CONTENT
======================================================-->
    <div class="page-content d-flex align-items-stretch">

        <!--***** SIDE NAVBAR *****-->
        <jsp:include page="nav.jsp"></jsp:include>

        <div class="content-inner calendar-cont">

            <!--***** CALENDAR *****-->     
            <div class="row" id="calendar">
                <section id="modal">
                    <div class="wrapper">
                        <div class="content">
                            <div class="close"></div>
                            <div class="box"></div>
                        </div>
                    </div>
                </section>
                <section id="calendar" class="collectonme">
                    <div id="day-labels">
                        <div class="label bg-success text-center text-white ">Sun</div>
                        <div class="label bg-info text-center text-white">Mon</div>
                        <div class="label bg-warning text-center text-white">Tue</div>
                        <div class="label bg-info text-center text-white">Wed</div>
                        <div class="label bg-primary text-center text-white">Thu</div>
                        <div class="label bg-info text-center text-white">Fri</div>
                        <div class="label bg-success text-center text-white">Sat</div>
                    </div>
                    <div id="one" class="week">
                        <div class="day noDate"></div>
                        <div class="day noDate"></div>
                        <div class="day">
                            <span class="date">1</span>
                            <div class="surprise">
                                <h2>A Hilarious Design Classic</h2>
                                <p>For your first day, I present for your reading pleasure a wonderful classic comic by the incomparable Matthew Inman (aka The Oatmeal).</p>
                                <a class="button" href="#" >Read On</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">2</span>
                            <div class="surprise">
                                <h2>For Your Second Day, Some Humor</h2>
                                <p>A user interface is like a joke. If you have to explain it, chances are it's not that good.</p>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">3</span>
                            <div class="surprise">
                                <h2>And Now, to Waste Your Time</h2>
                                <p>This site has some great illustrations, some funny random stuff, and overall is just a champion time-waster, for those of you tired of Buzzfeed hell.</p>
                                <a href="#"  class="button">Visit Books of Adam</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">4</span>
                            <div class="surprise">
                                <h2>And Now - A History of Web Design</h2>
                                <p>Web design has been around for a while now, and it has a storied history. Webs.com and AmeriCommerce have put together a fun infographic to walk you down memory lane.</p>
                                <a class="button" href="#" >View the Infographic</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">5</span>
                            <div class="surprise">
                                <h2>Oh Look - Another Pen of Mine!</h2>
                                <p>A few fun modal animations for your enjoyment.</p>
                                <a class="button" href="#" >View the Pen</a>
                            </div>
                        </div>
                    </div>
                    <div id="two" class="week">
                        <div class="day">
                            <span class="date">6</span>
                            <div class="surprise">
                                <h2>A Stellar Podcast</h2>
                                <p>If you're not familiar with Chris Coyier, shame on you. The dude is one of the founders of Codepen, for crying out loud. Anywho, he has a podcast called the Shoptalk Show that is audio gold.</p>
                                <a class="button" href="#" >Listen Now</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">7</span>
                            <div class="surprise">
                                <h2>An Up and Coming Designer</h2>
                                <p>Dan Eden is a prodigious young brit working for Dropbox who has already contributed a large amount to the web design world. He's got a blog that's admittedly not updated often - but what's there is worth your time.
                                </p>
                                <a href="#" class="button" >Visit DanEden.me</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">8</span>
                            <div class="surprise">
                                <h2>Swift for the Masses</h2>
                                <p>For those of you familiar with Swift, Apple's new programming language, it's been an exciting few weeks. Apple, as promised open-sourced Swift, and in response, IBM introduced a cool Swift toy.</p>
                                <a class="button" href="#">Visit the Swift Sandbox</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">9</span>
                            <div class="surprise">
                                <h2>Beautiful Progressive Loading Images</h2>
                                <p>So it seems that we're all after a great solution for smoothly and progressively loaded, large images. There hasn't been a perfect solution presented yet, but this one at CSS Tricks comes close!</p>
                                <a href="#" class="button">Visit CSS Tricks</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">10</span>
                            <div class="surprise">
                                <h2>A Wonderful Web Comic</h2>
                                <p>Jerry King is great - and he does an awesome web comic for WebDesignerDepot every week.</p>
                                <a href="#"  class="button">Visit WebDesignerDepot</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">11</span>
                            <div class="surprise">
                                <h2>CSS Animation Nirvana</h2>
                                <p>While perusing another advent calendar (24ways) I stumbled across an in-progress website that is pretty epic. The guys at Rally Interactive are seriously impressive.</p>
                                <a class="button" href="#" >Visit Their Beta Site</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">12</span>
                            <div class="surprise">
                                <h2>Freelancers, Rejoice</h2>
                                <p>One of the most integral pieces of a freelance business is your billing. I've been using Hiveage since it was called Curdbee, and love it. It's not as ubiquitous as it should be, but you should definitely check it out.</p>
                                <a class="button" href="#" >Visit Hiveage</a>
                            </div>
                        </div>
                    </div>
                    <div id="three" class="week">
                        <div class="day">
                            <span class="date">13</span>
                            <div class="surprise">
                                <h2>A Designer's CMS</h2>
                                <p>While there are a slew of full-featured, easy-to-use CMS options out there, my personal preference is a lesser known one called MODX. If you take the time to get into it, you can do almost anything you want with relative ease.</p>
                                <a class="button" href="#" >Visit MODX.com</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">14</span>
                            <div class="surprise">
                                <h2>A MODX Helping Hand</h2>
                                <p>To aid in my CMS suggestion from yesterday, one of the best MODX resources is MODX.today. You should give it a look!</p>
                                <a class="button" href="#" >Visit MODX.today</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">15</span>
                            <div class="surprise">
                                <h2>Begin at the Beginning: Part 1</h2>
                                <p>Jon Duckett has a <strong>fantastic</strong> series of books on the basic technology involved in front-end web design. Here's the first.</p>
                                <a class="button" href="#" >Buy Javascript & Jquery: Interactive Front-End <br>Web Development</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">16</span>
                            <div class="surprise">
                                <h2>Begin at the Beginning: Part 2</h2>
                                <p>Jon Duckett has a <strong>fantastic</strong> series of books on the basic technology involved in front-end web design. Here's the second.</p>
                                <a class="button" href="#" >Buy HTML and CSS: Design and Build Websites</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">17</span>
                            <div class="surprise">
                                <h2>Looking To Break Into UI Design?</h2>
                                <p>UI-Patterns.com is a fantastic resource for learning and practicing UI design. You should really check it out, even if you don't consider yourself a dyed-in-the-wool UI designer.</p>
                                <a href="#"  class="button">Visit UI-Designs.com</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">18</span>
                            <div class="surprise">
                                <h2>Get to Learning!</h2>
                                <p>If you're just beginning in web design, I've shared a few resources already that should help you build up your fundamentals—but no resource is more effective than Treehouse. They do a fantastic job at making complex concepts easy to understand, and their wealth of material covers much more than just web design.</p>
                                <a href="#"  class="button">Visit Team Treehouse</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">19</span>
                            <div class="surprise">
                                <h2>And Now For Something Completely Random</h2>
                                <p>Most of the things I'm sharing on here are related to web design, but haven't you always wondered what happened to Kevin Mccallister of Home Alone fame? Well, now we know—and it ain't good.</p>
                                <a href="#"  class="button">Watch on YouTube</a>
                            </div>
                        </div>
                    </div>
                    <div id="four" class="week">
                        <div class="day">
                            <span class="date">20</span>
                            <div class="surprise">
                                <h2>Tonight, on 60 Minutes...</h2>
                                <p>You should check out the 60 Minutes segment with Charlie Rose tonight. He's peeking inside of Jony Ive's secret design studio.</p>
                                <a href="#"  class="button">Read the Tweet</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">21</span>
                        </div>
                        <div class="day">
                            <span class="date">22</span>
                        </div>
                        <div class="day">
                            <span class="date">23</span>
                        </div>
                        <div class="day">
                            <span class="date">24</span>
                        </div>
                        <div class="day" >
                            <span class="date">25</span>
                        </div>
                        <div class="day" >
                            <span class="date">26</span>
                        </div>
                    </div>
                    <div id="five" class="week">
                        <div class="day">
                            <span class="date">27</span>
                            <div class="surprise">
                                <h2>Tonight, on 60 Minutes...</h2>
                                <p>You should check out the 60 Minutes segment with Charlie Rose tonight. He's peeking inside of Jony Ive's secret design studio.</p>
                                <a href="#"  class="button">Read the Tweet</a>
                            </div>
                        </div>
                        <div class="day">
                            <span class="date">28</span>
                        </div>
                        <div class="day">
                            <span class="date">29</span>
                        </div>
                        <div class="day">
                            <span class="date">30</span>
                        </div>
                        <div class="day">
                            <span class="date">31</span>
                        </div>
                        <div class="day noDate"></div>
                    </div>
                </section>
            </div> 
        </div>

    </div> 

    <!--Global Javascript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper/popper.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/jquery.validate.min.js"></script> 
    <script src="js/chart.min.js"></script> 
    <script src="js/front.js"></script>

    <!--Core Javascript -->
    <script>
        new Chart(document.getElementById("myChart4").getContext('2d'), {
          type: 'doughnut',
          data: {
            labels: ["M", "T", "W", "T", "F", "S", "S"],
            datasets: [{
              backgroundColor: [
                "#2ecc71",
                "#3498db",
                "#95a5a6",
                "#9b59b6",
                "#f1c40f",
                "#e74c3c",
                "#34495e"
              ],
              data: [12, 19, 3, 17, 28, 24, 7]
            }]
          },
          options: {
              legend: { display: false },
              title: {
                display: true,
                text: ''
               } 
            }
        });
    </script>
    
    <script>
      var d = new Date();
      var todaysDate = d.getDate();
      var target = $('#calendar .week .day .date');
      target.each(function() {
          var day = $(this).html();
          if (todaysDate == day) {
              $(this).addClass('today');
          }
          if (todaysDate < day) {
              $(this).parent().addClass('future');
          }
          if (todaysDate >= day) {
              $(this).parent().addClass('past')
          }
      });

      // handle clicks on days

      $('.day').click(function() {
          if ($(this).hasClass('future')) {
              $('#modal').addClass('active');
              $('#modal .wrapper .content .box').html("<h2>Naughty, naughty.</h2> <p>You can't look early! Check back on that day to see what I've left for you.</p>");
          }
          if ($(this).hasClass('past')) {
              var content = $(this).children('.surprise').html();
              $('#modal').addClass('active');
              $('#modal .wrapper .content .box').html('');
              $('#modal .wrapper .content .box').html(content);
          }
      })

      // close modal

      $('.close').click(function() {
          var ultimateParent = $(this).parent().parent().parent();
          ultimateParent.addClass('moveOut');
          setTimeout(function() {
              ultimateParent.removeClass('moveOut').removeClass('active');
          }, 250);
      })

      // snow effect customizations

      $(document).snowfall({ flakeCount: 100, collection: '.collectonme', maxSpeed: 10 });
    </script> 
</body>

</html>