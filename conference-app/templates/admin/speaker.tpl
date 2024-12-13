<!DOCTYPE html>
<html lang="en">

%  include('conference-app/templates/head.tpl', title='Speakers - Admin')

  <body>

    <!-- Header -->

    % include('conference-app/templates/header.tpl')

    <!-- Lead -->

    % include('conference-app/templates/lead.tpl', title = 'Admin Speaker', subtitle = 'Here you can manage the see the speaker info and update it.')

    <!-- Main content -->

    <section class="row">
      <div class="grid">

        <!-- Details -->

        <section class="col-2-3">

      % include('conference-app/templates/speaker.tpl', row=row)

        </section><!--

        Registration form

        --><form class="col-1-3" action="/admin/speakers/{{row[0]}}" method="post" enctype="multipart/form-data">

          <fieldset class="register-group">

            <label>
              Firstname
              <input type="text" name="firstname" placeholder="First name" value="{{row[1]}}" required>
            </label>

            <label>
              Lastname
              <input type="text" name="lastname" placeholder="Last name" value="{{row[2]}}" required>
            </label>

            <label>
              Tagline
              <input type="text" name="tagline" placeholder="Tagline" value="{{row[3]}}" required>
            </label>

            <label>
                Description
                <textarea name="description" required>{{row[4]}}</textarea>
            </label>

            <label>
                Bio
                <textarea name="bio" required>{{row[5]}}</textarea>
            </label>

            <label>
                Website
                <input type="text" name="website" placeholder="Website" value="{{row[6]}}">
            </label>

            <label>
                Twitter
                <input type="text" name="twitter" placeholder="Twitter" value="{{row[7]}}">
            </label>
            
            <label>
              Select image to upload:
              <input type="file" name="upload" id="upload">
            </label>

            </fieldset>

          <input class="btn btn-default" type="submit" name="submit" value="EDIT">
          

        </form>

      </div>
    </section>

    <!-- Footer -->

  % include('conference-app/templates/footer.tpl')

  </body>
</html>