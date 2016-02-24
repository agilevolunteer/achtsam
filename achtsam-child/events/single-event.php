<article class="agv-singleEvent">
  <h1 class="agv-singleEvent__headline">#_EVENTNAME</h1>
  <div class="agv-singleEvent__main">
    <div class="agv-singleEvent__content">
      <span class="agv-singleEvent__image">
          <img src="#_CATEGORYIMAGEURL" alt="#_EVENTNAME" />
      </span>
      <span class="agv-singleEvent__description">
        #_EVENTNOTES
      </span>

    </div>
    <div class="agv-singleEvent__details">
      <div class="agv-event__taxonomy">
          #_EVENTCATEGORIES
          #_EVENTTAGS
      </div>
      <div class="agv-singleEvent__dateinfo#@_{ \t\o}">
        <i class="fa fa-calendar"></i>
        <!-- von #_EVENTDATES
        #_24HSTARTTIME -->

        #d.#m.#Y #@_{ \b\i\s\ d.m.Y}<br />
        #_24HSTARTTIME Uhr
      </div>
      <div class="agv-singleEvent__priceinfo">
        ab <span class="agv-singleEvent__priceinfo-value">#_EVENTPRICEMIN</span>
      </div>
      {has_bookings}
      <div class="agv-event__cta">
        <a href="#booking" class="agv-button agv-button--full">Anmelden <i class="fa fa-caret-right agv-button__icon"></i></a>
      </div>
      {/has_bookings}
      <div class="agv-singleEvent__address">
        <strong>Adresse</strong><br/>
        #_LOCATIONNAME <br />
        #_LOCATIONADDRESS <br />
        #_LOCATIONPOSTCODE #_LOCATIONTOWN<br />
      </div>

    </div>
  </div>
  {has_bookings}
  <div class="agv-singleEvent__booking">
    <a name="booking"></a>

    <h3>Teilnehmen in #_LOCATIONTOWN</h3>
    #_BOOKINGFORM
  </div>
  {/has_bookings}
</article>
