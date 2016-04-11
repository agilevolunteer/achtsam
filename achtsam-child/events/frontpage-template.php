<div class="agv-event agv-event--post">
  <a class="agv-event__image" href="#_EVENTURL" title="#_EVENTNAME in #_LOCATIONTOWN">
    #_CATEGORYIMAGE
  </a>
  <h3 class="agv-event__headline">
      #_EVENTLINK
  </h3>

  <div class="agv-event__info">
    <span class="agv-event__dateinfo">
      <i class="fa fa-calendar"></i>
      #_EVENTDATES
      #_24HSTARTTIME
    </span>

    <span class="agv-event__priceinfo">
      <span class="agv-event__priceinfo-value">#_EVENTPRICEMIN</span>
    </span>
  </div>
  <?php
    if (!is_front_page()) {
      ?>
      <div class="agv-event__taxonomy">
          #_EVENTCATEGORIES
          #_EVENTTAGS
      </div>
      <?php
    }
    ?>
  <div class="agv-event__excerpt">
    #_EVENTEXCERPT{25,...}
  </div>

  <div class="agv-event__cta">
    <a href="#_EVENTURL" title="#_EVENTNAME in #_LOCATIONTOWN" class="agv-button">Weiter zur Anmeldung <i class="fa fa-caret-right agv-button__icon"></i></a>
  </div>
</div>
