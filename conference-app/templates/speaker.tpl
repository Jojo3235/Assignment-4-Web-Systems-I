  <section class="speaker" id="{{row[1]}}-{{row[2]}}">

    <div class="col-2-3">

      <h2>{{row[1]}} {{row[2]}}</h2>
      <h5>{{row[3]}}</h5>

      <p>{{row[4]}}</p>
      
      <h5>About {{row[1]}}</h5>

      <p>{{row[5]}}</p>

    </div><!--

    --><aside class="col-1-3">
      <div class="speaker-info">

        <img style="height:150px;width:150px;object-fit: cover; border-radius: 50%;" src="/assets/images/speakers/{{row[1].strip().lower().replace(' ', '-')}}-{{row[2].strip().lower().replace(' ', '-')}}.jpg" alt="{{row[1]}} {{row[2]}}">

        <ul>
          <li><a href="{{row[6]}}">{{row[6]}}</a></li>
          <li><a href="{{row[7]}}">{{row[7]}}</a></li>
        </ul> 

      </div>
    </aside>

  </section>
