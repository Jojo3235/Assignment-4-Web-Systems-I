<!DOCTYPE html>
<html lang="en">

%  include('conference-app/templates/head.tpl', title='Speakers - Admin')

  <body>

    <!-- Header -->

    % include('conference-app/templates/header.tpl')

    <!-- Lead -->

    % include('conference-app/templates/lead.tpl', title = 'Admin Speakers', subtitle = 'Here you can manage the speakers attending the conference.')

    <!-- Main content -->

    <section class="row">
      <div class="grid">

        <!-- Details -->

        <section class="col-2-3">
            <table>
                <tr>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Avatar</th>
                    <th>website</th>
                    <th></th>
                    <th></th>
                </tr>

% for row in rows:

                <tr>
                    <td>{{row[1]}}</td>
                    <td>{{row[2]}}</td>
                    <td>avatar</td>
                    <td>{{row[3]}}</td>
                    <td><a href="/admin/speakers/{{row[0]}}"></a></td>
                    <td><a href="/admin/speakers/{{row[0]}}/delete"></a></td>
                </tr>

%end
            <table>
        </section><!--

        Registration form

        --><form class="col-1-3" action="/admin/speakers" method="post">

          <fieldset class="register-group">

            <label>
              Firstname
              <input type="text" name="firstname" placeholder="First name" required>
            </label>

            <label>
              Lastname
              <input type="text" name="lastname" placeholder="Last name" required>
            </label>

            <label>
              Tagline
              <input type="text" name="tagline" placeholder="Tagline" required>
            </label>

            <label>
                Description
                <textarea name="description" required></textarea>
            </label>

            <label>
                Bio
                <textarea name="bio" required></textarea>
            </label>

            <label>
                Website
                <input type="text" name="website" placeholder="Website">
            </label>

            <label>
                Twitter
                <input type="text" name="twitter" placeholder="Twitter">
            </label>

            </fieldset>

          <input class="btn btn-default" type="submit" name="submit" value="Purchase">

        </form>

      </div>
    </section>

    <!-- Footer -->

% include('conference-app/templates/footer.tpl')

  </body>
</html>