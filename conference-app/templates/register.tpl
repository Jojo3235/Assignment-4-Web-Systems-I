<!DOCTYPE html>
<html lang="en">

%  include('conference-app/templates/head.tpl', title='Register - Styles Conference')

  <body>

    <!-- Header -->

    % include('conference-app/templates/header.tpl')

    <!-- Lead -->

    <section class="row-alt">
      <div class="lead container">

        <h1>Register</h1>

        <p>Every year we aim to have an unbelievable time, and this year we&#8217;d love it for you to join us. Conference passes only cost $99, one of the best values you&#8217;ll find.</p>

      </div>
    </section>

    <!-- Main content -->

    <section class="row">
      <div class="grid">

        <!-- Details -->

        <section class="col-2-3">

          <h2>Purchase a Conference Pass</h2>
          <h5>$99 per Pass</h5>

          <p>Purchase your Styles Conference pass using the form to the right. Multiple passes may be purchased within the same order, so feel free to bring a friend or two along. Once your order is finished we&#8217;ll follow up and provide a receipt for your purchase. See you soon!</p>

          <h4>Why Attend?</h4>

          <ul class="why-attend">
            <li>Over twenty world-class speakers</li>
            <li>One full day of workshops and two full days of presentations</li>
            <li>Hosted at The Chicago Theatre, a historical landmark</li>
            <li>August in Chicago is simply amazing</li>
          </ul>

        </section><!--

        Registration form

        --><form class="col-1-3" action="#" method="post">

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