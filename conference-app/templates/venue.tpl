<!DOCTYPE html>
<html lang="en">

  % include('conference-app/templates/head.tpl', title='Venue - Styles Conference')
w
  <body>

    <!-- Header -->

    % include('conference-app/templates/header.tpl')

    <!-- Lead -->

    % include('conference-app/templates/lead.tpl', title = 'Venue', subtitle = 'The conference is held at The Chicago Theatre, a beautiful historical landmark. The conference hotel, Hotel Chicago, is a short walk away down State Street.')

    <!-- Main content -->

    <section class="row">
      <div class="grid">

        <!-- Chicago Theatre -->

        <section class="venue-theatre">

          <div class="col-1-3">
            <h2>Chicago Theatre</h2>
            <p>175 N State St <br> Chicago, IL 60601</p>
            <p><a href="http://www.thechicagotheatre.com/">thechicagotheatre.com</a> <br> (312) 462-6300</p>
          </div><!--

          --><iframe class="venue-map col-2-3" src="https://www.google.com/maps/embed?pb=!1m5!3m3!1m2!1s0x880e2ca55810a493%3A0x4700ddf60fcbfad6!2schicago+theatre!5e0!3m2!1sen!2sus!4v1388701393606"></iframe>

        </section>

        <!-- Hotel Chicago -->

        <section class="venue-hotel">

          <div class="col-1-3">
            <h2>Hotel Chicago</h2>
            <p>333 N Dearborn St <br> Chicago, IL 60654</p>
            <p><a href="http://thehotelchicago.com/">thehotelchicago.com</a> <br> (312) 245-0333</p>
          </div><!--

          --><iframe class="venue-map col-2-3" src="https://www.google.com/maps/embed?pb=!1m5!3m3!1m2!1s0x880e2cb1da049173%3A0xa5c91d255a775f0b!2sHotel+Sax+Chicago%2C+North+Dearborn+Street%2C+Chicago%2C+IL!5e0!3m2!1sen!2sus!4v1388702493978"></iframe>

        </section>

      </div>
    </section>

    <!-- Footer -->

    % include('conference-app/templates/footer.tpl')

  </body>
</html>