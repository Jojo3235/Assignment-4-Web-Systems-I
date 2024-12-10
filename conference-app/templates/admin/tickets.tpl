<!DOCTYPE html>
<html lang="en">

%  include('conference-app/templates/head.tpl', title='Register - Admin')

  <body>

    <!-- Header -->

    % include('conference-app/templates/header.tpl')

    <!-- Lead -->

    % include('conference-app/templates/lead.tpl', title = 'Admin  Tickets', subtitle = 'Here you can manage the tickets bought by the attendees.')

    <!-- Main content -->

    <section class="row">
      <div class="grid">

        <!-- Details -->

        <section class="col-2-3">
            <table>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Quantity</th>
                    <th>Comments</th>
                </tr>

% for row in rows:

                <tr>
                    <td>{{row[1]}}</td>
                    <td>{{row[2]}}</td>
                    <td>{{row[3]}}</td>
                    <td>{{row[4]}}</td>
                </tr>

%end
            <table>
        </section><!--

        Registration form

        --><form class="col-1-3" action="/admin/tickets" method="post">

          <fieldset class="register-group">

            <label>
              Name
              <input type="text" name="name" placeholder="Full name" required>
            </label>

            <label>
              Email
              <input type="email" name="email" placeholder="Email address" required>
            </label>

            <label>
              Number of Passes
              <select name="quantity" required>
                <option value="1" selected>1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </label>

            <label>
              Comments
              <textarea name="comments"></textarea>
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