<!DOCTYPE html>
<html lang="en">

  % include('conference-app/templates/head.tpl', title='Speakers - Styles Conference')

  <body>

    <!-- Header -->

    % include('conference-app/templates/header.tpl')

    <!-- Lead -->

    % include('conference-app/templates/lead.tpl', title = 'Speakers', subtitle = 'Meet the speakers who will be presenting at the conference.')

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