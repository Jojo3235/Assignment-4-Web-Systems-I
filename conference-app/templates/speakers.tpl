<!DOCTYPE html>
<html lang="en">

  % include('conference-app/templates/head.tpl', title='Speakers - Styles Conference')

  <body>

    <!-- Header -->

    % include('conference-app/templates/header.tpl')

    <!-- Lead -->

    <section class="row-alt">
      <div class="lead container">

        <h1>Speakers</h1>

        <p>We&#8217;re happy to welcome over twenty speakers to present on the industry&#8217;s latest technologies. Prepare for an inspiration extravaganza.</p>

      </div>
    </section>

    <!-- Main content -->

    <section class="row">
      <div class="grid">

% for row in rows:
%include('conference-app/templates/speaker.tpl', row=row)
%end

      </div>
    </section>

    <!-- Footer -->

    % include('conference-app/templates/footer.tpl')

  </body>
</html>