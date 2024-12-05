<!DOCTYPE html>
<html lang="en">

  %  include('conference-app/templates/head.tpl', title='Styles Conference Home')

  <body>

    <!-- Header -->

    % include('conference-app/templates/header.tpl')

    <!-- Hero -->

    <section class="hero container">

      <h2>Dedicated to the Craft of Building Websites</h2>

      <p>Every year the brightest web designers and front-end developers descend on Chicago to discuss the latest technologies. Join us this August!</p>

      <a class="btn btn-alt" href="register.html">Register Now</a>

    </section>

    <!-- Teasers -->

    <section class="row">
      <div class="grid">

        <!-- Speakers -->

        <section class="teaser col-1-3">
          <h5>Speakers</h5>
          <a href="speakers.html">
            <img src="assets/images/home/speakers.jpg" alt="Professional Speaker">
            <h3>World-Class Speakers</h3>
          </a>
          <p>Joining us from all around the world are over twenty fantastic speakers, here to share their stories.</p>
        </section><!--

        Schedule

        --><section class="teaser col-1-3">
          <h5>Schedule</h5>
          <a href="schedule.html">
            <img src="assets/images/home/schedule.jpg" alt="Conference Attendees">
            <h3>Three Inspiring Days</h3>
          </a>
          <p>Enjoy three inspiring and action-packed days of talks, gatherings, and all-around good times.</p>
        </section><!--

        Venue

        --><section class="teaser col-1-3">
          <h5>Venue</h5>
          <a href="venue.html">
            <img src="assets/images/home/venue.jpg" alt="The Chicago Theatre">
            <h3>The Chicago Theatre</h3>
          </a>
          <p>Within the heart of downtown Chicago, The Chicago Theatre will provide a beautiful conference venue.</p>
        </section>

      </div>
    </section>

    <!-- Footer -->
    % include('conference-app/templates/footer.tpl')
  </body>
</html>